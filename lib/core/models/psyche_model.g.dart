// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'psyche_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StructuralPositionImpl _$$StructuralPositionImplFromJson(
  Map<String, dynamic> json,
) => _$StructuralPositionImpl(
  primary: json['primary'] as String?,
  secondary:
      (json['secondary'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  confidence: (json['confidence'] as num?)?.toDouble() ?? 0.5,
  evidenceFlags:
      (json['evidenceFlags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$StructuralPositionImplToJson(
  _$StructuralPositionImpl instance,
) => <String, dynamic>{
  'primary': instance.primary,
  'secondary': instance.secondary,
  'confidence': instance.confidence,
  'evidenceFlags': instance.evidenceFlags,
};

_$SelfDirectionPositionImpl _$$SelfDirectionPositionImplFromJson(
  Map<String, dynamic> json,
) => _$SelfDirectionPositionImpl(
  vector:
      (json['vector'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const ['integration', 'growth'],
  confidence: (json['confidence'] as num?)?.toDouble() ?? 0.5,
  evidenceFlags:
      (json['evidenceFlags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$SelfDirectionPositionImplToJson(
  _$SelfDirectionPositionImpl instance,
) => <String, dynamic>{
  'vector': instance.vector,
  'confidence': instance.confidence,
  'evidenceFlags': instance.evidenceFlags,
};

_$MotifEntryImpl _$$MotifEntryImplFromJson(Map<String, dynamic> json) =>
    _$MotifEntryImpl(
      motif: json['motif'] as String,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$MotifEntryImplToJson(_$MotifEntryImpl instance) =>
    <String, dynamic>{'motif': instance.motif, 'score': instance.score};

_$UiLabelMappingImpl _$$UiLabelMappingImplFromJson(Map<String, dynamic> json) =>
    _$UiLabelMappingImpl(
      coreSelfRole: json['coreSelfRole'] as String? ?? 'EGO',
      socialSelfRole: json['socialSelfRole'] as String? ?? 'PERSONA',
      hiddenSelfRole: json['hiddenSelfRole'] as String? ?? 'SHADOW',
      innerOppositeRole:
          json['innerOppositeRole'] as String? ?? 'FEELING_FUNCTION',
      directionRole: json['directionRole'] as String? ?? 'SELF_DIRECTION',
      vitalityRole: json['vitalityRole'] as String? ?? 'EROS_AXIS',
    );

Map<String, dynamic> _$$UiLabelMappingImplToJson(
  _$UiLabelMappingImpl instance,
) => <String, dynamic>{
  'coreSelfRole': instance.coreSelfRole,
  'socialSelfRole': instance.socialSelfRole,
  'hiddenSelfRole': instance.hiddenSelfRole,
  'innerOppositeRole': instance.innerOppositeRole,
  'directionRole': instance.directionRole,
  'vitalityRole': instance.vitalityRole,
};

_$StabilityAnalysisImpl _$$StabilityAnalysisImplFromJson(
  Map<String, dynamic> json,
) => _$StabilityAnalysisImpl(
  profileType:
      $enumDecodeNullable(_$ProfileTypeEnumMap, json['profileType']) ??
      ProfileType.distributed,
  dominantCharacterId: json['dominantCharacterId'] as String?,
  shiftSummary:
      (json['shiftSummary'] as List<dynamic>?)
          ?.map((e) => ShiftSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$StabilityAnalysisImplToJson(
  _$StabilityAnalysisImpl instance,
) => <String, dynamic>{
  'profileType': _$ProfileTypeEnumMap[instance.profileType]!,
  'dominantCharacterId': instance.dominantCharacterId,
  'shiftSummary': instance.shiftSummary,
};

const _$ProfileTypeEnumMap = {
  ProfileType.dominant: 'DOMINANT',
  ProfileType.distributed: 'DISTRIBUTED',
  ProfileType.mixed: 'MIXED',
};

_$ShiftSummaryImpl _$$ShiftSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ShiftSummaryImpl(
      role: json['role'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      reasonFlags:
          (json['reasonFlags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ShiftSummaryImplToJson(_$ShiftSummaryImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'from': instance.from,
      'to': instance.to,
      'reasonFlags': instance.reasonFlags,
    };

_$InputHashesImpl _$$InputHashesImplFromJson(Map<String, dynamic> json) =>
    _$InputHashesImpl(
      lockedPacketsHash: json['lockedPacketsHash'] as String?,
      resonanceHash: json['resonanceHash'] as String?,
      assessmentHash: json['assessmentHash'] as String?,
      toneHash: json['toneHash'] as String?,
      meLockedPacketsHash: json['meLockedPacketsHash'] as String?,
      partnerLockedPacketsHash: json['partnerLockedPacketsHash'] as String?,
      partnerResonanceHash: json['partnerResonanceHash'] as String?,
      relationshipSettingsHash: json['relationshipSettingsHash'] as String?,
    );

Map<String, dynamic> _$$InputHashesImplToJson(_$InputHashesImpl instance) =>
    <String, dynamic>{
      'lockedPacketsHash': instance.lockedPacketsHash,
      'resonanceHash': instance.resonanceHash,
      'assessmentHash': instance.assessmentHash,
      'toneHash': instance.toneHash,
      'meLockedPacketsHash': instance.meLockedPacketsHash,
      'partnerLockedPacketsHash': instance.partnerLockedPacketsHash,
      'partnerResonanceHash': instance.partnerResonanceHash,
      'relationshipSettingsHash': instance.relationshipSettingsHash,
    };

_$EngineVersionsImpl _$$EngineVersionsImplFromJson(Map<String, dynamic> json) =>
    _$EngineVersionsImpl(
      recognition: json['recognition'] as String?,
      discovery: json['discovery'] as String?,
      resonance: json['resonance'] as String?,
      synthesis: json['synthesis'] as String?,
      constellation: json['constellation'] as String?,
      examples: json['examples'] as String?,
      narrative: json['narrative'] as String?,
    );

Map<String, dynamic> _$$EngineVersionsImplToJson(
  _$EngineVersionsImpl instance,
) => <String, dynamic>{
  'recognition': instance.recognition,
  'discovery': instance.discovery,
  'resonance': instance.resonance,
  'synthesis': instance.synthesis,
  'constellation': instance.constellation,
  'examples': instance.examples,
  'narrative': instance.narrative,
};

_$StructuralPositionsImpl _$$StructuralPositionsImplFromJson(
  Map<String, dynamic> json,
) => _$StructuralPositionsImpl(
  ego: json['EGO'] == null
      ? null
      : StructuralPosition.fromJson(json['EGO'] as Map<String, dynamic>),
  persona: json['PERSONA'] == null
      ? null
      : StructuralPosition.fromJson(json['PERSONA'] as Map<String, dynamic>),
  shadow: json['SHADOW'] == null
      ? null
      : StructuralPosition.fromJson(json['SHADOW'] as Map<String, dynamic>),
  feelingFunction: json['FEELING_FUNCTION'] == null
      ? null
      : StructuralPosition.fromJson(
          json['FEELING_FUNCTION'] as Map<String, dynamic>,
        ),
  erosAxis: json['EROS_AXIS'] == null
      ? null
      : StructuralPosition.fromJson(json['EROS_AXIS'] as Map<String, dynamic>),
  selfDirection: json['SELF_DIRECTION'] == null
      ? null
      : SelfDirectionPosition.fromJson(
          json['SELF_DIRECTION'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$StructuralPositionsImplToJson(
  _$StructuralPositionsImpl instance,
) => <String, dynamic>{
  'EGO': instance.ego,
  'PERSONA': instance.persona,
  'SHADOW': instance.shadow,
  'FEELING_FUNCTION': instance.feelingFunction,
  'EROS_AXIS': instance.erosAxis,
  'SELF_DIRECTION': instance.selfDirection,
};

_$RelationshipConstellationDataImpl
_$$RelationshipConstellationDataImplFromJson(Map<String, dynamic> json) =>
    _$RelationshipConstellationDataImpl(
      shared:
          (json['shared'] as List<dynamic>?)
              ?.map((e) => SharedMotifEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      complementary:
          (json['complementary'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ComplementaryMotifEntry.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      tensions:
          (json['tensions'] as List<dynamic>?)
              ?.map((e) => TensionEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      field: json['field'] == null
          ? null
          : FieldSummary.fromJson(json['field'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RelationshipConstellationDataImplToJson(
  _$RelationshipConstellationDataImpl instance,
) => <String, dynamic>{
  'shared': instance.shared,
  'complementary': instance.complementary,
  'tensions': instance.tensions,
  'field': instance.field,
};

_$SharedMotifEntryImpl _$$SharedMotifEntryImplFromJson(
  Map<String, dynamic> json,
) => _$SharedMotifEntryImpl(
  motif: json['motif'] as String,
  meScore: (json['meScore'] as num).toDouble(),
  partnerScore: (json['partnerScore'] as num).toDouble(),
  label: json['label'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$SharedMotifEntryImplToJson(
  _$SharedMotifEntryImpl instance,
) => <String, dynamic>{
  'motif': instance.motif,
  'meScore': instance.meScore,
  'partnerScore': instance.partnerScore,
  'label': instance.label,
  'description': instance.description,
};

_$ComplementaryMotifEntryImpl _$$ComplementaryMotifEntryImplFromJson(
  Map<String, dynamic> json,
) => _$ComplementaryMotifEntryImpl(
  motif: json['motif'] as String,
  highSide: json['highSide'] as String,
  delta: (json['delta'] as num).toDouble(),
  meScore: (json['meScore'] as num?)?.toDouble(),
  partnerScore: (json['partnerScore'] as num?)?.toDouble(),
  label: json['label'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$ComplementaryMotifEntryImplToJson(
  _$ComplementaryMotifEntryImpl instance,
) => <String, dynamic>{
  'motif': instance.motif,
  'highSide': instance.highSide,
  'delta': instance.delta,
  'meScore': instance.meScore,
  'partnerScore': instance.partnerScore,
  'label': instance.label,
  'description': instance.description,
};

_$TensionEntryImpl _$$TensionEntryImplFromJson(Map<String, dynamic> json) =>
    _$TensionEntryImpl(
      pair: (json['pair'] as List<dynamic>).map((e) => e as String).toList(),
      direction: json['direction'] as String,
      theme: json['theme'] as String?,
      themeLabel: json['themeLabel'] as String?,
      strength: (json['strength'] as num).toDouble(),
      labels:
          (json['labels'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TensionEntryImplToJson(_$TensionEntryImpl instance) =>
    <String, dynamic>{
      'pair': instance.pair,
      'direction': instance.direction,
      'theme': instance.theme,
      'themeLabel': instance.themeLabel,
      'strength': instance.strength,
      'labels': instance.labels,
    };

_$FieldSummaryImpl _$$FieldSummaryImplFromJson(Map<String, dynamic> json) =>
    _$FieldSummaryImpl(
      label: json['label'] as String,
      primaryThemes:
          (json['primaryThemes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      riskLoops:
          (json['riskLoops'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FieldSummaryImplToJson(_$FieldSummaryImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'primaryThemes': instance.primaryThemes,
      'riskLoops': instance.riskLoops,
    };

_$MeSummaryImpl _$$MeSummaryImplFromJson(Map<String, dynamic> json) =>
    _$MeSummaryImpl(
      runId: json['runId'] as String?,
      motifDistribution:
          (json['motifDistribution'] as List<dynamic>?)
              ?.map((e) => MotifEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MeSummaryImplToJson(_$MeSummaryImpl instance) =>
    <String, dynamic>{
      'runId': instance.runId,
      'motifDistribution': instance.motifDistribution,
    };

_$PsycheModelImpl _$$PsycheModelImplFromJson(
  Map<String, dynamic> json,
) => _$PsycheModelImpl(
  runId: json['runId'] as String,
  userId: json['userId'] as String,
  context: json['context'] as String,
  createdAt: json['createdAt'] as String,
  inputHashes: json['inputHashes'] == null
      ? null
      : InputHashes.fromJson(json['inputHashes'] as Map<String, dynamic>),
  engineVersions: json['engineVersions'] == null
      ? null
      : EngineVersions.fromJson(json['engineVersions'] as Map<String, dynamic>),
  structuralPositions: json['structuralPositions'] == null
      ? null
      : StructuralPositions.fromJson(
          json['structuralPositions'] as Map<String, dynamic>,
        ),
  motifDistribution:
      (json['motifDistribution'] as List<dynamic>?)
          ?.map((e) => MotifEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shadowMotifs:
      (json['shadowMotifs'] as List<dynamic>?)
          ?.map((e) => MotifEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  uiLabelMapping: json['uiLabelMapping'] == null
      ? null
      : UiLabelMapping.fromJson(json['uiLabelMapping'] as Map<String, dynamic>),
  stability: json['stability'] == null
      ? null
      : StabilityAnalysis.fromJson(json['stability'] as Map<String, dynamic>),
  qualityFlags:
      (json['qualityFlags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  partnerStructuralPositions: json['partnerStructuralPositions'] == null
      ? null
      : StructuralPositions.fromJson(
          json['partnerStructuralPositions'] as Map<String, dynamic>,
        ),
  partnerMotifDistribution:
      (json['partnerMotifDistribution'] as List<dynamic>?)
          ?.map((e) => MotifEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  partnerShadowMotifs:
      (json['partnerShadowMotifs'] as List<dynamic>?)
          ?.map((e) => MotifEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  partnerUiLabelMapping: json['partnerUiLabelMapping'] == null
      ? null
      : UiLabelMapping.fromJson(
          json['partnerUiLabelMapping'] as Map<String, dynamic>,
        ),
  relationshipConstellation: json['relationshipConstellation'] == null
      ? null
      : RelationshipConstellationData.fromJson(
          json['relationshipConstellation'] as Map<String, dynamic>,
        ),
  meSummary: json['meSummary'] == null
      ? null
      : MeSummary.fromJson(json['meSummary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PsycheModelImplToJson(_$PsycheModelImpl instance) =>
    <String, dynamic>{
      'runId': instance.runId,
      'userId': instance.userId,
      'context': instance.context,
      'createdAt': instance.createdAt,
      'inputHashes': instance.inputHashes,
      'engineVersions': instance.engineVersions,
      'structuralPositions': instance.structuralPositions,
      'motifDistribution': instance.motifDistribution,
      'shadowMotifs': instance.shadowMotifs,
      'uiLabelMapping': instance.uiLabelMapping,
      'stability': instance.stability,
      'qualityFlags': instance.qualityFlags,
      'partnerStructuralPositions': instance.partnerStructuralPositions,
      'partnerMotifDistribution': instance.partnerMotifDistribution,
      'partnerShadowMotifs': instance.partnerShadowMotifs,
      'partnerUiLabelMapping': instance.partnerUiLabelMapping,
      'relationshipConstellation': instance.relationshipConstellation,
      'meSummary': instance.meSummary,
    };

_$RunGenerateResponseImpl _$$RunGenerateResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RunGenerateResponseImpl(
  runId: json['runId'] as String,
  cached: json['cached'] as bool? ?? false,
);

Map<String, dynamic> _$$RunGenerateResponseImplToJson(
  _$RunGenerateResponseImpl instance,
) => <String, dynamic>{'runId': instance.runId, 'cached': instance.cached};

_$RunLatestResponseImpl _$$RunLatestResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RunLatestResponseImpl(
  runId: json['runId'] as String,
  createdAt: json['createdAt'] as String?,
  context: json['context'] as String?,
);

Map<String, dynamic> _$$RunLatestResponseImplToJson(
  _$RunLatestResponseImpl instance,
) => <String, dynamic>{
  'runId': instance.runId,
  'createdAt': instance.createdAt,
  'context': instance.context,
};
