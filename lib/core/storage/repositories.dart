import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../models/character.dart' as models;
import '../models/assessment_answer.dart' as models;
import '../models/generated_output.dart';
import '../models/generation_job.dart';
import '../models/user_profile.dart';
import '../models/relationship.dart';
import '../models/resonance.dart';
import '../models/tone.dart';
import '../models/constellation.dart';
import '../models/psyche_model.dart';
import '../models/user.dart';
import '../api/api_client.dart' show ApiClient, CharacterValidationException;
import '../utils/fixture_loader.dart';
import '../utils/constants.dart';
import '../config/app_config.dart';
import 'local_db.dart';

// ============================================================================
// GENERATION PROGRESS TRACKING
// ============================================================================

/// State for generation progress
class GenerationProgressState {
  final bool isGenerating;
  final int currentStep;
  final int totalSteps;
  final String stepLabel;
  final int progressPercent;

  const GenerationProgressState({
    this.isGenerating = false,
    this.currentStep = 0,
    this.totalSteps = 6,
    this.stepLabel = '',
    this.progressPercent = 0,
  });

  GenerationProgressState copyWith({
    bool? isGenerating,
    int? currentStep,
    int? totalSteps,
    String? stepLabel,
    int? progressPercent,
  }) {
    return GenerationProgressState(
      isGenerating: isGenerating ?? this.isGenerating,
      currentStep: currentStep ?? this.currentStep,
      totalSteps: totalSteps ?? this.totalSteps,
      stepLabel: stepLabel ?? this.stepLabel,
      progressPercent: progressPercent ?? this.progressPercent,
    );
  }
}

/// Provider for generation progress - UI can listen to this
final generationProgressProvider = StateNotifierProvider<GenerationProgressNotifier, GenerationProgressState>((ref) {
  return GenerationProgressNotifier();
});

class GenerationProgressNotifier extends StateNotifier<GenerationProgressState> {
  GenerationProgressNotifier() : super(const GenerationProgressState());

  void startGeneration() {
    state = const GenerationProgressState(
      isGenerating: true,
      currentStep: 0,
      totalSteps: 6,
      stepLabel: 'Starting...',
      progressPercent: 0,
    );
  }

  void updateProgress(int currentStep, int totalSteps, String stepLabel) {
    final percent = totalSteps > 0 ? ((currentStep / totalSteps) * 100).round() : 0;
    state = GenerationProgressState(
      isGenerating: true,
      currentStep: currentStep,
      totalSteps: totalSteps,
      stepLabel: stepLabel,
      progressPercent: percent,
    );
  }

  void completeGeneration() {
    state = const GenerationProgressState(
      isGenerating: false,
      currentStep: 6,
      totalSteps: 6,
      stepLabel: 'Complete!',
      progressPercent: 100,
    );
  }

  void failGeneration(String error) {
    state = GenerationProgressState(
      isGenerating: false,
      currentStep: state.currentStep,
      totalSteps: state.totalSteps,
      stepLabel: 'Failed: $error',
      progressPercent: state.progressPercent,
    );
  }

  void reset() {
    state = const GenerationProgressState();
  }
}

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

// ============================================================================
// USER SESSION MANAGEMENT
// ============================================================================

/// State for user session
class UserSessionState {
  final AppUser? user;
  final bool isLoading;
  final String? error;
  final bool hasExistingData;
  final DataSummary? dataSummary;

  const UserSessionState({
    this.user,
    this.isLoading = false,
    this.error,
    this.hasExistingData = false,
    this.dataSummary,
  });

  UserSessionState copyWith({
    AppUser? user,
    bool? isLoading,
    String? error,
    bool? hasExistingData,
    DataSummary? dataSummary,
    bool clearUser = false,
    bool clearError = false,
  }) {
    return UserSessionState(
      user: clearUser ? null : (user ?? this.user),
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      hasExistingData: hasExistingData ?? this.hasExistingData,
      dataSummary: dataSummary ?? this.dataSummary,
    );
  }

  bool get isLoggedIn => user != null;
}

final userSessionProvider = StateNotifierProvider<UserSessionRepository, UserSessionState>((ref) {
  return UserSessionRepository(ref);
});

class UserSessionRepository extends StateNotifier<UserSessionState> {
  final Ref ref;
  static const String _userIdKey = 'current_user_id';
  static const String _usernameKey = 'current_username';
  static const String _displayNameKey = 'current_display_name';

  UserSessionRepository(this.ref) : super(const UserSessionState()) {
    _loadSavedSession();
  }

  /// Load any saved session from local storage
  Future<void> _loadSavedSession() async {
    state = state.copyWith(isLoading: true, clearError: true);
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedUserId = prefs.getString(_userIdKey);
      final savedUsername = prefs.getString(_usernameKey);
      final savedDisplayName = prefs.getString(_displayNameKey);
      
      if (savedUserId != null && savedUsername != null) {
        print('[UserSession] Found saved session: $savedUsername ($savedUserId)');
        
        // Set the user ID on the API client
        final apiClient = ref.read(apiClientProvider);
        apiClient.setUserId(savedUserId);
        
        // Create user from saved data
        final user = AppUser(
          id: savedUserId,
          username: savedUsername,
          displayName: savedDisplayName ?? savedUsername,
        );
        
        // Try to get fresh status from backend - MUST succeed for session restore
        try {
          final status = await apiClient.getUserStatus();
          state = UserSessionState(
            user: user,
            isLoading: false,
            hasExistingData: status.data.hasMeOutput,
            dataSummary: DataSummary(
              characterCount: status.data.characterCount,
              hasStory: status.data.hasMeOutput,
              hasRelationship: status.data.hasRelationshipOutput,
              lastUpdated: status.data.lastUpdated,
            ),
          );
          print('[UserSession] Session restored with fresh status');
          
          // If returning user with data, sync from backend
          if (status.data.hasMeOutput) {
            await _syncFromBackend();
          }
        } catch (e) {
          // ANY error when restoring session = clear and force re-login
          // This ensures stale sessions from wrong API URLs don't persist
          print('[UserSession] Backend validation failed - clearing saved session: $e');
          await prefs.remove(_userIdKey);
          await prefs.remove(_usernameKey);
          await prefs.remove(_displayNameKey);
          apiClient.clearUserId();
          state = const UserSessionState(isLoading: false);
          return;
        }
      } else {
        print('[UserSession] No saved session found');
        state = const UserSessionState(isLoading: false);
      }
    } catch (e) {
      print('[UserSession] Error loading saved session: $e');
      state = UserSessionState(isLoading: false, error: 'Failed to load session');
    }
  }

  /// Login with a username (creates user if new)
  Future<bool> login(String username) async {
    if (username.trim().length < 2) {
      state = state.copyWith(error: 'Username must be at least 2 characters');
      return false;
    }

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final apiClient = ref.read(apiClientProvider);
      final prefs = await SharedPreferences.getInstance();
      
      // Clear any old session data first to avoid conflicts
      await prefs.remove(_userIdKey);
      await prefs.remove(_usernameKey);
      await prefs.remove(_displayNameKey);
      apiClient.clearUserId();
      
      final response = await apiClient.login(username.trim());

      // Save session locally
      await prefs.setString(_userIdKey, response.user.id);
      await prefs.setString(_usernameKey, response.user.username);
      await prefs.setString(_displayNameKey, response.user.displayName);

      state = UserSessionState(
        user: response.user,
        isLoading: false,
        hasExistingData: response.hasExistingData,
        dataSummary: response.dataSummary,
      );

      print('[UserSession] Logged in: ${response.user.displayName} (returning: ${response.isReturningUser}, hasData: ${response.hasExistingData})');
      
      // If returning user with existing data, sync from backend
      if (response.hasExistingData) {
        await _syncFromBackend();
      }

      return true;
    } catch (e) {
      print('[UserSession] Login failed: $e');
      state = state.copyWith(
        isLoading: false,
        error: 'Login failed. Please try again.',
      );
      return false;
    }
  }

  /// Sync data from backend for returning user
  Future<void> _syncFromBackend() async {
    try {
      print('[UserSession] Syncing data from backend...');
      final apiClient = ref.read(apiClientProvider);
      final syncData = await apiClient.syncUserData();
      
      // Set the Me output directly if available
      if (syncData.meOutput != null) {
        print('[UserSession] Setting Me output from sync');
        ref.read(outputRepositoryProvider.notifier).setFromSync(syncData.meOutput!);
      }
      
      // Set relationship settings if available
      if (syncData.relationshipSettings != null && syncData.relationshipSettings!.enabled) {
        print('[UserSession] Setting relationship from sync');
        await ref.read(relationshipRepositoryProvider.notifier).setFromSync(
          enabled: true,
          type: syncData.relationshipSettings!.type,
        );
        
        // Set relationship output if available
        if (syncData.relationshipOutput != null) {
          ref.read(relationshipOutputRepositoryProvider.notifier).setFromSync(syncData.relationshipOutput!);
        }
      }
      
      print('[UserSession] Sync complete');
    } catch (e) {
      print('[UserSession] Failed to sync from backend: $e');
      // Don't fail the session restore if sync fails
    }
  }

  /// Logout - clear session
  Future<void> logout() async {
    final apiClient = ref.read(apiClientProvider);
    apiClient.clearUserId();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_usernameKey);
    await prefs.remove(_displayNameKey);

    // Clear all cached data
    ref.read(outputRepositoryProvider.notifier).clearCache();
    ref.read(relationshipOutputRepositoryProvider.notifier).clearCache();

    state = const UserSessionState();
    print('[UserSession] Logged out');
  }

  /// Clear all user data and start fresh
  Future<void> clearDataAndStartFresh() async {
    state = state.copyWith(isLoading: true);

    try {
      final apiClient = ref.read(apiClientProvider);
      await apiClient.clearUserData();

      // Clear local caches
      ref.read(outputRepositoryProvider.notifier).clearCache();
      ref.read(relationshipOutputRepositoryProvider.notifier).clearCache();

      state = state.copyWith(
        isLoading: false,
        hasExistingData: false,
        dataSummary: null,
      );

      print('[UserSession] User data cleared, starting fresh');
    } catch (e) {
      print('[UserSession] Failed to clear data: $e');
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to clear data. Please try again.',
      );
    }
  }

  /// Clear any error message
  void clearError() {
    state = state.copyWith(clearError: true);
  }
}

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
  bool _isGenerating = false; // Lock to prevent concurrent generation

  OutputRepository(this.ref) : super(const AsyncValue.loading()) {
    _loadOutput();
  }

  Future<void> _loadOutput() async {
    // Prevent concurrent generation
    if (_isGenerating) {
      print('⏳ _loadOutput: Generation already in progress, skipping');
      return;
    }
    
    try {
      final profileAsync = ref.read(userProfileRepositoryProvider);
      final profile = profileAsync.valueOrNull;
      final apiClient = ref.read(apiClientProvider);
      
      print('📥 _loadOutput: useMock=${apiClient.useMock}, characters=${profile?.characters.length}');
      
      // If using backend, always try to load from backend first (4-6 characters)
      if (!apiClient.useMock && 
          profile != null && 
          profile.characters.length >= AppConstants.minCharacterCount &&
          profile.characters.length <= AppConstants.maxCharacterCount) {
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
          
          // If no cached output, generate new one (with lock)
          _isGenerating = true;
          print('🔄 No cached output, generating new output from backend...');
          
          // Start progress tracking
          final progressNotifier = ref.read(generationProgressProvider.notifier);
          progressNotifier.startGeneration();
          
          try {
            final output = await apiClient.generateOutput(
              force: false,
              onProgress: (step, total, label) {
                progressNotifier.updateProgress(step, total, label);
              },
            );
            _isGenerating = false;
            progressNotifier.completeGeneration();
            print('✅ Generated output from backend');
            state = AsyncValue.data(output);
            // Update local cache
            final updated = profile!.copyWith(cachedOutput: output);
            final db = ref.read(appDatabaseProvider);
            await db.saveProfile(updated);
            return;
          } catch (genError) {
            _isGenerating = false;
            progressNotifier.failGeneration(genError.toString());
            rethrow;
          }
        } catch (e, stack) {
          _isGenerating = false;
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
      if (apiClient.useMock && 
          profile != null && 
          profile.characters.length >= AppConstants.minCharacterCount) {
        print('🎭 Using fixture (mock mode)');
        final output = await FixtureLoader.loadFixture();
        state = AsyncValue.data(output);
        return;
      }
      
      print('ℹ️ No output available');
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      _isGenerating = false;
      print('❌ Error in _loadOutput: $e');
      state = AsyncValue.error(e, stack);
    }
  }

  void clearCache() {
    state = const AsyncValue.loading();
  }

  /// Set output directly from sync data (when restoring session)
  void setFromSync(GeneratedOutput output) {
    print('[OutputRepository] Setting output from sync');
    state = AsyncValue.data(output);
  }

  void regenerate() {
    _regenerationTimer?.cancel();
    _regenerationTimer = Timer(
      const Duration(milliseconds: AppConstants.regenerationDebounceMs),
      () async {
        // Prevent concurrent generation
        if (_isGenerating) {
          print('⏳ regenerate: Generation already in progress, skipping');
          return;
        }
        
        try {
          state = const AsyncValue.loading();
          
          final profileAsync = ref.read(userProfileRepositoryProvider);
          final profile = profileAsync.valueOrNull;
          if (profile == null || 
              profile.characters.length < AppConstants.minCharacterCount ||
              profile.characters.length > AppConstants.maxCharacterCount) {
            state = const AsyncValue.data(null);
            return;
          }
          
          final apiClient = ref.read(apiClientProvider);
          GeneratedOutput output;
          
          // Call backend API if not in mock mode
          if (!apiClient.useMock) {
            // Start progress tracking
            final progressNotifier = ref.read(generationProgressProvider.notifier);
            progressNotifier.startGeneration();
            
            try {
              _isGenerating = true;
              print('🔄 Calling backend to generate output with ${profile.characters.length} characters...');
              // Force regeneration to get fresh output based on current inputs
              output = await apiClient.generateOutput(
                force: true,
                onProgress: (step, total, label) {
                  progressNotifier.updateProgress(step, total, label);
                },
              );
              _isGenerating = false;
              progressNotifier.completeGeneration();
              print('✅ Backend generated output successfully');
            } catch (e, stack) {
              _isGenerating = false;
              progressNotifier.failGeneration(e.toString());
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
          
          // Invalidate constellation provider to refetch with new data
          ref.invalidate(meConstellationProvider);
        } catch (e, stack) {
          _isGenerating = false;
          print('❌ Regeneration error: $e');
          state = AsyncValue.error(e, stack);
        }
      },
    );
  }
}

// ============================================================================
// RELATIONSHIP REPOSITORY (Independent from Me)
// ============================================================================

final relationshipRepositoryProvider = StateNotifierProvider<RelationshipRepository, AsyncValue<RelationshipCharacterSet?>>((ref) {
  return RelationshipRepository(ref);
});

class RelationshipRepository extends StateNotifier<AsyncValue<RelationshipCharacterSet?>> {
  final Ref ref;

  RelationshipRepository(this.ref) : super(const AsyncValue.loading()) {
    _loadRelationship();
  }

  Future<void> _loadRelationship() async {
    try {
      final db = ref.read(appDatabaseProvider);
      final relationship = await db.loadRelationship();
      state = AsyncValue.data(relationship);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> saveRelationship({
    required bool enabled,
    required String relationshipType,
    required List<models.Character> otherCharacters,
  }) async {
    final relationship = RelationshipCharacterSet(
      userId: 'default-user',
      enabled: enabled,
      relationshipType: relationshipType,
      otherLabel: relationshipType == 'romantic' ? 'partner' : 'friend',
      characters: otherCharacters,
      rawInputs: otherCharacters.map((c) => c.displayName).toList(),
      updatedAt: DateTime.now(),
    );
    
    final db = ref.read(appDatabaseProvider);
    await db.saveRelationship(relationship);
    
    state = AsyncValue.data(relationship);
    
    // Save to backend
    final apiClient = ref.read(apiClientProvider);
    if (!apiClient.useMock) {
      try {
        print('💾 Saving relationship characters to backend...');
        await apiClient.saveRelationshipSet(relationship);
        print('✅ Relationship saved to backend successfully');
      } catch (e) {
        print('❌ Failed to save relationship on backend: $e');
      }
    }
    
    // Trigger relationship output generation
    ref.read(relationshipOutputRepositoryProvider.notifier).regenerate();
  }

  Future<void> disableRelationship() async {
    final current = state.valueOrNull;
    if (current == null) return;
    
    final disabled = current.copyWith(enabled: false);
    
    final db = ref.read(appDatabaseProvider);
    await db.saveRelationship(disabled);
    
    state = AsyncValue.data(disabled);
    
    // Clear relationship output
    ref.read(relationshipOutputRepositoryProvider.notifier).clearCache();
  }

  Future<void> updateRelationshipType(String type) async {
    final current = state.valueOrNull;
    if (current == null) return;
    
    final updated = current.copyWith(
      relationshipType: type,
      otherLabel: type == 'romantic' ? 'partner' : 'friend',
      updatedAt: DateTime.now(),
    );
    
    final db = ref.read(appDatabaseProvider);
    await db.saveRelationship(updated);
    
    state = AsyncValue.data(updated);
    
    // Trigger regeneration with new type
    ref.read(relationshipOutputRepositoryProvider.notifier).regenerate();
  }

  /// Set relationship settings from sync data (when restoring session)
  Future<void> setFromSync({required bool enabled, required String type}) async {
    print('[RelationshipRepository] Setting from sync: enabled=$enabled, type=$type');
    
    final relationship = RelationshipCharacterSet(
      userId: 'default-user',
      enabled: enabled,
      relationshipType: type,
      otherLabel: type == 'romantic' ? 'partner' : 'friend',
      characters: [], // Characters will come from output
      rawInputs: [],
      updatedAt: DateTime.now(),
    );
    
    final db = ref.read(appDatabaseProvider);
    await db.saveRelationship(relationship);
    
    state = AsyncValue.data(relationship);
  }
}

// ============================================================================
// RELATIONSHIP OUTPUT REPOSITORY (Independent from Me Output)
// ============================================================================

final relationshipOutputRepositoryProvider = StateNotifierProvider<RelationshipOutputRepository, AsyncValue<RelationshipOutput?>>((ref) {
  return RelationshipOutputRepository(ref);
});

class RelationshipOutputRepository extends StateNotifier<AsyncValue<RelationshipOutput?>> {
  final Ref ref;
  Timer? _regenerationTimer;

  RelationshipOutputRepository(this.ref) : super(const AsyncValue.loading()) {
    _loadOutput();
  }

  Future<void> _loadOutput() async {
    try {
      final relationshipAsync = ref.read(relationshipRepositoryProvider);
      final relationship = relationshipAsync.valueOrNull;
      final apiClient = ref.read(apiClientProvider);
      
      print('📥 [Relationship] _loadOutput: enabled=${relationship?.enabled}, characters=${relationship?.characters.length}');
      
      // Only load if relationship is enabled and has enough characters
      if (relationship == null || 
          !relationship.enabled || 
          relationship.characters.length < AppConstants.minRelationshipCharacterCount) {
        print('ℹ️ [Relationship] Not enabled or insufficient characters');
        state = const AsyncValue.data(null);
        return;
      }
      
      // Load from backend
      if (!apiClient.useMock) {
        print('🌐 [Relationship] Attempting to load from backend...');
        try {
          final cached = await apiClient.getRelationshipOutput();
          if (cached != null) {
            print('✅ [Relationship] Found cached output on backend');
            state = AsyncValue.data(cached);
            return;
          }
          
          // Generate new output with progress tracking
          print('🔄 [Relationship] No cached output, generating...');
          final progressNotifier = ref.read(relationshipProgressProvider.notifier);
          progressNotifier.start();
          
          final output = await apiClient.generateRelationshipOutput(
            force: false,
            onProgress: (currentStep, totalSteps, stepLabel) {
              progressNotifier.updateProgress(currentStep, totalSteps, stepLabel);
            },
          );
          
          progressNotifier.complete();
          print('✅ [Relationship] Generated output from backend');
          state = AsyncValue.data(output);
          return;
        } catch (e, stack) {
          print('❌ [Relationship] Backend error: $e');
          ref.read(relationshipProgressProvider.notifier).error(e.toString());
          state = AsyncValue.error(e, stack);
          return;
        }
      }
      
      print('ℹ️ [Relationship] No output available');
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      print('❌ [Relationship] Error in _loadOutput: $e');
      state = AsyncValue.error(e, stack);
    }
  }

  void clearCache() {
    state = const AsyncValue.loading();
  }

  /// Set output directly from sync data (when restoring session)
  void setFromSync(RelationshipOutput output) {
    print('[RelationshipOutputRepository] Setting output from sync');
    state = AsyncValue.data(output);
  }

  void regenerate() {
    _regenerationTimer?.cancel();
    _regenerationTimer = Timer(
      const Duration(milliseconds: AppConstants.regenerationDebounceMs),
      () async {
        try {
          state = const AsyncValue.loading();
          
          final relationshipAsync = ref.read(relationshipRepositoryProvider);
          final relationship = relationshipAsync.valueOrNull;
          
          if (relationship == null || 
              !relationship.enabled ||
              relationship.characters.length < AppConstants.minRelationshipCharacterCount) {
            state = const AsyncValue.data(null);
            return;
          }
          
          final apiClient = ref.read(apiClientProvider);
          
          if (!apiClient.useMock) {
            try {
              print('🔄 [Relationship] Generating output...');
              final progressNotifier = ref.read(relationshipProgressProvider.notifier);
              progressNotifier.start();
              
              final output = await apiClient.generateRelationshipOutput(
                force: true,
                onProgress: (currentStep, totalSteps, stepLabel) {
                  progressNotifier.updateProgress(currentStep, totalSteps, stepLabel);
                },
              );
              
              progressNotifier.complete();
              print('✅ [Relationship] Backend generated output successfully');
              state = AsyncValue.data(output);
            } catch (e, stack) {
              print('❌ [Relationship] Backend generation failed: $e');
              ref.read(relationshipProgressProvider.notifier).error(e.toString());
              state = AsyncValue.error(e, stack);
              return;
            }
          } else {
            // Mock mode - return null for now
            state = const AsyncValue.data(null);
          }
          
          print('✅ [Relationship] Output updated');
          
          // Invalidate constellation provider to refetch with new data
          ref.invalidate(relationshipConstellationProvider);
        } catch (e, stack) {
          print('❌ [Relationship] Regeneration error: $e');
          state = AsyncValue.error(e, stack);
        }
      },
    );
  }
}

// ============================================================================
// RELATIONSHIP PROGRESS PROVIDER
// ============================================================================

/// Tracks progress of relationship generation (uses same state as Me generation)
final relationshipProgressProvider = StateNotifierProvider<RelationshipProgressNotifier, GenerationProgressState>((ref) {
  return RelationshipProgressNotifier();
});

class RelationshipProgressNotifier extends StateNotifier<GenerationProgressState> {
  RelationshipProgressNotifier() : super(const GenerationProgressState());
  
  void start() {
    state = const GenerationProgressState(
      isGenerating: true,
      currentStep: 0,
      totalSteps: 6,
      stepLabel: 'Starting relationship analysis...',
      progressPercent: 0,
    );
  }
  
  void updateProgress(int currentStep, int totalSteps, String stepLabel) {
    final percent = totalSteps > 0 ? ((currentStep / totalSteps) * 100).round() : 0;
    state = GenerationProgressState(
      isGenerating: true,
      currentStep: currentStep,
      totalSteps: totalSteps,
      stepLabel: stepLabel,
      progressPercent: percent,
    );
  }
  
  void complete() {
    state = const GenerationProgressState(
      isGenerating: false,
      currentStep: 6,
      totalSteps: 6,
      stepLabel: 'Complete!',
      progressPercent: 100,
    );
  }
  
  void error(String message) {
    state = GenerationProgressState(
      isGenerating: false,
      currentStep: state.currentStep,
      totalSteps: state.totalSteps,
      stepLabel: 'Error: $message',
      progressPercent: state.progressPercent,
    );
  }
  
  void clear() {
    state = const GenerationProgressState();
  }
}

// ============================================================================
// RESONANCE REPOSITORY (Character clarification flow)
// ============================================================================

/// State for resonance analysis result
final resonanceAnalysisProvider = StateProvider<ResonanceAnalysisResponse?>((ref) => null);

/// Resonance repository manages the character clarification flow
final resonanceRepositoryProvider = StateNotifierProvider<ResonanceRepository, AsyncValue<ResonanceAnalysisResponse?>>((ref) {
  return ResonanceRepository(ref);
});

class ResonanceRepository extends StateNotifier<AsyncValue<ResonanceAnalysisResponse?>> {
  final Ref ref;

  ResonanceRepository(this.ref) : super(const AsyncValue.data(null));

  /// Analyze characters for ambiguity (legacy - without references)
  /// Returns analysis with clarification options if needed
  Future<ResonanceAnalysisResponse> analyzeCharacters(List<String> characterInputs) async {
    try {
      state = const AsyncValue.loading();
      
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.analyzeCharactersForResonance(characterInputs);
      
      state = AsyncValue.data(response);
      print('✅ [Resonance] Analysis complete: needsClarification=${response.needsClarification}');
      
      return response;
    } catch (e, stack) {
      print('❌ [Resonance] Analysis failed: $e');
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  /// Analyze characters with entry references for better recognition
  /// Slots contain rawName, referenceText, referenceType, limitMode
  Future<ResonanceAnalysisResponse> analyzeCharactersWithReferences(
    List<String> characterInputs,
    List<Map<String, dynamic>> slots,
  ) async {
    try {
      state = const AsyncValue.loading();
      
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.analyzeCharactersWithReferences(characterInputs, slots);
      
      state = AsyncValue.data(response);
      print('✅ [Resonance] Analysis with references complete: needsClarification=${response.needsClarification}');
      
      return response;
    } catch (e, stack) {
      print('❌ [Resonance] Analysis with references failed: $e');
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  /// Confirm clarifications and proceed to generation
  /// meCount: Number of "Me" characters (first N in the list)
  /// relationshipEnabled: Whether relationship characters are included
  /// relationshipType: 'romantic' or 'platonic'
  Future<void> confirmClarifications(
    List<ClarificationChoice> clarifications, {
    int meCount = 4,
    bool relationshipEnabled = false,
    String relationshipType = 'platonic',
  }) async {
    try {
      final apiClient = ref.read(apiClientProvider);
      await apiClient.confirmResonanceClarifications(
        clarifications,
        meCount: meCount,
        relationshipEnabled: relationshipEnabled,
        relationshipType: relationshipType,
      );
      
      print('✅ [Resonance] Clarifications confirmed (meCount: $meCount, relationship: $relationshipEnabled)');
      
      // Clear resonance state
      state = const AsyncValue.data(null);
      
      // Trigger output generation
      ref.read(outputRepositoryProvider.notifier).regenerate();
      
      // If relationship is enabled, wait a moment for Me output to start, then trigger relationship
      // This prevents race conditions where relationship tries to generate before backend is ready
      if (relationshipEnabled) {
        print('🔄 [Resonance] Triggering relationship output generation after delay...');
        Future.delayed(const Duration(milliseconds: 500), () {
          ref.read(relationshipOutputRepositoryProvider.notifier).regenerate();
        });
      }
    } catch (e, stack) {
      print('❌ [Resonance] Confirmation failed: $e');
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  /// Skip clarification and use defaults
  Future<void> skipClarification() async {
    try {
      final apiClient = ref.read(apiClientProvider);
      await apiClient.skipResonanceClarification();
      
      print('✅ [Resonance] Clarification skipped');
      
      // Clear resonance state
      state = const AsyncValue.data(null);
      
      // Trigger output generation
      ref.read(outputRepositoryProvider.notifier).regenerate();
      
      // Also trigger relationship output if enabled (after a short delay)
      final relationshipState = ref.read(relationshipRepositoryProvider);
      if (relationshipState.valueOrNull?.enabled == true) {
        print('🔄 [Resonance] Triggering relationship output generation after skip...');
        Future.delayed(const Duration(milliseconds: 500), () {
          ref.read(relationshipOutputRepositoryProvider.notifier).regenerate();
        });
      }
    } catch (e, stack) {
      print('❌ [Resonance] Skip failed: $e');
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  /// Reset resonance state (e.g., when going back to character entry)
  void reset() {
    state = const AsyncValue.data(null);
  }
}

// ============================================================================
// TONE REPOSITORY
// ============================================================================

/// State for tone preference and rendering
class ToneState {
  final NarrativeTone currentTone;
  final bool isLoading;
  final Map<String, dynamic>? renderedMeOutput;
  final Map<String, dynamic>? renderedRelationshipOutput;

  const ToneState({
    this.currentTone = NarrativeTone.modern, // Default to modern tone
    this.isLoading = false,
    this.renderedMeOutput,
    this.renderedRelationshipOutput,
  });

  /// copyWith that supports explicitly setting nullable fields to null
  /// Use clearRenderedMe: true to clear renderedMeOutput
  /// Use clearRenderedRelationship: true to clear renderedRelationshipOutput
  ToneState copyWith({
    NarrativeTone? currentTone,
    bool? isLoading,
    Map<String, dynamic>? renderedMeOutput,
    Map<String, dynamic>? renderedRelationshipOutput,
    bool clearRenderedMe = false,
    bool clearRenderedRelationship = false,
  }) {
    return ToneState(
      currentTone: currentTone ?? this.currentTone,
      isLoading: isLoading ?? this.isLoading,
      renderedMeOutput: clearRenderedMe ? null : (renderedMeOutput ?? this.renderedMeOutput),
      renderedRelationshipOutput: clearRenderedRelationship ? null : (renderedRelationshipOutput ?? this.renderedRelationshipOutput),
    );
  }
}

final toneRepositoryProvider =
    StateNotifierProvider<ToneRepository, ToneState>((ref) => ToneRepository(ref));

class ToneRepository extends StateNotifier<ToneState> {
  final Ref ref;

  ToneRepository(this.ref) : super(const ToneState()) {
    _loadPreference();
  }

  /// Load user's tone preference from backend
  Future<void> _loadPreference() async {
    try {
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.getTonePreference();
      final tone = NarrativeToneX.fromApiValue(response.narrativeTone);
      state = state.copyWith(currentTone: tone);
      print('✅ [Tone] Loaded preference: ${tone.apiValue}');
    } catch (e) {
      print('❌ [Tone] Failed to load preference: $e');
      // Keep default
    }
  }

  /// Set narrative tone
  /// Automatically triggers re-rendering of output in the new tone
  Future<void> setTone(NarrativeTone tone) async {
    if (tone == state.currentTone) {
      print('⏭️ [Tone] Same tone selected (${tone.apiValue}), skipping');
      return;
    }

    print('🔄 [Tone] Changing tone from ${state.currentTone.apiValue} to ${tone.apiValue}');
    
    // Clear all previous rendered outputs and set loading state in ONE update
    // This ensures the UI immediately shows loading state with no stale data
    state = ToneState(
      currentTone: tone,
      isLoading: true,
      renderedMeOutput: null,
      renderedRelationshipOutput: null,
    );

    try {
      // Save preference to backend
      final apiClient = ref.read(apiClientProvider);
      await apiClient.setTonePreference(tone);

      print('✅ [Tone] Preference saved: ${tone.apiValue}');
      
      // If MINIMAL tone, we're done - no rendering needed, just use original output
      if (tone == NarrativeTone.minimal) {
        print('✅ [Tone] Minimal tone selected - using original output');
        state = ToneState(
          currentTone: tone,
          isLoading: false,
          renderedMeOutput: null,
          renderedRelationshipOutput: null,
        );
        return;
      }
      
      // For non-plain tones, trigger re-rendering
      print('🔄 [Tone] Triggering re-render in ${tone.apiValue} tone...');
      
      Map<String, dynamic>? meRendered;
      Map<String, dynamic>? relRendered;
      
      // Render Me output in new tone (with force flag to bypass cache)
      try {
        final meResponse = await apiClient.renderMeOutput(tone: tone, force: true);
        if (meResponse.success && meResponse.rendered != null) {
          meRendered = meResponse.rendered;
          print('✅ [Tone] Me output re-rendered (cached: ${meResponse.cached})');
        } else {
          print('⚠️ [Tone] Me render returned success=${meResponse.success}, rendered=${meResponse.rendered != null}');
        }
      } catch (e) {
        print('⚠️ [Tone] Failed to re-render Me output: $e');
      }
      
      // Render Relationship output in new tone
      try {
        final relResponse = await apiClient.renderRelationshipOutput(tone: tone, force: true);
        if (relResponse.success && relResponse.rendered != null) {
          relRendered = relResponse.rendered;
          print('✅ [Tone] Relationship output re-rendered (cached: ${relResponse.cached})');
        }
      } catch (e) {
        print('⚠️ [Tone] Failed to re-render Relationship output: $e');
      }
      
      // Update state with all rendered content at once
      state = ToneState(
        currentTone: tone,
        isLoading: false,
        renderedMeOutput: meRendered,
        renderedRelationshipOutput: relRendered,
      );
      
      print('✅ [Tone] Tone change complete - meRendered: ${meRendered != null}, relRendered: ${relRendered != null}');
    } catch (e) {
      print('❌ [Tone] Failed to set tone: $e');
      state = ToneState(
        currentTone: tone,
        isLoading: false,
        renderedMeOutput: null,
        renderedRelationshipOutput: null,
      );
      rethrow;
    }
  }

  /// Render Me output in current tone
  Future<Map<String, dynamic>?> renderMeOutput({String? section}) async {
    // If MINIMAL tone, no transformation needed
    if (state.currentTone == NarrativeTone.minimal) {
      return null; // Use original output
    }

    // Check if we already have rendered output
    if (state.renderedMeOutput != null && section == null) {
      return state.renderedMeOutput;
    }

    state = state.copyWith(isLoading: true);

    try {
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.renderMeOutput(
        tone: state.currentTone,
        section: section,
      );

      if (response.success && response.rendered != null) {
        state = state.copyWith(
          isLoading: false,
          renderedMeOutput: section == null ? response.rendered : state.renderedMeOutput,
        );
        return response.rendered;
      }

      state = state.copyWith(isLoading: false);
      return null;
    } catch (e) {
      print('❌ [Tone] Failed to render Me output: $e');
      state = state.copyWith(isLoading: false);
      return null; // Fallback to original
    }
  }

  /// Render Relationship output in current tone
  Future<Map<String, dynamic>?> renderRelationshipOutput({String? section}) async {
    // If MINIMAL tone, no transformation needed
    if (state.currentTone == NarrativeTone.minimal) {
      return null; // Use original output
    }

    // Check if we already have rendered output
    if (state.renderedRelationshipOutput != null && section == null) {
      return state.renderedRelationshipOutput;
    }

    state = state.copyWith(isLoading: true);

    try {
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.renderRelationshipOutput(
        tone: state.currentTone,
        section: section,
      );

      if (response.success && response.rendered != null) {
        state = state.copyWith(
          isLoading: false,
          renderedRelationshipOutput: section == null ? response.rendered : state.renderedRelationshipOutput,
        );
        return response.rendered;
      }

      state = state.copyWith(isLoading: false);
      return null;
    } catch (e) {
      print('❌ [Tone] Failed to render Relationship output: $e');
      state = state.copyWith(isLoading: false);
      return null; // Fallback to original
    }
  }

  /// Clear rendered outputs (call when canonical output changes)
  void clearRenderedOutputs() {
    state = state.copyWith(
      clearRenderedMe: true,
      clearRenderedRelationship: true,
    );
  }

  /// Get current tone
  NarrativeTone get currentTone => state.currentTone;
}

// ============================================================================
// EFFECTIVE OUTPUT PROVIDER (Merges original output with tone-rendered content)
// ============================================================================

/// Provider that returns the "effective" output:
/// - If tone is PLAIN or no rendered output exists, returns original
/// - If tone is non-PLAIN and rendered output exists, returns rendered version
final effectiveMeOutputProvider = Provider<GeneratedOutput?>((ref) {
  final originalOutput = ref.watch(outputRepositoryProvider).valueOrNull;
  final toneState = ref.watch(toneRepositoryProvider);
  
  if (originalOutput == null) return null;
  
  // If MINIMAL tone or no rendered output, use original
  if (toneState.currentTone == NarrativeTone.minimal || toneState.renderedMeOutput == null) {
    return originalOutput;
  }
  
  // Merge the rendered output with the original (rendered may not have all fields)
  final rendered = toneState.renderedMeOutput!;
  try {
    return originalOutput.copyWith(
      story: rendered['story'] != null 
          ? StoryOutput.fromJson(rendered['story'] as Map<String, dynamic>)
          : originalOutput.story,
      identification: rendered['identification'] != null
          ? IdentificationOutput.fromJson(rendered['identification'] as Map<String, dynamic>)
          : originalOutput.identification,
      functioning: rendered['functioning'] != null
          ? FunctioningOutput.fromJson(rendered['functioning'] as Map<String, dynamic>)
          : originalOutput.functioning,
      actions: rendered['actions'] != null
          ? ActionsOutput.fromJson(rendered['actions'] as Map<String, dynamic>)
          : originalOutput.actions,
      lifeDomains: rendered['lifeDomains'] != null
          ? LifeDomainsOutput.fromJson(rendered['lifeDomains'] as Map<String, dynamic>)
          : originalOutput.lifeDomains,
    );
  } catch (e) {
    print('⚠️ [EffectiveOutput] Failed to merge rendered output: $e');
    return originalOutput;
  }
});

/// Provider that returns the "effective" relationship output
final effectiveRelationshipOutputProvider = Provider<RelationshipOutput?>((ref) {
  final originalOutput = ref.watch(relationshipOutputRepositoryProvider).valueOrNull;
  final toneState = ref.watch(toneRepositoryProvider);
  
  if (originalOutput == null) return null;
  
  // If MINIMAL tone or no rendered output, use original
  if (toneState.currentTone == NarrativeTone.minimal || toneState.renderedRelationshipOutput == null) {
    return originalOutput;
  }
  
  // Merge the rendered output with the original
  final rendered = toneState.renderedRelationshipOutput!;
  try {
    return originalOutput.copyWith(
      myth: rendered['myth'] != null
          ? RelationshipMyth.fromJson(rendered['myth'] as Map<String, dynamic>)
          : originalOutput.myth,
      narrative: rendered['narrative'] != null
          ? RelationshipNarrative.fromJson(rendered['narrative'] as Map<String, dynamic>)
          : originalOutput.narrative,
    );
  } catch (e) {
    print('⚠️ [EffectiveOutput] Failed to merge rendered relationship output: $e');
    return originalOutput;
  }
});

// ============================================================================
// CONSTELLATION REPOSITORY
// ============================================================================

/// Provider for Me constellation data - fetches from API
/// Note: Constellation is also included in main output, but we fetch separately
/// to avoid circular dependencies
/// Removed autoDispose to prevent re-fetching on tab switches
final meConstellationProvider = FutureProvider<MeConstellationResponse?>((ref) async {
  final apiClient = ref.read(apiClientProvider);
  try {
    print('🔮 [Constellation] Fetching Me constellation from API...');
    return await apiClient.getMeConstellation();
  } catch (e) {
    print('❌ [Constellation] Failed to fetch Me constellation: $e');
    return null;
  }
});

/// Provider for Relationship constellation data - fetches from API
/// Removed autoDispose to prevent re-fetching on tab switches
final relationshipConstellationProvider = FutureProvider<RelationshipConstellationResponse?>((ref) async {
  final apiClient = ref.read(apiClientProvider);
  try {
    print('🔮 [Constellation] Fetching Relationship constellation from API...');
    return await apiClient.getRelationshipConstellation();
  } catch (e) {
    print('❌ [Constellation] Failed to fetch Relationship constellation: $e');
    return null;
  }
});

/// Repository for constellation operations
class ConstellationRepository {
  final Ref ref;

  ConstellationRepository(this.ref);

  /// Force refresh Me constellation
  Future<MeConstellationResponse?> refreshMeConstellation() async {
    final apiClient = ref.read(apiClientProvider);
    try {
      return await apiClient.getMeConstellation(force: true);
    } catch (e) {
      print('❌ [Constellation] Failed to refresh Me constellation: $e');
      return null;
    }
  }

  /// Force refresh Relationship constellation
  Future<RelationshipConstellationResponse?> refreshRelationshipConstellation() async {
    final apiClient = ref.read(apiClientProvider);
    try {
      return await apiClient.getRelationshipConstellation(force: true);
    } catch (e) {
      print('❌ [Constellation] Failed to refresh Relationship constellation: $e');
      return null;
    }
  }

  /// Clear constellation cache
  Future<void> clearCache() async {
    final apiClient = ref.read(apiClientProvider);
    try {
      await apiClient.clearConstellationCache();
      // Invalidate providers
      ref.invalidate(meConstellationProvider);
      ref.invalidate(relationshipConstellationProvider);
    } catch (e) {
      print('❌ [Constellation] Failed to clear cache: $e');
    }
  }
}

final constellationRepositoryProvider = Provider<ConstellationRepository>((ref) {
  return ConstellationRepository(ref);
});

// ============================================================================
// PSYCHE MODEL (Single Source of Truth for Constellation + Identification)
// ============================================================================

/// State for PsycheModel (tracks current run)
class PsycheModelState {
  final String? currentRunId;
  final PsycheModel? model;
  final bool isLoading;
  final String? error;

  const PsycheModelState({
    this.currentRunId,
    this.model,
    this.isLoading = false,
    this.error,
  });

  PsycheModelState copyWith({
    String? currentRunId,
    PsycheModel? model,
    bool? isLoading,
    String? error,
  }) {
    return PsycheModelState(
      currentRunId: currentRunId ?? this.currentRunId,
      model: model ?? this.model,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Provider for Me PsycheModel (single source of truth)
/// Only fetches AFTER main output is fully generated (has story content)
/// Uses keepAlive to prevent re-fetching on tab switches
final mePsycheModelProvider = FutureProvider<PsycheModel?>((ref) async {
  final apiClient = ref.read(apiClientProvider);
  
  // Watch for output changes
  final outputState = ref.watch(outputRepositoryProvider);
  if (outputState.isLoading || outputState.hasError) {
    print('🧠 [PsycheModel] ME: Output still loading/error, waiting...');
    return null;
  }
  
  final output = outputState.valueOrNull;
  // Only fetch PsycheModel if output has actual content (story exists)
  if (output == null || output.story == null) {
    print('🧠 [PsycheModel] ME: No complete output yet, waiting...');
    return null;
  }
  
  try {
    print('🧠 [PsycheModel] ME: Generating/fetching PsycheModel...');
    final psycheModel = await apiClient.getOrGeneratePsycheModel(context: 'ME');
    print('✅ [PsycheModel] ME: Got PsycheModel with ${psycheModel?.motifDistribution.length ?? 0} motifs');
    return psycheModel;
  } catch (e) {
    print('❌ [PsycheModel] ME: Failed - $e');
    return null;
  }
});

/// Provider for Relationship PsycheModel
/// Only fetches AFTER relationship output is fully generated
/// Uses keepAlive to prevent re-fetching on tab switches
final relationshipPsycheModelProvider = FutureProvider<PsycheModel?>((ref) async {
  final apiClient = ref.read(apiClientProvider);
  
  // Watch for relationship output changes
  final relOutputState = ref.watch(relationshipOutputRepositoryProvider);
  if (relOutputState.isLoading || relOutputState.hasError) {
    print('🧠 [PsycheModel] REL: Output still loading/error, waiting...');
    return null;
  }
  
  final relOutput = relOutputState.valueOrNull;
  // Only fetch if output has actual content (myth exists)
  if (relOutput == null || relOutput.myth == null) {
    print('🧠 [PsycheModel] REL: No complete output yet, waiting...');
    return null;
  }
  
  try {
    print('🧠 [PsycheModel] REL: Generating/fetching PsycheModel...');
    final psycheModel = await apiClient.getOrGeneratePsycheModel(context: 'REL');
    print('✅ [PsycheModel] REL: Got PsycheModel');
    return psycheModel;
  } catch (e) {
    print('❌ [PsycheModel] REL: Failed - $e');
    return null;
  }
});

/// Repository for PsycheModel operations
class PsycheModelRepository {
  final Ref ref;

  PsycheModelRepository(this.ref);

  /// Force regenerate Me PsycheModel
  Future<PsycheModel?> regenerateMePsycheModel() async {
    final apiClient = ref.read(apiClientProvider);
    try {
      final model = await apiClient.getOrGeneratePsycheModel(context: 'ME', force: true);
      ref.invalidate(mePsycheModelProvider);
      return model;
    } catch (e) {
      print('❌ [PsycheModel] Failed to regenerate ME: $e');
      return null;
    }
  }

  /// Force regenerate Relationship PsycheModel
  Future<PsycheModel?> regenerateRelationshipPsycheModel() async {
    final apiClient = ref.read(apiClientProvider);
    try {
      final model = await apiClient.getOrGeneratePsycheModel(context: 'REL', force: true);
      ref.invalidate(relationshipPsycheModelProvider);
      return model;
    } catch (e) {
      print('❌ [PsycheModel] Failed to regenerate REL: $e');
      return null;
    }
  }
}

final psycheModelRepositoryProvider = Provider<PsycheModelRepository>((ref) {
  return PsycheModelRepository(ref);
});
