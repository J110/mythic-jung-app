// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db_mobile.dart';

// ignore_for_file: type=lint
class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _canonHintMeta = const VerificationMeta(
    'canonHint',
  );
  @override
  late final GeneratedColumn<String> canonHint = GeneratedColumn<String>(
    'canon_hint',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, displayName, canonHint];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Character> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('canon_hint')) {
      context.handle(
        _canonHintMeta,
        canonHint.isAcceptableOrUnknown(data['canon_hint']!, _canonHintMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      canonHint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}canon_hint'],
      ),
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
  final String id;
  final String displayName;
  final String? canonHint;
  const Character({
    required this.id,
    required this.displayName,
    this.canonHint,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || canonHint != null) {
      map['canon_hint'] = Variable<String>(canonHint);
    }
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      displayName: Value(displayName),
      canonHint: canonHint == null && nullToAbsent
          ? const Value.absent()
          : Value(canonHint),
    );
  }

  factory Character.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      canonHint: serializer.fromJson<String?>(json['canonHint']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'canonHint': serializer.toJson<String?>(canonHint),
    };
  }

  Character copyWith({
    String? id,
    String? displayName,
    Value<String?> canonHint = const Value.absent(),
  }) => Character(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    canonHint: canonHint.present ? canonHint.value : this.canonHint,
  );
  Character copyWithCompanion(CharactersCompanion data) {
    return Character(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      canonHint: data.canonHint.present ? data.canonHint.value : this.canonHint,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('canonHint: $canonHint')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, displayName, canonHint);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.canonHint == this.canonHint);
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<String?> canonHint;
  final Value<int> rowid;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.canonHint = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharactersCompanion.insert({
    required String id,
    required String displayName,
    this.canonHint = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       displayName = Value(displayName);
  static Insertable<Character> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? canonHint,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (canonHint != null) 'canon_hint': canonHint,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharactersCompanion copyWith({
    Value<String>? id,
    Value<String>? displayName,
    Value<String?>? canonHint,
    Value<int>? rowid,
  }) {
    return CharactersCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      canonHint: canonHint ?? this.canonHint,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (canonHint.present) {
      map['canon_hint'] = Variable<String>(canonHint.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('canonHint: $canonHint, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssessmentAnswersTable extends AssessmentAnswers
    with TableInfo<$AssessmentAnswersTable, models.AssessmentAnswer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentAnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _assessmentTypeMeta = const VerificationMeta(
    'assessmentType',
  );
  @override
  late final GeneratedColumn<String> assessmentType = GeneratedColumn<String>(
    'assessment_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedCharacterIdsMeta =
      const VerificationMeta('selectedCharacterIds');
  @override
  late final GeneratedColumn<String> selectedCharacterIds =
      GeneratedColumn<String>(
        'selected_character_ids',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _confidenceMeta = const VerificationMeta(
    'confidence',
  );
  @override
  late final GeneratedColumn<int> confidence = GeneratedColumn<int>(
    'confidence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    assessmentType,
    questionId,
    selectedCharacterIds,
    confidence,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessment_answers';
  @override
  VerificationContext validateIntegrity(
    Insertable<models.AssessmentAnswer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('assessment_type')) {
      context.handle(
        _assessmentTypeMeta,
        assessmentType.isAcceptableOrUnknown(
          data['assessment_type']!,
          _assessmentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assessmentTypeMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('selected_character_ids')) {
      context.handle(
        _selectedCharacterIdsMeta,
        selectedCharacterIds.isAcceptableOrUnknown(
          data['selected_character_ids']!,
          _selectedCharacterIdsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedCharacterIdsMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
        _confidenceMeta,
        confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {assessmentType, questionId};
  @override
  models.AssessmentAnswer map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssessmentAnswer(
      assessmentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}assessment_type'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      )!,
      selectedCharacterIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_character_ids'],
      )!,
      confidence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}confidence'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $AssessmentAnswersTable createAlias(String alias) {
    return $AssessmentAnswersTable(attachedDatabase, alias);
  }
}

class AssessmentAnswer extends DataClass
    implements Insertable<models.AssessmentAnswer> {
  final String assessmentType;
  final String questionId;
  final String selectedCharacterIds;
  final int? confidence;
  final DateTime? updatedAt;
  const AssessmentAnswer({
    required this.assessmentType,
    required this.questionId,
    required this.selectedCharacterIds,
    this.confidence,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['assessment_type'] = Variable<String>(assessmentType);
    map['question_id'] = Variable<String>(questionId);
    map['selected_character_ids'] = Variable<String>(selectedCharacterIds);
    if (!nullToAbsent || confidence != null) {
      map['confidence'] = Variable<int>(confidence);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  AssessmentAnswersCompanion toCompanion(bool nullToAbsent) {
    return AssessmentAnswersCompanion(
      assessmentType: Value(assessmentType),
      questionId: Value(questionId),
      selectedCharacterIds: Value(selectedCharacterIds),
      confidence: confidence == null && nullToAbsent
          ? const Value.absent()
          : Value(confidence),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory AssessmentAnswer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssessmentAnswer(
      assessmentType: serializer.fromJson<String>(json['assessmentType']),
      questionId: serializer.fromJson<String>(json['questionId']),
      selectedCharacterIds: serializer.fromJson<String>(
        json['selectedCharacterIds'],
      ),
      confidence: serializer.fromJson<int?>(json['confidence']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'assessmentType': serializer.toJson<String>(assessmentType),
      'questionId': serializer.toJson<String>(questionId),
      'selectedCharacterIds': serializer.toJson<String>(selectedCharacterIds),
      'confidence': serializer.toJson<int?>(confidence),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  AssessmentAnswer copyWith({
    String? assessmentType,
    String? questionId,
    String? selectedCharacterIds,
    Value<int?> confidence = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => AssessmentAnswer(
    assessmentType: assessmentType ?? this.assessmentType,
    questionId: questionId ?? this.questionId,
    selectedCharacterIds: selectedCharacterIds ?? this.selectedCharacterIds,
    confidence: confidence.present ? confidence.value : this.confidence,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  AssessmentAnswer copyWithCompanion(AssessmentAnswersCompanion data) {
    return AssessmentAnswer(
      assessmentType: data.assessmentType.present
          ? data.assessmentType.value
          : this.assessmentType,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      selectedCharacterIds: data.selectedCharacterIds.present
          ? data.selectedCharacterIds.value
          : this.selectedCharacterIds,
      confidence: data.confidence.present
          ? data.confidence.value
          : this.confidence,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentAnswer(')
          ..write('assessmentType: $assessmentType, ')
          ..write('questionId: $questionId, ')
          ..write('selectedCharacterIds: $selectedCharacterIds, ')
          ..write('confidence: $confidence, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    assessmentType,
    questionId,
    selectedCharacterIds,
    confidence,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentAnswer &&
          other.assessmentType == this.assessmentType &&
          other.questionId == this.questionId &&
          other.selectedCharacterIds == this.selectedCharacterIds &&
          other.confidence == this.confidence &&
          other.updatedAt == this.updatedAt);
}

class AssessmentAnswersCompanion
    extends UpdateCompanion<models.AssessmentAnswer> {
  final Value<String> assessmentType;
  final Value<String> questionId;
  final Value<String> selectedCharacterIds;
  final Value<int?> confidence;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const AssessmentAnswersCompanion({
    this.assessmentType = const Value.absent(),
    this.questionId = const Value.absent(),
    this.selectedCharacterIds = const Value.absent(),
    this.confidence = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssessmentAnswersCompanion.insert({
    required String assessmentType,
    required String questionId,
    required String selectedCharacterIds,
    this.confidence = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : assessmentType = Value(assessmentType),
       questionId = Value(questionId),
       selectedCharacterIds = Value(selectedCharacterIds);
  static Insertable<models.AssessmentAnswer> custom({
    Expression<String>? assessmentType,
    Expression<String>? questionId,
    Expression<String>? selectedCharacterIds,
    Expression<int>? confidence,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (assessmentType != null) 'assessment_type': assessmentType,
      if (questionId != null) 'question_id': questionId,
      if (selectedCharacterIds != null)
        'selected_character_ids': selectedCharacterIds,
      if (confidence != null) 'confidence': confidence,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssessmentAnswersCompanion copyWith({
    Value<String>? assessmentType,
    Value<String>? questionId,
    Value<String>? selectedCharacterIds,
    Value<int?>? confidence,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return AssessmentAnswersCompanion(
      assessmentType: assessmentType ?? this.assessmentType,
      questionId: questionId ?? this.questionId,
      selectedCharacterIds: selectedCharacterIds ?? this.selectedCharacterIds,
      confidence: confidence ?? this.confidence,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (assessmentType.present) {
      map['assessment_type'] = Variable<String>(assessmentType.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (selectedCharacterIds.present) {
      map['selected_character_ids'] = Variable<String>(
        selectedCharacterIds.value,
      );
    }
    if (confidence.present) {
      map['confidence'] = Variable<int>(confidence.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentAnswersCompanion(')
          ..write('assessmentType: $assessmentType, ')
          ..write('questionId: $questionId, ')
          ..write('selectedCharacterIds: $selectedCharacterIds, ')
          ..write('confidence: $confidence, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedOutputsTable extends CachedOutputs
    with TableInfo<$CachedOutputsTable, CachedOutput> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedOutputsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _outputJsonMeta = const VerificationMeta(
    'outputJson',
  );
  @override
  late final GeneratedColumn<String> outputJson = GeneratedColumn<String>(
    'output_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _promptVersionMeta = const VerificationMeta(
    'promptVersion',
  );
  @override
  late final GeneratedColumn<String> promptVersion = GeneratedColumn<String>(
    'prompt_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelVersionMeta = const VerificationMeta(
    'modelVersion',
  );
  @override
  late final GeneratedColumn<String> modelVersion = GeneratedColumn<String>(
    'model_version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schemaVersionMeta = const VerificationMeta(
    'schemaVersion',
  );
  @override
  late final GeneratedColumn<int> schemaVersion = GeneratedColumn<int>(
    'schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _generatedAtMeta = const VerificationMeta(
    'generatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
    'generated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    outputJson,
    promptVersion,
    modelVersion,
    schemaVersion,
    generatedAt,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_outputs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedOutput> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('output_json')) {
      context.handle(
        _outputJsonMeta,
        outputJson.isAcceptableOrUnknown(data['output_json']!, _outputJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_outputJsonMeta);
    }
    if (data.containsKey('prompt_version')) {
      context.handle(
        _promptVersionMeta,
        promptVersion.isAcceptableOrUnknown(
          data['prompt_version']!,
          _promptVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_promptVersionMeta);
    }
    if (data.containsKey('model_version')) {
      context.handle(
        _modelVersionMeta,
        modelVersion.isAcceptableOrUnknown(
          data['model_version']!,
          _modelVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_modelVersionMeta);
    }
    if (data.containsKey('schema_version')) {
      context.handle(
        _schemaVersionMeta,
        schemaVersion.isAcceptableOrUnknown(
          data['schema_version']!,
          _schemaVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_schemaVersionMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
        _generatedAtMeta,
        generatedAt.isAcceptableOrUnknown(
          data['generated_at']!,
          _generatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_generatedAtMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedOutput map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedOutput(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      outputJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}output_json'],
      )!,
      promptVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prompt_version'],
      )!,
      modelVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_version'],
      )!,
      schemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schema_version'],
      )!,
      generatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}generated_at'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedOutputsTable createAlias(String alias) {
    return $CachedOutputsTable(attachedDatabase, alias);
  }
}

class CachedOutput extends DataClass implements Insertable<CachedOutput> {
  final String id;
  final String outputJson;
  final String promptVersion;
  final String modelVersion;
  final int schemaVersion;
  final DateTime generatedAt;
  final DateTime cachedAt;
  const CachedOutput({
    required this.id,
    required this.outputJson,
    required this.promptVersion,
    required this.modelVersion,
    required this.schemaVersion,
    required this.generatedAt,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['output_json'] = Variable<String>(outputJson);
    map['prompt_version'] = Variable<String>(promptVersion);
    map['model_version'] = Variable<String>(modelVersion);
    map['schema_version'] = Variable<int>(schemaVersion);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedOutputsCompanion toCompanion(bool nullToAbsent) {
    return CachedOutputsCompanion(
      id: Value(id),
      outputJson: Value(outputJson),
      promptVersion: Value(promptVersion),
      modelVersion: Value(modelVersion),
      schemaVersion: Value(schemaVersion),
      generatedAt: Value(generatedAt),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedOutput.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedOutput(
      id: serializer.fromJson<String>(json['id']),
      outputJson: serializer.fromJson<String>(json['outputJson']),
      promptVersion: serializer.fromJson<String>(json['promptVersion']),
      modelVersion: serializer.fromJson<String>(json['modelVersion']),
      schemaVersion: serializer.fromJson<int>(json['schemaVersion']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'outputJson': serializer.toJson<String>(outputJson),
      'promptVersion': serializer.toJson<String>(promptVersion),
      'modelVersion': serializer.toJson<String>(modelVersion),
      'schemaVersion': serializer.toJson<int>(schemaVersion),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedOutput copyWith({
    String? id,
    String? outputJson,
    String? promptVersion,
    String? modelVersion,
    int? schemaVersion,
    DateTime? generatedAt,
    DateTime? cachedAt,
  }) => CachedOutput(
    id: id ?? this.id,
    outputJson: outputJson ?? this.outputJson,
    promptVersion: promptVersion ?? this.promptVersion,
    modelVersion: modelVersion ?? this.modelVersion,
    schemaVersion: schemaVersion ?? this.schemaVersion,
    generatedAt: generatedAt ?? this.generatedAt,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedOutput copyWithCompanion(CachedOutputsCompanion data) {
    return CachedOutput(
      id: data.id.present ? data.id.value : this.id,
      outputJson: data.outputJson.present
          ? data.outputJson.value
          : this.outputJson,
      promptVersion: data.promptVersion.present
          ? data.promptVersion.value
          : this.promptVersion,
      modelVersion: data.modelVersion.present
          ? data.modelVersion.value
          : this.modelVersion,
      schemaVersion: data.schemaVersion.present
          ? data.schemaVersion.value
          : this.schemaVersion,
      generatedAt: data.generatedAt.present
          ? data.generatedAt.value
          : this.generatedAt,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedOutput(')
          ..write('id: $id, ')
          ..write('outputJson: $outputJson, ')
          ..write('promptVersion: $promptVersion, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    outputJson,
    promptVersion,
    modelVersion,
    schemaVersion,
    generatedAt,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedOutput &&
          other.id == this.id &&
          other.outputJson == this.outputJson &&
          other.promptVersion == this.promptVersion &&
          other.modelVersion == this.modelVersion &&
          other.schemaVersion == this.schemaVersion &&
          other.generatedAt == this.generatedAt &&
          other.cachedAt == this.cachedAt);
}

class CachedOutputsCompanion extends UpdateCompanion<CachedOutput> {
  final Value<String> id;
  final Value<String> outputJson;
  final Value<String> promptVersion;
  final Value<String> modelVersion;
  final Value<int> schemaVersion;
  final Value<DateTime> generatedAt;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedOutputsCompanion({
    this.id = const Value.absent(),
    this.outputJson = const Value.absent(),
    this.promptVersion = const Value.absent(),
    this.modelVersion = const Value.absent(),
    this.schemaVersion = const Value.absent(),
    this.generatedAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedOutputsCompanion.insert({
    required String id,
    required String outputJson,
    required String promptVersion,
    required String modelVersion,
    required int schemaVersion,
    required DateTime generatedAt,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       outputJson = Value(outputJson),
       promptVersion = Value(promptVersion),
       modelVersion = Value(modelVersion),
       schemaVersion = Value(schemaVersion),
       generatedAt = Value(generatedAt),
       cachedAt = Value(cachedAt);
  static Insertable<CachedOutput> custom({
    Expression<String>? id,
    Expression<String>? outputJson,
    Expression<String>? promptVersion,
    Expression<String>? modelVersion,
    Expression<int>? schemaVersion,
    Expression<DateTime>? generatedAt,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (outputJson != null) 'output_json': outputJson,
      if (promptVersion != null) 'prompt_version': promptVersion,
      if (modelVersion != null) 'model_version': modelVersion,
      if (schemaVersion != null) 'schema_version': schemaVersion,
      if (generatedAt != null) 'generated_at': generatedAt,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedOutputsCompanion copyWith({
    Value<String>? id,
    Value<String>? outputJson,
    Value<String>? promptVersion,
    Value<String>? modelVersion,
    Value<int>? schemaVersion,
    Value<DateTime>? generatedAt,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedOutputsCompanion(
      id: id ?? this.id,
      outputJson: outputJson ?? this.outputJson,
      promptVersion: promptVersion ?? this.promptVersion,
      modelVersion: modelVersion ?? this.modelVersion,
      schemaVersion: schemaVersion ?? this.schemaVersion,
      generatedAt: generatedAt ?? this.generatedAt,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (outputJson.present) {
      map['output_json'] = Variable<String>(outputJson.value);
    }
    if (promptVersion.present) {
      map['prompt_version'] = Variable<String>(promptVersion.value);
    }
    if (modelVersion.present) {
      map['model_version'] = Variable<String>(modelVersion.value);
    }
    if (schemaVersion.present) {
      map['schema_version'] = Variable<int>(schemaVersion.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedOutputsCompanion(')
          ..write('id: $id, ')
          ..write('outputJson: $outputJson, ')
          ..write('promptVersion: $promptVersion, ')
          ..write('modelVersion: $modelVersion, ')
          ..write('schemaVersion: $schemaVersion, ')
          ..write('generatedAt: $generatedAt, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $AssessmentAnswersTable assessmentAnswers =
      $AssessmentAnswersTable(this);
  late final $CachedOutputsTable cachedOutputs = $CachedOutputsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    characters,
    assessmentAnswers,
    cachedOutputs,
  ];
}

typedef $$CharactersTableCreateCompanionBuilder =
    CharactersCompanion Function({
      required String id,
      required String displayName,
      Value<String?> canonHint,
      Value<int> rowid,
    });
typedef $$CharactersTableUpdateCompanionBuilder =
    CharactersCompanion Function({
      Value<String> id,
      Value<String> displayName,
      Value<String?> canonHint,
      Value<int> rowid,
    });

class $$CharactersTableFilterComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get canonHint => $composableBuilder(
    column: $table.canonHint,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get canonHint => $composableBuilder(
    column: $table.canonHint,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get canonHint =>
      $composableBuilder(column: $table.canonHint, builder: (column) => column);
}

class $$CharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharactersTable,
          Character,
          $$CharactersTableFilterComposer,
          $$CharactersTableOrderingComposer,
          $$CharactersTableAnnotationComposer,
          $$CharactersTableCreateCompanionBuilder,
          $$CharactersTableUpdateCompanionBuilder,
          (
            Character,
            BaseReferences<_$AppDatabase, $CharactersTable, Character>,
          ),
          Character,
          PrefetchHooks Function()
        > {
  $$CharactersTableTableManager(_$AppDatabase db, $CharactersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> canonHint = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharactersCompanion(
                id: id,
                displayName: displayName,
                canonHint: canonHint,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String displayName,
                Value<String?> canonHint = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharactersCompanion.insert(
                id: id,
                displayName: displayName,
                canonHint: canonHint,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharactersTable,
      Character,
      $$CharactersTableFilterComposer,
      $$CharactersTableOrderingComposer,
      $$CharactersTableAnnotationComposer,
      $$CharactersTableCreateCompanionBuilder,
      $$CharactersTableUpdateCompanionBuilder,
      (Character, BaseReferences<_$AppDatabase, $CharactersTable, Character>),
      Character,
      PrefetchHooks Function()
    >;
typedef $$AssessmentAnswersTableCreateCompanionBuilder =
    AssessmentAnswersCompanion Function({
      required String assessmentType,
      required String questionId,
      required String selectedCharacterIds,
      Value<int?> confidence,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$AssessmentAnswersTableUpdateCompanionBuilder =
    AssessmentAnswersCompanion Function({
      Value<String> assessmentType,
      Value<String> questionId,
      Value<String> selectedCharacterIds,
      Value<int?> confidence,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$AssessmentAnswersTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentAnswersTable> {
  $$AssessmentAnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get assessmentType => $composableBuilder(
    column: $table.assessmentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedCharacterIds => $composableBuilder(
    column: $table.selectedCharacterIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AssessmentAnswersTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentAnswersTable> {
  $$AssessmentAnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get assessmentType => $composableBuilder(
    column: $table.assessmentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedCharacterIds => $composableBuilder(
    column: $table.selectedCharacterIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AssessmentAnswersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentAnswersTable> {
  $$AssessmentAnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get assessmentType => $composableBuilder(
    column: $table.assessmentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedCharacterIds => $composableBuilder(
    column: $table.selectedCharacterIds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get confidence => $composableBuilder(
    column: $table.confidence,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AssessmentAnswersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssessmentAnswersTable,
          models.AssessmentAnswer,
          $$AssessmentAnswersTableFilterComposer,
          $$AssessmentAnswersTableOrderingComposer,
          $$AssessmentAnswersTableAnnotationComposer,
          $$AssessmentAnswersTableCreateCompanionBuilder,
          $$AssessmentAnswersTableUpdateCompanionBuilder,
          (
            models.AssessmentAnswer,
            BaseReferences<
              _$AppDatabase,
              $AssessmentAnswersTable,
              models.AssessmentAnswer
            >,
          ),
          models.AssessmentAnswer,
          PrefetchHooks Function()
        > {
  $$AssessmentAnswersTableTableManager(
    _$AppDatabase db,
    $AssessmentAnswersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentAnswersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> assessmentType = const Value.absent(),
                Value<String> questionId = const Value.absent(),
                Value<String> selectedCharacterIds = const Value.absent(),
                Value<int?> confidence = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentAnswersCompanion(
                assessmentType: assessmentType,
                questionId: questionId,
                selectedCharacterIds: selectedCharacterIds,
                confidence: confidence,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String assessmentType,
                required String questionId,
                required String selectedCharacterIds,
                Value<int?> confidence = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssessmentAnswersCompanion.insert(
                assessmentType: assessmentType,
                questionId: questionId,
                selectedCharacterIds: selectedCharacterIds,
                confidence: confidence,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AssessmentAnswersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssessmentAnswersTable,
      models.AssessmentAnswer,
      $$AssessmentAnswersTableFilterComposer,
      $$AssessmentAnswersTableOrderingComposer,
      $$AssessmentAnswersTableAnnotationComposer,
      $$AssessmentAnswersTableCreateCompanionBuilder,
      $$AssessmentAnswersTableUpdateCompanionBuilder,
      (
        models.AssessmentAnswer,
        BaseReferences<
          _$AppDatabase,
          $AssessmentAnswersTable,
          models.AssessmentAnswer
        >,
      ),
      models.AssessmentAnswer,
      PrefetchHooks Function()
    >;
typedef $$CachedOutputsTableCreateCompanionBuilder =
    CachedOutputsCompanion Function({
      required String id,
      required String outputJson,
      required String promptVersion,
      required String modelVersion,
      required int schemaVersion,
      required DateTime generatedAt,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$CachedOutputsTableUpdateCompanionBuilder =
    CachedOutputsCompanion Function({
      Value<String> id,
      Value<String> outputJson,
      Value<String> promptVersion,
      Value<String> modelVersion,
      Value<int> schemaVersion,
      Value<DateTime> generatedAt,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedOutputsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedOutputsTable> {
  $$CachedOutputsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get outputJson => $composableBuilder(
    column: $table.outputJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get promptVersion => $composableBuilder(
    column: $table.promptVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedOutputsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedOutputsTable> {
  $$CachedOutputsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get outputJson => $composableBuilder(
    column: $table.outputJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get promptVersion => $composableBuilder(
    column: $table.promptVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedOutputsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedOutputsTable> {
  $$CachedOutputsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get outputJson => $composableBuilder(
    column: $table.outputJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get promptVersion => $composableBuilder(
    column: $table.promptVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get modelVersion => $composableBuilder(
    column: $table.modelVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get schemaVersion => $composableBuilder(
    column: $table.schemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedOutputsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedOutputsTable,
          CachedOutput,
          $$CachedOutputsTableFilterComposer,
          $$CachedOutputsTableOrderingComposer,
          $$CachedOutputsTableAnnotationComposer,
          $$CachedOutputsTableCreateCompanionBuilder,
          $$CachedOutputsTableUpdateCompanionBuilder,
          (
            CachedOutput,
            BaseReferences<_$AppDatabase, $CachedOutputsTable, CachedOutput>,
          ),
          CachedOutput,
          PrefetchHooks Function()
        > {
  $$CachedOutputsTableTableManager(_$AppDatabase db, $CachedOutputsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedOutputsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedOutputsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedOutputsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> outputJson = const Value.absent(),
                Value<String> promptVersion = const Value.absent(),
                Value<String> modelVersion = const Value.absent(),
                Value<int> schemaVersion = const Value.absent(),
                Value<DateTime> generatedAt = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedOutputsCompanion(
                id: id,
                outputJson: outputJson,
                promptVersion: promptVersion,
                modelVersion: modelVersion,
                schemaVersion: schemaVersion,
                generatedAt: generatedAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String outputJson,
                required String promptVersion,
                required String modelVersion,
                required int schemaVersion,
                required DateTime generatedAt,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedOutputsCompanion.insert(
                id: id,
                outputJson: outputJson,
                promptVersion: promptVersion,
                modelVersion: modelVersion,
                schemaVersion: schemaVersion,
                generatedAt: generatedAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedOutputsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedOutputsTable,
      CachedOutput,
      $$CachedOutputsTableFilterComposer,
      $$CachedOutputsTableOrderingComposer,
      $$CachedOutputsTableAnnotationComposer,
      $$CachedOutputsTableCreateCompanionBuilder,
      $$CachedOutputsTableUpdateCompanionBuilder,
      (
        CachedOutput,
        BaseReferences<_$AppDatabase, $CachedOutputsTable, CachedOutput>,
      ),
      CachedOutput,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$AssessmentAnswersTableTableManager get assessmentAnswers =>
      $$AssessmentAnswersTableTableManager(_db, _db.assessmentAnswers);
  $$CachedOutputsTableTableManager get cachedOutputs =>
      $$CachedOutputsTableTableManager(_db, _db.cachedOutputs);
}
