// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resonance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VersionOptionImpl _$$VersionOptionImplFromJson(Map<String, dynamic> json) =>
    _$VersionOptionImpl(
      versionId: json['versionId'] as String,
      label: json['label'] as String,
      cue: json['cue'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      exampleRefs:
          (json['exampleRefs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$VersionOptionImplToJson(_$VersionOptionImpl instance) =>
    <String, dynamic>{
      'versionId': instance.versionId,
      'label': instance.label,
      'cue': instance.cue,
      'tags': instance.tags,
      'exampleRefs': instance.exampleRefs,
    };

_$PhaseOptionImpl _$$PhaseOptionImplFromJson(Map<String, dynamic> json) =>
    _$PhaseOptionImpl(
      phaseId: json['phaseId'] as String,
      label: json['label'] as String,
      cue: json['cue'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      exampleRefs:
          (json['exampleRefs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      excludable: json['excludable'] as bool? ?? true,
    );

Map<String, dynamic> _$$PhaseOptionImplToJson(_$PhaseOptionImpl instance) =>
    <String, dynamic>{
      'phaseId': instance.phaseId,
      'label': instance.label,
      'cue': instance.cue,
      'tags': instance.tags,
      'exampleRefs': instance.exampleRefs,
      'excludable': instance.excludable,
    };

_$CharacterReferenceImpl _$$CharacterReferenceImplFromJson(
  Map<String, dynamic> json,
) => _$CharacterReferenceImpl(
  mode:
      $enumDecodeNullable(_$ReferenceModeEnumMap, json['mode']) ??
      ReferenceMode.none,
  versionId: json['versionId'] as String?,
  phaseId: json['phaseId'] as String?,
  excludedPhaseIds:
      (json['excludedPhaseIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  text: json['text'] as String?,
);

Map<String, dynamic> _$$CharacterReferenceImplToJson(
  _$CharacterReferenceImpl instance,
) => <String, dynamic>{
  'mode': _$ReferenceModeEnumMap[instance.mode]!,
  'versionId': instance.versionId,
  'phaseId': instance.phaseId,
  'excludedPhaseIds': instance.excludedPhaseIds,
  'tags': instance.tags,
  'text': instance.text,
};

const _$ReferenceModeEnumMap = {
  ReferenceMode.none: 'NONE',
  ReferenceMode.general: 'GENERAL',
  ReferenceMode.specific: 'SPECIFIC',
};

_$ResonanceInputImpl _$$ResonanceInputImplFromJson(Map<String, dynamic> json) =>
    _$ResonanceInputImpl(
      positiveText: json['positiveText'] as String?,
      negativeText: json['negativeText'] as String?,
      anchorMoment: json['anchorMoment'] as String?,
      admire: json['admire'] as String?,
      reject: json['reject'] as String?,
    );

Map<String, dynamic> _$$ResonanceInputImplToJson(
  _$ResonanceInputImpl instance,
) => <String, dynamic>{
  'positiveText': instance.positiveText,
  'negativeText': instance.negativeText,
  'anchorMoment': instance.anchorMoment,
  'admire': instance.admire,
  'reject': instance.reject,
};

_$CharacterAmbiguityAnalysisImpl _$$CharacterAmbiguityAnalysisImplFromJson(
  Map<String, dynamic> json,
) => _$CharacterAmbiguityAnalysisImpl(
  input: json['input'] as String,
  characterName: json['characterName'] as String?,
  canonicalId: json['canonicalId'] as String?,
  franchise: json['franchise'] as String?,
  medium: json['medium'] as String?,
  referenceDescription: json['referenceDescription'] as String?,
  needsClarification: json['needsClarification'] as bool? ?? false,
  disambiguationReason: json['disambiguationReason'] as String?,
  clarificationMessage: json['clarificationMessage'] as String?,
  aiNeedsClarification: json['aiNeedsClarification'] as bool? ?? false,
  inputWasActor: json['inputWasActor'] as bool? ?? false,
  versionOptions:
      (json['versionOptions'] as List<dynamic>?)
          ?.map((e) => VersionOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  phaseOptions:
      (json['phaseOptions'] as List<dynamic>?)
          ?.map((e) => PhaseOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  showExclusionSection: json['showExclusionSection'] as bool? ?? false,
  selectedReference: json['selectedReference'] == null
      ? null
      : CharacterReference.fromJson(
          json['selectedReference'] as Map<String, dynamic>,
        ),
  hasEntryReference: json['hasEntryReference'] as bool? ?? false,
  entryReferenceText: json['entryReferenceText'] as String?,
  entryReferenceMismatch: json['entryReferenceMismatch'] as bool? ?? false,
  entryReferenceMismatchMessage:
      json['entryReferenceMismatchMessage'] as String?,
  alternativeCandidates:
      (json['alternativeCandidates'] as List<dynamic>?)
          ?.map((e) => AlternativeCandidate.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CharacterAmbiguityAnalysisImplToJson(
  _$CharacterAmbiguityAnalysisImpl instance,
) => <String, dynamic>{
  'input': instance.input,
  'characterName': instance.characterName,
  'canonicalId': instance.canonicalId,
  'franchise': instance.franchise,
  'medium': instance.medium,
  'referenceDescription': instance.referenceDescription,
  'needsClarification': instance.needsClarification,
  'disambiguationReason': instance.disambiguationReason,
  'clarificationMessage': instance.clarificationMessage,
  'aiNeedsClarification': instance.aiNeedsClarification,
  'inputWasActor': instance.inputWasActor,
  'versionOptions': instance.versionOptions,
  'phaseOptions': instance.phaseOptions,
  'showExclusionSection': instance.showExclusionSection,
  'selectedReference': instance.selectedReference,
  'hasEntryReference': instance.hasEntryReference,
  'entryReferenceText': instance.entryReferenceText,
  'entryReferenceMismatch': instance.entryReferenceMismatch,
  'entryReferenceMismatchMessage': instance.entryReferenceMismatchMessage,
  'alternativeCandidates': instance.alternativeCandidates,
};

_$AlternativeCandidateImpl _$$AlternativeCandidateImplFromJson(
  Map<String, dynamic> json,
) => _$AlternativeCandidateImpl(
  canonicalId: json['canonicalId'] as String,
  name: json['name'] as String,
  franchise: json['franchise'] as String?,
  medium: json['medium'] as String?,
  matchesReference: json['matchesReference'] as bool? ?? false,
);

Map<String, dynamic> _$$AlternativeCandidateImplToJson(
  _$AlternativeCandidateImpl instance,
) => <String, dynamic>{
  'canonicalId': instance.canonicalId,
  'name': instance.name,
  'franchise': instance.franchise,
  'medium': instance.medium,
  'matchesReference': instance.matchesReference,
};

_$ResonanceAnalysisResponseImpl _$$ResonanceAnalysisResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ResonanceAnalysisResponseImpl(
  success: json['success'] as bool? ?? false,
  needsClarification: json['needsClarification'] as bool? ?? false,
  characters:
      (json['characters'] as List<dynamic>?)
          ?.map(
            (e) =>
                CharacterAmbiguityAnalysis.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  recognitionSummary: json['recognitionSummary'] == null
      ? null
      : ResonanceSummary.fromJson(
          json['recognitionSummary'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$ResonanceAnalysisResponseImplToJson(
  _$ResonanceAnalysisResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'needsClarification': instance.needsClarification,
  'characters': instance.characters,
  'recognitionSummary': instance.recognitionSummary,
};

_$ResonanceSummaryImpl _$$ResonanceSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$ResonanceSummaryImpl(
  total: (json['total'] as num?)?.toInt() ?? 0,
  recognized: (json['recognized'] as num?)?.toInt() ?? 0,
  needsClarification: (json['needsClarification'] as num?)?.toInt() ?? 0,
  withEntryReferences: (json['withEntryReferences'] as num?)?.toInt() ?? 0,
  referenceMismatches: (json['referenceMismatches'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$ResonanceSummaryImplToJson(
  _$ResonanceSummaryImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'recognized': instance.recognized,
  'needsClarification': instance.needsClarification,
  'withEntryReferences': instance.withEntryReferences,
  'referenceMismatches': instance.referenceMismatches,
};

_$ClarificationChoiceImpl _$$ClarificationChoiceImplFromJson(
  Map<String, dynamic> json,
) => _$ClarificationChoiceImpl(
  referenceMode: json['referenceMode'] as String? ?? 'NONE',
  versionId: json['versionId'] as String?,
  phaseId: json['phaseId'] as String?,
  excludedPhaseIds:
      (json['excludedPhaseIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  referenceTags:
      (json['referenceTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  referenceText: json['referenceText'] as String?,
  positiveText: json['positiveText'] as String?,
  negativeText: json['negativeText'] as String?,
);

Map<String, dynamic> _$$ClarificationChoiceImplToJson(
  _$ClarificationChoiceImpl instance,
) => <String, dynamic>{
  'referenceMode': instance.referenceMode,
  'versionId': instance.versionId,
  'phaseId': instance.phaseId,
  'excludedPhaseIds': instance.excludedPhaseIds,
  'referenceTags': instance.referenceTags,
  'referenceText': instance.referenceText,
  'positiveText': instance.positiveText,
  'negativeText': instance.negativeText,
};

_$RerecognizeResponseImpl _$$RerecognizeResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RerecognizeResponseImpl(
  success: json['success'] as bool? ?? false,
  characterIndex: (json['characterIndex'] as num?)?.toInt() ?? 0,
  originalInput: json['originalInput'] as String?,
  updatedCharacter: json['updatedCharacter'] == null
      ? null
      : RerecognizedCharacter.fromJson(
          json['updatedCharacter'] as Map<String, dynamic>,
        ),
  message: json['message'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$$RerecognizeResponseImplToJson(
  _$RerecognizeResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'characterIndex': instance.characterIndex,
  'originalInput': instance.originalInput,
  'updatedCharacter': instance.updatedCharacter,
  'message': instance.message,
  'error': instance.error,
};

_$RerecognizedCharacterImpl _$$RerecognizedCharacterImplFromJson(
  Map<String, dynamic> json,
) => _$RerecognizedCharacterImpl(
  input: json['input'] as String,
  characterName: json['characterName'] as String?,
  canonicalId: json['canonicalId'] as String?,
  franchise: json['franchise'] as String?,
  medium: json['medium'] as String?,
  confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
  needsClarification: json['needsClarification'] as bool? ?? false,
  versionOptions:
      (json['versionOptions'] as List<dynamic>?)
          ?.map((e) => VersionOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  phaseOptions:
      (json['phaseOptions'] as List<dynamic>?)
          ?.map((e) => PhaseOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  wasRerecognized: json['wasRerecognized'] as bool? ?? false,
);

Map<String, dynamic> _$$RerecognizedCharacterImplToJson(
  _$RerecognizedCharacterImpl instance,
) => <String, dynamic>{
  'input': instance.input,
  'characterName': instance.characterName,
  'canonicalId': instance.canonicalId,
  'franchise': instance.franchise,
  'medium': instance.medium,
  'confidence': instance.confidence,
  'needsClarification': instance.needsClarification,
  'versionOptions': instance.versionOptions,
  'phaseOptions': instance.phaseOptions,
  'wasRerecognized': instance.wasRerecognized,
};
