import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import '../models/generated_output.dart';
import '../models/user_profile.dart';
import '../models/character.dart' as models;
import '../models/assessment_answer.dart' as models;

part 'local_db_mobile.g.dart';

class Characters extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text()();
  TextColumn get canonHint => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

class AssessmentAnswers extends Table {
  TextColumn get assessmentType => text()();
  TextColumn get questionId => text()();
  TextColumn get selectedCharacterIds => text()(); // JSON array
  IntColumn get confidence => integer().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  
  @override
  Set<Column> get primaryKey => {assessmentType, questionId};
}

class CachedOutputs extends Table {
  TextColumn get id => text()();
  TextColumn get outputJson => text()(); // JSON string
  TextColumn get promptVersion => text()();
  TextColumn get modelVersion => text()();
  IntColumn get schemaVersion => integer()();
  DateTimeColumn get generatedAt => dateTime()();
  DateTimeColumn get cachedAt => dateTime()();
  
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Characters, AssessmentAnswers, CachedOutputs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> saveProfile(UserProfile profile) async {
    await transaction(() async {
      // Clear existing characters
      await delete(characters).go();
      
      // Save characters
      for (final char in profile.characters) {
        await into(characters).insert(
          CharactersCompanion.insert(
            id: char.id,
            displayName: char.displayName,
            canonHint: Value(char.canonHint),
          ),
        );
      }
      
      // Clear and save assessment answers
      await delete(assessmentAnswers).go();
      for (final answer in profile.answers) {
        await into(assessmentAnswers).insert(
          AssessmentAnswersCompanion.insert(
            assessmentType: answer.assessmentType,
            questionId: answer.questionId,
            selectedCharacterIds: answer.selectedCharacterIds.join(','),
            confidence: Value(answer.confidence),
            updatedAt: Value(answer.updatedAt ?? DateTime.now()),
          ),
        );
      }
      
      // Save cached output
      if (profile.cachedOutput != null) {
        await delete(cachedOutputs).go();
        final output = profile.cachedOutput!;
        await into(cachedOutputs).insert(
          CachedOutputsCompanion.insert(
            id: 'current',
            outputJson: jsonEncode(output.toJson()),
            promptVersion: output.meta.promptVersion,
            modelVersion: output.meta.modelVersion,
            schemaVersion: output.meta.schemaVersion,
            generatedAt: DateTime.parse(output.meta.generatedAt),
            cachedAt: DateTime.now(),
          ),
        );
      }
    });
  }

  Future<UserProfile?> loadProfile() async {
    final charRows = await select(characters).get();
    if (charRows.isEmpty) return null;
    
    final characterList = charRows.map((row) => models.Character(
      id: row.id,
      displayName: row.displayName,
      canonHint: row.canonHint,
    )).toList();
    
    final answerRows = await select(assessmentAnswers).get();
    final answerList = answerRows.map((row) => models.AssessmentAnswer(
      assessmentType: row.assessmentType,
      questionId: row.questionId,
      selectedCharacterIds: row.selectedCharacterIds,
      confidence: row.confidence,
      updatedAt: row.updatedAt,
    )).toList();
    
    GeneratedOutput? cachedOutput;
    final outputRows = await select(cachedOutputs).get();
    if (outputRows.isNotEmpty) {
      final outputRow = outputRows.first;
      try {
        final json = jsonDecode(outputRow.outputJson) as Map<String, dynamic>;
        cachedOutput = GeneratedOutput.fromJson(json);
      } catch (e) {
        // Ignore parse errors
      }
    }
    
    return UserProfile(
      id: 'local',
      characters: characterList,
      answers: answerList,
      cachedOutput: cachedOutput,
      lastUpdated: DateTime.now(),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file);
  });
}
