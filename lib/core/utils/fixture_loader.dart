import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/generated_output.dart';

class FixtureLoader {
  static Future<GeneratedOutput> loadFixture() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/fixtures/generated_output_fixture.json',
      );
      final Map<String, dynamic> json = jsonDecode(jsonString);
      return GeneratedOutput.fromJson(json);
    } catch (e) {
      throw Exception('Failed to load fixture: $e');
    }
  }
}
