import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import '../models/character.dart' as models;
import '../models/assessment_answer.dart' as models;
import '../models/generated_output.dart';
import '../models/user_profile.dart';
import '../api/api_client.dart' show ApiClient, CharacterValidationException;
import '../utils/fixture_loader.dart';
import '../utils/constants.dart';
import '../config/app_config.dart';
import 'local_db.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  // Use AppConfig for environment-based configuration
  return ApiClient(
    baseUrl: AppConfig.apiBaseUrl,
    useMock: AppConfig.useMock,
  );
});

final userProfileRepositoryProvider = StateNotifierProvider<UserProfileRepository, AsyncValue<UserProfile?>>((ref) {
  return UserProfileRepository(ref);
});

class UserProfileRepository extends StateNotifier<AsyncValue<UserProfile?>> {
  final Ref ref;

  UserProfileRepository(this.ref) : super(const AsyncValue.loading()) {
    _loadProfile();
  }


  Future<void> _loadProfile() async {
    try {
      final db = ref.read(appDatabaseProvider);
      final profile = await db.loadProfile();
      state = AsyncValue.data(profile);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> saveCharacters(List<models.Character> characters) async {
    final current = state.valueOrNull;
    final profile = current ?? UserProfile(
      id: const Uuid().v4(),
      characters: [],
    );
    
    final updated = profile.copyWith(
      characters: characters,
      lastUpdated: DateTime.now(),
      // Clear cached output when characters change to force regeneration
      cachedOutput: null,
    );
    
    final db = ref.read(appDatabaseProvider);
    await db.saveProfile(updated);
    
    state = AsyncValue.data(updated);
    
    // Save to backend
    final apiClient = ref.read(apiClientProvider);
    if (!apiClient.useMock) {
      try {
        print('💾 Saving ${characters.length} characters to backend...');
        await apiClient.updateProfile(characters);
        print('✅ Characters saved to backend successfully');
      } catch (e) {
        print('❌ Failed to update profile on backend: $e');
        // Don't throw - continue with local save
      }
    }
    
    // Clear output repository cache and trigger regeneration
    ref.read(outputRepositoryProvider.notifier).clearCache();
    ref.read(outputRepositoryProvider.notifier).regenerate();
  }

  Future<void> saveAssessmentAnswer(models.AssessmentAnswer answer) async {
    final current = state.valueOrNull;
    if (current == null) return;
    
    final existingAnswers = current.answers.where(
      (a) => a.assessmentType != answer.assessmentType || 
             a.questionId != answer.questionId,
    ).toList();
    
    final updated = current.copyWith(
      answers: [...existingAnswers, answer],
      lastUpdated: DateTime.now(),
      // Clear cached output when answers change to force regeneration
      cachedOutput: null,
    );
    
    final db = ref.read(appDatabaseProvider);
    await db.saveProfile(updated);
    
    state = AsyncValue.data(updated);
    
    // Save to backend
    final apiClient = ref.read(apiClientProvider);
    if (!apiClient.useMock) {
      try {
        print('Submitting assessment answer to backend...');
        await apiClient.submitAssessmentAnswer(answer);
        print('Assessment answer saved to backend successfully');
      } catch (e) {
        print('Failed to submit assessment answer on backend: $e');
        // Don't throw - continue with local save
      }
    }
    
    // Clear output repository cache and trigger regeneration
    ref.read(outputRepositoryProvider.notifier).clearCache();
    ref.read(outputRepositoryProvider.notifier).regenerate();
  }

  Future<void> clearProfile() async {
    final db = ref.read(appDatabaseProvider);
    await db.saveProfile(UserProfile(
      id: const Uuid().v4(),
      characters: [],
    ));
    state = const AsyncValue.data(null);
    
    // Also clear output repository
    ref.read(outputRepositoryProvider.notifier).clearCache();
  }
  
  // Method to force refresh from backend (useful for testing)
  Future<void> forceRefreshFromBackend() async {
    final db = ref.read(appDatabaseProvider);
    final current = state.valueOrNull;
    if (current != null) {
      // Clear cached output to force backend call
      final cleared = current.copyWith(cachedOutput: null);
      await db.saveProfile(cleared);
      state = AsyncValue.data(cleared);
    }
    // Trigger regeneration which will call backend
    ref.read(outputRepositoryProvider.notifier).clearCache();
    ref.read(outputRepositoryProvider.notifier).regenerate();
  }
}

final outputRepositoryProvider = StateNotifierProvider<OutputRepository, AsyncValue<GeneratedOutput?>>((ref) {
  return OutputRepository(ref);
});

class OutputRepository extends StateNotifier<AsyncValue<GeneratedOutput?>> {
  final Ref ref;
  Timer? _regenerationTimer;

  OutputRepository(this.ref) : super(const AsyncValue.loading()) {
    _loadOutput();
  }

  Future<void> _loadOutput() async {
    try {
      final profileAsync = ref.read(userProfileRepositoryProvider);
      final profile = profileAsync.valueOrNull;
      final apiClient = ref.read(apiClientProvider);
      
      print('📥 _loadOutput: useMock=${apiClient.useMock}, characters=${profile?.characters.length}');
      
      // If using backend, always try to load from backend first
      if (!apiClient.useMock && profile?.characters.length == AppConstants.requiredCharacterCount) {
        print('🌐 Attempting to load from backend...');
        try {
          // Try to get cached output from backend
          print('📡 Checking for cached output on backend...');
          final cached = await apiClient.getCachedOutput();
          if (cached != null) {
            print('✅ Found cached output on backend');
            state = AsyncValue.data(cached);
            // Also update local cache
            final updated = profile!.copyWith(cachedOutput: cached);
            final db = ref.read(appDatabaseProvider);
            await db.saveProfile(updated);
            return;
          }
          
          // If no cached output, generate new one
          print('🔄 No cached output, generating new output from backend...');
          final output = await apiClient.generateOutput(force: false);
          print('✅ Generated output from backend');
          state = AsyncValue.data(output);
          // Update local cache
          final updated = profile!.copyWith(cachedOutput: output);
          final db = ref.read(appDatabaseProvider);
          await db.saveProfile(updated);
          return;
        } catch (e, stack) {
          print('❌ Backend error in _loadOutput: $e');
          print('Stack: $stack');
          // If backend fails, try local cache as fallback
          if (profile?.cachedOutput != null) {
            print('⚠️ Using local cached output as fallback');
            state = AsyncValue.data(profile!.cachedOutput);
            return;
          }
          // If no local cache either, show error
          state = AsyncValue.error(e, stack);
          return;
        }
      }
      
      // Use local cached output if available (for offline/mock mode)
      if (profile?.cachedOutput != null) {
        print('📦 Using local cached output');
        state = AsyncValue.data(profile!.cachedOutput);
        return;
      }
      
      // Only fallback to fixture in mock mode
      if (apiClient.useMock && profile?.characters.length == AppConstants.requiredCharacterCount) {
        print('🎭 Using fixture (mock mode)');
        final output = await FixtureLoader.loadFixture();
        state = AsyncValue.data(output);
        return;
      }
      
      print('ℹ️ No output available');
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      print('❌ Error in _loadOutput: $e');
      state = AsyncValue.error(e, stack);
    }
  }

  void clearCache() {
    state = const AsyncValue.loading();
  }

  void regenerate() {
    _regenerationTimer?.cancel();
    _regenerationTimer = Timer(
      const Duration(milliseconds: AppConstants.regenerationDebounceMs),
      () async {
        try {
          state = const AsyncValue.loading();
          
          final profileAsync = ref.read(userProfileRepositoryProvider);
          final profile = profileAsync.valueOrNull;
          if (profile == null || profile.characters.length != AppConstants.requiredCharacterCount) {
            state = const AsyncValue.data(null);
            return;
          }
          
          final apiClient = ref.read(apiClientProvider);
          GeneratedOutput output;
          
          // Call backend API if not in mock mode
          if (!apiClient.useMock) {
            try {
              print('🔄 Calling backend to generate output with ${profile.characters.length} characters...');
              // Force regeneration to get fresh output based on current inputs
              output = await apiClient.generateOutput(force: true);
              print('✅ Backend generated output successfully');
            } catch (e, stack) {
              print('❌ Backend generation failed: $e');
              print('Stack: $stack');
              
              // Handle character validation errors gracefully
              if (e is CharacterValidationException || 
                  (e.toString().contains('not recognized') || 
                   e.toString().contains('proper character names'))) {
                // Show user-friendly error message
                state = AsyncValue.error(e, stack);
                return;
              }
              
              // Show error but don't crash - set error state so UI can show it
              state = AsyncValue.error(e, stack);
              return;
            }
          } else {
            // Use fixture in mock mode
            output = await FixtureLoader.loadFixture();
          }
          
          // Update profile with new output
          final updated = profile.copyWith(cachedOutput: output);
          final db = ref.read(appDatabaseProvider);
          await db.saveProfile(updated);
          
          state = AsyncValue.data(output);
          print('✅ Output updated and cached');
        } catch (e, stack) {
          print('❌ Regeneration error: $e');
          state = AsyncValue.error(e, stack);
        }
      },
    );
  }
}
