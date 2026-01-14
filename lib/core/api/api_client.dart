import 'package:dio/dio.dart';
import '../models/character.dart';
import '../models/assessment_answer.dart';
import '../models/generated_output.dart';
import '../models/relationship.dart';
import '../models/resonance.dart';
import '../models/tone.dart';
import '../models/constellation.dart';
import '../models/psyche_model.dart';
import '../models/user.dart';

class ApiClient {
  final Dio _dio;
  final String? baseUrl;
  final bool useMock;
  String? _userId;

  ApiClient({
    this.baseUrl,
    this.useMock = true,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ?? '',
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(minutes: 6), // Increased for comprehensive AI generation
          ),
        );

  /// Set the current user ID - this will be sent with all requests
  void setUserId(String userId) {
    _userId = userId;
    _dio.options.headers['X-User-Id'] = userId;
    print('[ApiClient] Set userId: $userId');
  }

  /// Get the current user ID
  String? get userId => _userId;

  /// Clear the user ID (logout)
  void clearUserId() {
    _userId = null;
    _dio.options.headers.remove('X-User-Id');
    print('[ApiClient] Cleared userId');
  }

  // ============================================================================
  // USER MANAGEMENT
  // ============================================================================

  /// Login or create a user by username
  Future<LoginResponse> login(String username) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      return LoginResponse(
        success: true,
        user: AppUser(id: 'mock-user-id', username: username.toLowerCase(), displayName: username),
        isReturningUser: false,
        hasExistingData: false,
      );
    }

    print('[ApiClient] Logging in user: $username');
    try {
      final response = await _dio.post('/v1/users/login', data: {'username': username});
      final loginResponse = LoginResponse.fromJson(response.data);
      
      // Automatically set the userId for subsequent requests
      setUserId(loginResponse.user.id);
      
      print('[ApiClient] Login successful: ${loginResponse.user.id} (returning: ${loginResponse.isReturningUser})');
      return loginResponse;
    } on DioException catch (e) {
      print('[ApiClient] Login failed: ${e.message}');
      print('[ApiClient] Response: ${e.response?.data}');
      rethrow;
    }
  }

  /// Get current user status
  Future<UserStatus> getUserStatus() async {
    if (_userId == null) {
      throw StateError('No user logged in');
    }

    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 300));
      return UserStatus(
        user: AppUser(id: _userId!, username: 'mock', displayName: 'Mock'),
        data: const UserDataStatus(
          hasCharacters: false,
          characterCount: 0,
          hasMeOutput: false,
          hasRelationshipOutput: false,
          tonePreference: 'plain',
        ),
      );
    }

    print('[ApiClient] Getting user status for: $_userId');
    try {
      final response = await _dio.get('/v1/users/$_userId/status');
      return UserStatus.fromJson(response.data);
    } on DioException catch (e) {
      print('[ApiClient] Get user status failed: ${e.message}');
      rethrow;
    }
  }

  /// Clear all user data (start fresh)
  Future<void> clearUserData() async {
    if (_userId == null) {
      throw StateError('No user logged in');
    }

    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 300));
      return;
    }

    print('[ApiClient] Clearing user data for: $_userId');
    try {
      await _dio.delete('/v1/users/$_userId/data');
      print('[ApiClient] User data cleared');
    } on DioException catch (e) {
      print('[ApiClient] Clear user data failed: ${e.message}');
      rethrow;
    }
  }

  /// Sync all user data from backend (for session restore)
  Future<UserSyncData> syncUserData() async {
    if (_userId == null) {
      throw StateError('No user logged in');
    }

    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 300));
      return const UserSyncData(
        user: null,
        meOutput: null,
        relationshipOutput: null,
        relationshipSettings: null,
        tonePreference: 'plain',
      );
    }

    print('[ApiClient] Syncing user data for: $_userId');
    try {
      final response = await _dio.get('/v1/users/$_userId/sync');
      print('[ApiClient] Sync response received');
      
      // Parse with defensive handling for incomplete data
      final data = response.data as Map<String, dynamic>;
      print('[ApiClient] Sync data keys: ${data.keys.toList()}');
      
      // Try to parse meOutput, but handle parsing errors gracefully
      GeneratedOutput? meOutput;
      if (data['meOutput'] != null) {
        try {
          final meOutputData = data['meOutput'];
          print('[ApiClient] meOutput type: ${meOutputData.runtimeType}');
          if (meOutputData is Map<String, dynamic>) {
            print('[ApiClient] meOutput keys: ${meOutputData.keys.toList()}');
            print('[ApiClient] meOutput.story type: ${meOutputData['story']?.runtimeType}');
            print('[ApiClient] meOutput.identification type: ${meOutputData['identification']?.runtimeType}');
            print('[ApiClient] meOutput.functioning type: ${meOutputData['functioning']?.runtimeType}');
            print('[ApiClient] meOutput.actions type: ${meOutputData['actions']?.runtimeType}');
            print('[ApiClient] meOutput.lifeDomains type: ${meOutputData['lifeDomains']?.runtimeType}');
            print('[ApiClient] meOutput.meta type: ${meOutputData['meta']?.runtimeType}');
          }
          meOutput = GeneratedOutput.fromJson(meOutputData as Map<String, dynamic>);
          print('[ApiClient] meOutput parsed successfully');
        } catch (e, stack) {
          print('[ApiClient] ERROR parsing meOutput: $e');
          print('[ApiClient] Stack: $stack');
          meOutput = null;
        }
      } else {
        print('[ApiClient] meOutput is null in response');
      }
      
      // Try to parse relationshipOutput
      RelationshipOutput? relationshipOutput;
      if (data['relationshipOutput'] != null) {
        try {
          relationshipOutput = RelationshipOutput.fromJson(data['relationshipOutput'] as Map<String, dynamic>);
          print('[ApiClient] relationshipOutput parsed successfully');
        } catch (e) {
          print('[ApiClient] ERROR parsing relationshipOutput: $e');
          relationshipOutput = null;
        }
      }
      
      // Try to parse relationshipSettings
      RelationshipSettings? relationshipSettings;
      if (data['relationshipSettings'] != null) {
        try {
          relationshipSettings = RelationshipSettings.fromJson(data['relationshipSettings'] as Map<String, dynamic>);
          print('[ApiClient] relationshipSettings parsed successfully');
        } catch (e) {
          print('[ApiClient] ERROR parsing relationshipSettings: $e');
          relationshipSettings = null;
        }
      }
      
      // Try to parse user
      AppUser? user;
      if (data['user'] != null) {
        try {
          final userData = data['user'];
          print('[ApiClient] user data: $userData');
          user = AppUser.fromJson(userData as Map<String, dynamic>);
          print('[ApiClient] user parsed successfully');
        } catch (e) {
          print('[ApiClient] ERROR parsing user: $e');
          user = null;
        }
      }
      
      print('[ApiClient] Sync parsing complete - meOutput: ${meOutput != null}, relationshipOutput: ${relationshipOutput != null}');
      
      return UserSyncData(
        user: user,
        meOutput: meOutput,
        relationshipOutput: relationshipOutput,
        relationshipSettings: relationshipSettings,
        tonePreference: (data['tonePreference'] as String?) ?? 'plain',
      );
    } on DioException catch (e) {
      print('[ApiClient] Sync failed: ${e.message}');
      rethrow;
    }
  }

  Future<void> updateProfile(List<Character> characters) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      return;
    }
    
    print('Calling POST /v1/profile with ${characters.length} characters');
    try {
      await _dio.post('/v1/profile', data: {
        'characters': characters.map((c) => c.toJson()).toList(),
      });
      print('Profile updated successfully');
    } on DioException catch (e) {
      print('Failed to update profile: ${e.message}');
      rethrow;
    }
  }

  Future<void> submitAssessmentAnswer(AssessmentAnswer answer) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      return;
    }
    
    print('Calling POST /v1/assessments/answer');
    try {
      await _dio.post('/v1/assessments/answer', data: answer.toJson());
      print('Assessment answer submitted successfully');
    } on DioException catch (e) {
      print('Failed to submit assessment: ${e.message}');
      rethrow;
    }
  }

  Future<GeneratedOutput> generateOutput({bool force = false}) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 1500));
      // Return mock data - in real app, load from fixture
      throw UnimplementedError('Mock generation - use fixture loader');
    }
    
    print('Calling POST /v1/generate with force=$force');
    try {
      final response = await _dio.post('/v1/generate', data: {'force': force});
      print('Backend response received: ${response.statusCode}');
      return GeneratedOutput.fromJson(response.data);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response: ${e.response?.data}');
      print('Status: ${e.response?.statusCode}');
      
      // Handle validation errors with user-friendly messages
      if (e.response?.statusCode == 400) {
        final errorData = e.response?.data;
        if (errorData is Map) {
          // Use userMessage if available, otherwise use error
          final userMessage = errorData['userMessage'] as String?;
          final errorMessage = errorData['error'] as String?;
          
          if (errorData['code'] == 'CHARACTERS_NOT_RECOGNIZED' || 
              errorMessage?.contains('recognized') == true ||
              errorMessage?.contains('characters') == true) {
            throw CharacterValidationException(
              userMessage ?? 
              'The characters you entered are not recognized. Please add proper character names from stories, movies, books, or mythology to begin the discovery.',
            );
          }
        }
      }
      
      rethrow;
    }
  }

  Future<GeneratedOutput?> getCachedOutput() async {
    if (useMock) {
      return null;
    }
    
    try {
      final response = await _dio.get('/v1/output');
      return GeneratedOutput.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getAssessmentQuestions({String? assessmentType}) async {
    if (useMock) {
      // Return mock questions
      return [];
    }
    
    try {
      final queryParams = assessmentType != null ? {'assessmentType': assessmentType} : null;
      final response = await _dio.get('/v1/assessments/questions', queryParameters: queryParams);
      return List<Map<String, dynamic>>.from(response.data['questions'] ?? []);
    } on DioException catch (e) {
      print('Failed to fetch assessment questions: ${e.message}');
      rethrow;
    }
  }

  // ============================================================================
  // RESONANCE API (Character clarification flow)
  // ============================================================================

  /// Analyze characters for ambiguity and get clarification options (legacy)
  Future<ResonanceAnalysisResponse> analyzeCharactersForResonance(List<String> characterInputs) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      // Return mock response with no clarification needed
      return ResonanceAnalysisResponse(
        success: true,
        needsClarification: false,
        characters: characterInputs.map((input) => CharacterAmbiguityAnalysis(
          input: input,
          characterName: input,
          canonicalId: 'char_${input.toLowerCase().replaceAll(' ', '_')}',
          needsClarification: false,
          disambiguationReason: 'singular',
        )).toList(),
      );
    }
    
    print('Calling POST /v1/resonance/analyze with ${characterInputs.length} characters');
    try {
      final response = await _dio.post('/v1/resonance/analyze', data: {
        'characterInputs': characterInputs,
      });
      print('Resonance analysis received: ${response.statusCode}');
      return ResonanceAnalysisResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('Resonance analysis failed: ${e.message}');
      print('Response: ${e.response?.data}');
      
      // Handle validation errors
      if (e.response?.statusCode == 400) {
        final errorData = e.response?.data;
        if (errorData is Map) {
          final errorMessage = errorData['error'] as String?;
          if (errorMessage != null) {
            throw CharacterValidationException(errorMessage);
          }
        }
      }
      
      rethrow;
    }
  }

  /// Analyze characters with entry references for better recognition
  /// Slots contain: slotId, rawName, referenceText, referenceType, limitMode
  Future<ResonanceAnalysisResponse> analyzeCharactersWithReferences(
    List<String> characterInputs,
    List<Map<String, dynamic>> slots,
  ) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      return ResonanceAnalysisResponse(
        success: true,
        needsClarification: false,
        characters: characterInputs.map((input) => CharacterAmbiguityAnalysis(
          input: input,
          characterName: input,
          canonicalId: 'char_${input.toLowerCase().replaceAll(' ', '_')}',
          needsClarification: false,
          disambiguationReason: 'singular',
        )).toList(),
      );
    }
    
    print('Calling POST /v1/resonance/analyze with ${slots.length} slots (with references)');
    try {
      final response = await _dio.post('/v1/resonance/analyze', data: {
        'characterInputs': characterInputs,
        'slots': slots,
      });
      print('Resonance analysis received: ${response.statusCode}');
      return ResonanceAnalysisResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('Resonance analysis with references failed: ${e.message}');
      print('Response: ${e.response?.data}');
      
      if (e.response?.statusCode == 400) {
        final errorData = e.response?.data;
        if (errorData is Map) {
          final errorMessage = errorData['error'] as String?;
          if (errorMessage != null) {
            throw CharacterValidationException(errorMessage);
          }
        }
      }
      
      rethrow;
    }
  }

  /// Confirm character selections with clarifications
  /// meCount: Number of "Me" characters (first N in the list)
  /// relationshipEnabled: Whether relationship characters are included
  /// relationshipType: 'romantic' or 'platonic'
  Future<Map<String, dynamic>> confirmResonanceClarifications(
    List<ClarificationChoice> clarifications, {
    int meCount = 4,
    bool relationshipEnabled = false,
    String relationshipType = 'platonic',
  }) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 300));
      return {'success': true};
    }
    
    print('Calling POST /v1/resonance/confirm (meCount: $meCount, relationship: $relationshipEnabled)');
    try {
      final response = await _dio.post('/v1/resonance/confirm', data: {
        'clarifications': clarifications.map((c) => c.toJson()).toList(),
        'meCount': meCount,
        'relationshipEnabled': relationshipEnabled,
        'relationshipType': relationshipType,
      });
      print('Resonance confirmation received: ${response.statusCode}');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('Resonance confirmation failed: ${e.message}');
      rethrow;
    }
  }

  /// Skip clarification and use defaults
  Future<Map<String, dynamic>> skipResonanceClarification() async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 300));
      return {'success': true};
    }
    
    print('Calling POST /v1/resonance/skip');
    try {
      final response = await _dio.post('/v1/resonance/skip');
      print('Resonance skip received: ${response.statusCode}');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('Resonance skip failed: ${e.message}');
      rethrow;
    }
  }

  /// Re-recognize a single character that was incorrectly identified
  Future<RerecognizeResponse> rerecognizeCharacter({
    required int characterIndex,
    required String originalInput,
    String? correctedInput,
    String? hint,
  }) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      return RerecognizeResponse(
        success: true,
        characterIndex: characterIndex,
        originalInput: originalInput,
        updatedCharacter: RerecognizedCharacter(
          input: originalInput,
          characterName: correctedInput ?? originalInput,
          franchise: hint ?? 'Unknown',
          confidence: 0.85,
          needsClarification: false,
        ),
        message: 'Mock re-recognition successful',
      );
    }
    
    print('Calling POST /v1/resonance/rerecognize for index $characterIndex');
    try {
      final response = await _dio.post('/v1/resonance/rerecognize', data: {
        'characterIndex': characterIndex,
        'originalInput': originalInput,
        if (correctedInput != null) 'correctedInput': correctedInput,
        if (hint != null) 'hint': hint,
      });
      print('Re-recognition received: ${response.statusCode}');
      return RerecognizeResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('Re-recognition failed: ${e.message}');
      rethrow;
    }
  }

  // ============================================================================
  // RELATIONSHIP API (Independent from Me)
  // ============================================================================

  /// Save relationship character set
  Future<void> saveRelationshipSet(RelationshipCharacterSet relationship) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      return;
    }
    
    print('Calling POST /v1/relationship/set');
    try {
      await _dio.post('/v1/relationship/set', data: {
        'enabled': relationship.enabled,
        'relationshipType': relationship.relationshipType,
        'otherCharacterInputs': relationship.characters.map((c) => c.displayName).toList(),
      });
      print('Relationship set saved successfully');
    } on DioException catch (e) {
      print('Failed to save relationship set: ${e.message}');
      rethrow;
    }
  }

  /// Get cached relationship output
  Future<RelationshipOutput?> getRelationshipOutput() async {
    if (useMock) {
      return null;
    }
    
    try {
      final response = await _dio.get('/v1/relationship/output');
      return RelationshipOutput.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      rethrow;
    }
  }

  /// Generate relationship output
  Future<RelationshipOutput> generateRelationshipOutput({bool force = false}) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 1500));
      throw UnimplementedError('Mock generation for relationships');
    }
    
    print('Calling POST /v1/relationship/regenerate with force=$force');
    try {
      final response = await _dio.post('/v1/relationship/regenerate', data: {'force': force});
      print('Relationship output generated: ${response.statusCode}');
      return RelationshipOutput.fromJson(response.data);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response: ${e.response?.data}');
      
      // Handle validation errors
      if (e.response?.statusCode == 400) {
        final errorData = e.response?.data;
        if (errorData is Map) {
          final userMessage = errorData['userMessage'] as String?;
          if (userMessage != null) {
            throw CharacterValidationException(userMessage);
          }
        }
      }
      
      rethrow;
    }
  }

  /// Clear relationship cache and regenerate fresh output
  Future<void> clearRelationshipCache() async {
    if (useMock) return;
    
    print('Calling POST /v1/relationship/clear-cache');
    try {
      await _dio.post('/v1/relationship/clear-cache');
      print('Relationship cache cleared');
    } on DioException catch (e) {
      print('Cache clear failed: ${e.message}');
      rethrow;
    }
  }

  // ============================================================================
  // TONE API (Narrative Presentation)
  // ============================================================================

  /// Get available narrative tones
  Future<AvailableTonesResponse> getAvailableTones() async {
    if (useMock) {
      return AvailableTonesResponse(
        tones: NarrativeTone.values.map((t) => ToneInfo(
          value: t.apiValue,
          label: t.label,
          description: t.description,
        )).toList(),
        defaultTone: 'PLAIN',
      );
    }
    
    try {
      final response = await _dio.get('/v1/tone/available');
      return AvailableTonesResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('Failed to get available tones: ${e.message}');
      rethrow;
    }
  }

  /// Get user's tone preference
  Future<TonePreferenceResponse> getTonePreference() async {
    if (useMock) {
      return const TonePreferenceResponse(narrativeTone: 'PLAIN');
    }
    
    try {
      final response = await _dio.get('/v1/tone/preference');
      return TonePreferenceResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('Failed to get tone preference: ${e.message}');
      rethrow;
    }
  }

  /// Set user's tone preference
  Future<void> setTonePreference(NarrativeTone tone) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 200));
      return;
    }
    
    print('Calling POST /v1/tone/preference with tone=${tone.apiValue}');
    try {
      await _dio.post('/v1/tone/preference', data: {
        'narrativeTone': tone.apiValue,
      });
      print('Tone preference saved');
    } on DioException catch (e) {
      print('Failed to set tone preference: ${e.message}');
      rethrow;
    }
  }

  /// Render Me output in specified tone
  /// [force] - if true, bypasses cache and forces a fresh render
  Future<ToneRenderResponse> renderMeOutput({
    NarrativeTone? tone,
    String? section,
    bool force = false,
  }) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      throw UnimplementedError('Mock tone rendering');
    }
    
    print('Calling POST /v1/tone/render/me with tone=${tone?.apiValue}, section=$section, force=$force');
    try {
      final response = await _dio.post('/v1/tone/render/me', data: {
        if (tone != null) 'tone': tone.apiValue,
        if (section != null) 'section': section,
        if (force) 'force': true,
      });
      return ToneRenderResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('Failed to render Me output: ${e.message}');
      rethrow;
    }
  }

  /// Render Relationship output in specified tone
  /// [force] - if true, bypasses cache and forces a fresh render
  Future<ToneRenderResponse> renderRelationshipOutput({
    NarrativeTone? tone,
    String? section,
    bool force = false,
  }) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      throw UnimplementedError('Mock tone rendering');
    }
    
    print('Calling POST /v1/tone/render/relationship with tone=${tone?.apiValue}, section=$section, force=$force');
    try {
      final response = await _dio.post('/v1/tone/render/relationship', data: {
        if (tone != null) 'tone': tone.apiValue,
        if (section != null) 'section': section,
        if (force) 'force': true,
      });
      return ToneRenderResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('Failed to render Relationship output: ${e.message}');
      rethrow;
    }
  }

  /// Clear tone cache
  Future<void> clearToneCache() async {
    if (useMock) return;
    
    try {
      await _dio.delete('/v1/tone/cache');
      print('Tone cache cleared');
    } on DioException catch (e) {
      print('Failed to clear tone cache: ${e.message}');
      rethrow;
    }
  }

  // ============================================================================
  // ARCHETYPE CONSTELLATION API
  // ============================================================================

  /// Get Me archetype constellation
  Future<MeConstellationResponse?> getMeConstellation({bool force = false}) async {
    if (useMock) {
      // Return mock data
      return const MeConstellationResponse(
        meConstellation: Constellation(
          structural: StructuralArchetypes(
            ego: StructuralAssignment(primary: 'Batman', confidence: 0.85),
            persona: StructuralAssignment(primary: 'Tony Stark', confidence: 0.75),
            shadow: StructuralAssignment(primary: 'Joker', confidence: 0.70),
          ),
          motifs: MotifDistribution(
            top: [
              MotifScore(motif: 'HERO', score: 0.85),
              MotifScore(motif: 'WARRIOR', score: 0.72),
              MotifScore(motif: 'SEEKER_WANDERER', score: 0.65),
            ],
            shadow: [
              MotifScore(motif: 'TRICKSTER', score: 0.45),
            ],
          ),
        ),
        taxonomyVersion: '1.0.0',
      );
    }
    
    try {
      final response = await _dio.get(
        '/v1/me/archetypes',
        queryParameters: force ? {'force': 'true'} : null,
      );
      return MeConstellationResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      print('Failed to get Me constellation: ${e.message}');
      rethrow;
    }
  }

  /// Get Relationship archetype constellation
  Future<RelationshipConstellationResponse?> getRelationshipConstellation({bool force = false}) async {
    if (useMock) {
      // Return mock data
      return const RelationshipConstellationResponse(
        meConstellation: Constellation(
          motifs: MotifDistribution(
            top: [
              MotifScore(motif: 'HERO', score: 0.85),
              MotifScore(motif: 'WARRIOR', score: 0.72),
            ],
          ),
        ),
        partnerConstellation: Constellation(
          motifs: MotifDistribution(
            top: [
              MotifScore(motif: 'LOVER_EROS', score: 0.80),
              MotifScore(motif: 'CAREGIVER_HEALER', score: 0.70),
            ],
          ),
        ),
        relationshipConstellation: RelationshipConstellation(
          shared: [
            SharedMotif(motif: 'SEEKER_WANDERER', meScore: 0.65, partnerScore: 0.60, label: 'Seeker'),
          ],
          complementary: [
            ComplementaryMotif(motif: 'HERO', highSide: 'me', delta: 0.45, meScore: 0.85, partnerScore: 0.40),
          ],
          tensions: [
            TensionPair(pair: ['WARRIOR', 'LOVER_EROS'], theme: 'strength_vs_vulnerability', strength: 0.65),
          ],
          field: RelationalField(
            label: 'Warrior–Lover Field',
            primaryThemes: ['strength', 'tenderness'],
            riskLoops: ['strength_vs_vulnerability'],
          ),
        ),
        taxonomyVersion: '1.0.0',
      );
    }
    
    try {
      final response = await _dio.get(
        '/v1/relationship/archetypes',
        queryParameters: force ? {'force': 'true'} : null,
      );
      return RelationshipConstellationResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      print('Failed to get Relationship constellation: ${e.message}');
      rethrow;
    }
  }

  /// Clear archetype constellation cache
  Future<void> clearConstellationCache() async {
    if (useMock) return;
    
    try {
      await _dio.post('/v1/archetypes/clear-cache');
      print('Constellation cache cleared');
    } on DioException catch (e) {
      print('Failed to clear constellation cache: ${e.message}');
      rethrow;
    }
  }

  // ==========================================================================
  // PsycheModel / Runs API (Single Source of Truth)
  // ==========================================================================

  /// Generate a new run (or return cached)
  /// This is the single source of truth for Constellation + Identification
  Future<RunGenerateResponse> generateRun({
    required String context,
    String relationshipType = 'ROMANTIC',
    bool force = false,
  }) async {
    if (useMock) {
      await Future.delayed(const Duration(milliseconds: 500));
      return RunGenerateResponse(
        runId: 'mock_run_${DateTime.now().millisecondsSinceEpoch}',
        cached: false,
      );
    }

    print('[API] Generating run for context=$context, force=$force');
    try {
      final response = await _dio.post('/v1/runs/generate', data: {
        'context': context,
        'relationshipType': relationshipType,
        'force': force,
      });
      return RunGenerateResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('[API] Failed to generate run: ${e.message}');
      rethrow;
    }
  }

  /// Get latest run ID for a context
  Future<RunLatestResponse?> getLatestRun({required String context}) async {
    if (useMock) {
      return null; // No mock runs
    }

    try {
      final response = await _dio.get('/v1/runs/latest', queryParameters: {
        'context': context,
      });
      return RunLatestResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      print('[API] Failed to get latest run: ${e.message}');
      rethrow;
    }
  }

  /// Fetch full PsycheModel by run ID
  Future<PsycheModel?> getPsycheModel({
    required String runId,
    String context = 'ME',
  }) async {
    if (useMock) {
      // Return mock PsycheModel
      await Future.delayed(const Duration(milliseconds: 300));
      return _getMockPsycheModel(context);
    }

    try {
      final response = await _dio.get('/v1/runs/$runId/psyche-model', queryParameters: {
        'context': context,
      });
      return PsycheModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      print('[API] Failed to get PsycheModel: ${e.message}');
      rethrow;
    }
  }

  /// Generate and fetch PsycheModel in one call (convenience method)
  Future<PsycheModel?> getOrGeneratePsycheModel({
    required String context,
    bool force = false,
  }) async {
    // First, generate/get run
    final runResponse = await generateRun(context: context, force: force);
    
    // Then fetch the PsycheModel
    return await getPsycheModel(runId: runResponse.runId, context: context);
  }

  /// Mock PsycheModel for development
  PsycheModel _getMockPsycheModel(String context) {
    if (context == 'ME') {
      return PsycheModel(
        runId: 'mock_me_run_001',
        userId: 'default-user',
        context: 'ME',
        createdAt: DateTime.now().toIso8601String(),
        structuralPositions: const StructuralPositions(
          ego: StructuralPosition(primary: 'Tyler Durden', confidence: 0.85, evidenceFlags: ['roleTraitFit']),
          persona: StructuralPosition(primary: 'Carl Allen', confidence: 0.78, evidenceFlags: ['resonanceFit']),
          shadow: StructuralPosition(primary: 'The Joker', confidence: 0.82, evidenceFlags: ['roleTraitFit']),
          feelingFunction: StructuralPosition(primary: 'Hunter Adams', confidence: 0.75, evidenceFlags: ['assessmentFit']),
          erosAxis: StructuralPosition(primary: 'Jack Dawson', confidence: 0.70, evidenceFlags: []),
        ),
        motifDistribution: const [
          MotifEntry(motif: 'HERO', score: 0.85),
          MotifEntry(motif: 'TRICKSTER', score: 0.72),
          MotifEntry(motif: 'REBEL', score: 0.68),
          MotifEntry(motif: 'LOVER_EROS', score: 0.55),
        ],
        shadowMotifs: const [
          MotifEntry(motif: 'OUTLAW_REBEL', score: 0.65),
          MotifEntry(motif: 'SHADOW_TRICKSTER', score: 0.58),
        ],
        uiLabelMapping: const UiLabelMapping(),
        stability: const StabilityAnalysis(profileType: ProfileType.distributed),
        qualityFlags: const [],
      );
    } else {
      return PsycheModel(
        runId: 'mock_rel_run_001',
        userId: 'default-user',
        context: 'REL',
        createdAt: DateTime.now().toIso8601String(),
        partnerStructuralPositions: const StructuralPositions(
          ego: StructuralPosition(primary: 'Elizabeth Bennet', confidence: 0.82, evidenceFlags: ['roleTraitFit']),
          persona: StructuralPosition(primary: 'Amélie', confidence: 0.76, evidenceFlags: ['resonanceFit']),
          shadow: StructuralPosition(primary: 'Amy Dunne', confidence: 0.78, evidenceFlags: ['roleTraitFit']),
          feelingFunction: StructuralPosition(primary: 'Jane Eyre', confidence: 0.80, evidenceFlags: []),
        ),
        partnerMotifDistribution: const [
          MotifEntry(motif: 'LOVER_EROS', score: 0.80),
          MotifEntry(motif: 'CAREGIVER_HEALER', score: 0.70),
          MotifEntry(motif: 'SAGE', score: 0.65),
        ],
        partnerShadowMotifs: const [
          MotifEntry(motif: 'SHADOW_ANIMA', score: 0.55),
        ],
        partnerUiLabelMapping: const UiLabelMapping(),
        relationshipConstellation: const RelationshipConstellationData(
          shared: [
            SharedMotifEntry(motif: 'SEEKER_WANDERER', meScore: 0.65, partnerScore: 0.60),
          ],
          complementary: [
            ComplementaryMotifEntry(motif: 'HERO', highSide: 'me', delta: 0.45),
          ],
          tensions: [
            TensionEntry(pair: ['WARRIOR', 'LOVER_EROS'], direction: 'me_vs_partner', strength: 0.65),
          ],
          field: FieldSummary(
            label: 'Warrior–Lover Field',
            primaryThemes: ['strength', 'tenderness'],
            riskLoops: ['strength_vs_vulnerability'],
          ),
        ),
        stability: const StabilityAnalysis(profileType: ProfileType.distributed),
        qualityFlags: const [],
      );
    }
  }
}

// Custom exception for character validation errors
class CharacterValidationException implements Exception {
  final String message;
  CharacterValidationException(this.message);
  
  @override
  String toString() => message;
}
