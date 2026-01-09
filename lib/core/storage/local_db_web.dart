import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/generated_output.dart';
import '../models/user_profile.dart';
import '../models/character.dart' as models;
import '../models/assessment_answer.dart' as models;

/// Web-compatible storage using SharedPreferences
class AppDatabase {
  static const String _charactersKey = 'characters';
  static const String _answersKey = 'answers';
  static const String _cachedOutputKey = 'cached_output';
  static const String _profileIdKey = 'profile_id';

  Future<void> saveProfile(UserProfile profile) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Save characters
    final charactersJson = profile.characters.map((c) => c.toJson()).toList();
    await prefs.setString(_charactersKey, jsonEncode(charactersJson));
    
    // Save answers
    final answersJson = profile.answers.map((a) => a.toJson()).toList();
    await prefs.setString(_answersKey, jsonEncode(answersJson));
    
    // Save cached output
    if (profile.cachedOutput != null) {
      await prefs.setString(_cachedOutputKey, jsonEncode(profile.cachedOutput!.toJson()));
    } else {
      await prefs.remove(_cachedOutputKey);
    }
    
    // Save profile ID
    await prefs.setString(_profileIdKey, profile.id);
  }

  Future<UserProfile?> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Check if profile exists
    if (!prefs.containsKey(_charactersKey)) {
      return null;
    }
    
    // Load characters
    final charactersJsonStr = prefs.getString(_charactersKey);
    if (charactersJsonStr == null) return null;
    
    final charactersJson = jsonDecode(charactersJsonStr) as List;
    final characterList = charactersJson
        .map((json) => models.Character.fromJson(json as Map<String, dynamic>))
        .toList();
    
    // Load answers
    final answersJsonStr = prefs.getString(_answersKey);
    final answerList = answersJsonStr != null
        ? (jsonDecode(answersJsonStr) as List)
            .map((json) => models.AssessmentAnswer.fromJson(json as Map<String, dynamic>))
            .toList()
        : <models.AssessmentAnswer>[];
    
    // Load cached output
    GeneratedOutput? cachedOutput;
    final outputJsonStr = prefs.getString(_cachedOutputKey);
    if (outputJsonStr != null) {
      try {
        final outputJson = jsonDecode(outputJsonStr) as Map<String, dynamic>;
        cachedOutput = GeneratedOutput.fromJson(outputJson);
      } catch (e) {
        // Ignore parse errors
      }
    }
    
    final profileId = prefs.getString(_profileIdKey) ?? 'local';
    
    return UserProfile(
      id: profileId,
      characters: characterList,
      answers: answerList,
      cachedOutput: cachedOutput,
      lastUpdated: DateTime.now(),
    );
  }
}
