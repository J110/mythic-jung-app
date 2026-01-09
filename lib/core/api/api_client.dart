import 'package:dio/dio.dart';
import '../models/character.dart';
import '../models/assessment_answer.dart';
import '../models/generated_output.dart';

class ApiClient {
  final Dio _dio;
  final String? baseUrl;
  final bool useMock;

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
}

// Custom exception for character validation errors
class CharacterValidationException implements Exception {
  final String message;
  CharacterValidationException(this.message);
  
  @override
  String toString() => message;
}
