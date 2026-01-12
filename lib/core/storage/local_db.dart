import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/generated_output.dart';
import '../models/user_profile.dart';
import '../models/relationship.dart';
import '../models/character.dart' as models;
import '../models/assessment_answer.dart' as models;

/// Platform-agnostic storage - uses SharedPreferences for web, 
/// can be extended to use drift for mobile later
class AppDatabase {
  static const String _charactersKey = 'characters';
  static const String _answersKey = 'answers';
  static const String _cachedOutputKey = 'cached_output';
  static const String _profileIdKey = 'profile_id';
  
  // Relationship keys (independent storage)
  static const String _relationshipKey = 'relationship';
  static const String _relationshipOutputKey = 'relationship_output';

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

  // ============================================================================
  // RELATIONSHIP STORAGE (Independent from Me)
  // ============================================================================

  Future<void> saveRelationship(RelationshipCharacterSet relationship) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_relationshipKey, jsonEncode(relationship.toJson()));
  }

  Future<RelationshipCharacterSet?> loadRelationship() async {
    final prefs = await SharedPreferences.getInstance();
    
    final relationshipJsonStr = prefs.getString(_relationshipKey);
    if (relationshipJsonStr == null) {
      return null;
    }
    
    try {
      final relationshipJson = jsonDecode(relationshipJsonStr) as Map<String, dynamic>;
      return RelationshipCharacterSet.fromJson(relationshipJson);
    } catch (e) {
      return null;
    }
  }

  Future<void> saveRelationshipOutput(RelationshipOutput output) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_relationshipOutputKey, jsonEncode(output.toJson()));
  }

  Future<RelationshipOutput?> loadRelationshipOutput() async {
    final prefs = await SharedPreferences.getInstance();
    
    final outputJsonStr = prefs.getString(_relationshipOutputKey);
    if (outputJsonStr == null) {
      return null;
    }
    
    try {
      final outputJson = jsonDecode(outputJsonStr) as Map<String, dynamic>;
      return RelationshipOutput.fromJson(outputJson);
    } catch (e) {
      return null;
    }
  }

  Future<void> clearRelationship() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_relationshipKey);
    await prefs.remove(_relationshipOutputKey);
  }
}
