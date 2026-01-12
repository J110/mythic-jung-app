// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RelationshipCharacterSetImpl _$$RelationshipCharacterSetImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipCharacterSetImpl(
  userId: json['userId'] as String,
  enabled: json['enabled'] as bool? ?? false,
  relationshipType: json['relationshipType'] as String? ?? 'platonic',
  otherLabel: json['otherLabel'] as String? ?? 'friend',
  characters:
      (json['characters'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  rawInputs:
      (json['rawInputs'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$RelationshipCharacterSetImplToJson(
  _$RelationshipCharacterSetImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'enabled': instance.enabled,
  'relationshipType': instance.relationshipType,
  'otherLabel': instance.otherLabel,
  'characters': instance.characters,
  'rawInputs': instance.rawInputs,
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_$RelationshipModelImpl _$$RelationshipModelImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipModelImpl(
  type: json['type'] as String,
  field: json['field'] == null
      ? null
      : RelationshipField.fromJson(json['field'] as Map<String, dynamic>),
  bondingAxis: json['bondingAxis'] == null
      ? null
      : BondingAxis.fromJson(json['bondingAxis'] as Map<String, dynamic>),
  projectionShadow: json['projectionShadow'] == null
      ? null
      : ProjectionShadow.fromJson(
          json['projectionShadow'] as Map<String, dynamic>,
        ),
  egoPersonaMismatch: json['egoPersonaMismatch'] == null
      ? null
      : EgoPersonaMismatch.fromJson(
          json['egoPersonaMismatch'] as Map<String, dynamic>,
        ),
  communicationConflict: json['communicationConflict'] == null
      ? null
      : CommunicationConflict.fromJson(
          json['communicationConflict'] as Map<String, dynamic>,
        ),
  needsBoundaries: json['needsBoundaries'] == null
      ? null
      : NeedsBoundaries.fromJson(
          json['needsBoundaries'] as Map<String, dynamic>,
        ),
  growthPath: json['growthPath'] == null
      ? null
      : GrowthPath.fromJson(json['growthPath'] as Map<String, dynamic>),
  redFlagsRepair: json['redFlagsRepair'] == null
      ? null
      : RedFlagsRepair.fromJson(json['redFlagsRepair'] as Map<String, dynamic>),
  nextStepsSituations:
      (json['nextStepsSituations'] as List<dynamic>?)
          ?.map((e) => NextStepSituation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$RelationshipModelImplToJson(
  _$RelationshipModelImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'field': instance.field,
  'bondingAxis': instance.bondingAxis,
  'projectionShadow': instance.projectionShadow,
  'egoPersonaMismatch': instance.egoPersonaMismatch,
  'communicationConflict': instance.communicationConflict,
  'needsBoundaries': instance.needsBoundaries,
  'growthPath': instance.growthPath,
  'redFlagsRepair': instance.redFlagsRepair,
  'nextStepsSituations': instance.nextStepsSituations,
};

_$RelationshipFieldImpl _$$RelationshipFieldImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipFieldImpl(
  summary: json['summary'] as String?,
  story: json['story'] as String?,
  analysisBullets:
      (json['analysisBullets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  exampleRefs:
      (json['exampleRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$RelationshipFieldImplToJson(
  _$RelationshipFieldImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'story': instance.story,
  'analysisBullets': instance.analysisBullets,
  'exampleRefs': instance.exampleRefs,
};

_$BondingAxisImpl _$$BondingAxisImplFromJson(Map<String, dynamic> json) =>
    _$BondingAxisImpl(
      summary: json['summary'] as String?,
      story: json['story'] as String?,
      analysisBullets:
          (json['analysisBullets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exampleRefs:
          (json['exampleRefs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BondingAxisImplToJson(_$BondingAxisImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'story': instance.story,
      'analysisBullets': instance.analysisBullets,
      'exampleRefs': instance.exampleRefs,
    };

_$ProjectionShadowImpl _$$ProjectionShadowImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectionShadowImpl(
  summary: json['summary'] as String?,
  story: json['story'] as String?,
  analysisBullets:
      (json['analysisBullets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  exampleRefs:
      (json['exampleRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ProjectionShadowImplToJson(
  _$ProjectionShadowImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'story': instance.story,
  'analysisBullets': instance.analysisBullets,
  'exampleRefs': instance.exampleRefs,
};

_$EgoPersonaMismatchImpl _$$EgoPersonaMismatchImplFromJson(
  Map<String, dynamic> json,
) => _$EgoPersonaMismatchImpl(
  summary: json['summary'] as String?,
  story: json['story'] as String?,
  analysisBullets:
      (json['analysisBullets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  exampleRefs:
      (json['exampleRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$EgoPersonaMismatchImplToJson(
  _$EgoPersonaMismatchImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'story': instance.story,
  'analysisBullets': instance.analysisBullets,
  'exampleRefs': instance.exampleRefs,
};

_$CommunicationConflictImpl _$$CommunicationConflictImplFromJson(
  Map<String, dynamic> json,
) => _$CommunicationConflictImpl(
  summary: json['summary'] as String?,
  story: json['story'] as String?,
  analysisBullets:
      (json['analysisBullets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  exampleRefs:
      (json['exampleRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CommunicationConflictImplToJson(
  _$CommunicationConflictImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'story': instance.story,
  'analysisBullets': instance.analysisBullets,
  'exampleRefs': instance.exampleRefs,
};

_$NeedsBoundariesImpl _$$NeedsBoundariesImplFromJson(
  Map<String, dynamic> json,
) => _$NeedsBoundariesImpl(
  summary: json['summary'] as String?,
  story: json['story'] as String?,
  analysisBullets:
      (json['analysisBullets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  exampleRefs:
      (json['exampleRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$NeedsBoundariesImplToJson(
  _$NeedsBoundariesImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'story': instance.story,
  'analysisBullets': instance.analysisBullets,
  'exampleRefs': instance.exampleRefs,
};

_$GrowthPathImpl _$$GrowthPathImplFromJson(Map<String, dynamic> json) =>
    _$GrowthPathImpl(
      summary: json['summary'] as String?,
      story: json['story'] as String?,
      analysisBullets:
          (json['analysisBullets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exampleRefs:
          (json['exampleRefs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GrowthPathImplToJson(_$GrowthPathImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'story': instance.story,
      'analysisBullets': instance.analysisBullets,
      'exampleRefs': instance.exampleRefs,
    };

_$RedFlagsRepairImpl _$$RedFlagsRepairImplFromJson(Map<String, dynamic> json) =>
    _$RedFlagsRepairImpl(
      summary: json['summary'] as String?,
      story: json['story'] as String?,
      analysisBullets:
          (json['analysisBullets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exampleRefs:
          (json['exampleRefs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RedFlagsRepairImplToJson(
  _$RedFlagsRepairImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'story': instance.story,
  'analysisBullets': instance.analysisBullets,
  'exampleRefs': instance.exampleRefs,
};

_$NextStepSituationImpl _$$NextStepSituationImplFromJson(
  Map<String, dynamic> json,
) => _$NextStepSituationImpl(
  title: json['title'] as String?,
  context: json['context'] as String?,
  guidance: json['guidance'] as String?,
  exampleRefs:
      (json['exampleRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$NextStepSituationImplToJson(
  _$NextStepSituationImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'context': instance.context,
  'guidance': instance.guidance,
  'exampleRefs': instance.exampleRefs,
};

_$RelationshipOutputImpl _$$RelationshipOutputImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipOutputImpl(
  myth: json['myth'] == null
      ? null
      : RelationshipMyth.fromJson(json['myth'] as Map<String, dynamic>),
  relationshipModel: json['relationshipModel'] == null
      ? null
      : RelationshipModel.fromJson(
          json['relationshipModel'] as Map<String, dynamic>,
        ),
  narrative: json['narrative'] == null
      ? null
      : RelationshipNarrative.fromJson(
          json['narrative'] as Map<String, dynamic>,
        ),
  examples: json['examples'] == null
      ? null
      : RelationshipExamples.fromJson(json['examples'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : RelationshipMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$RelationshipOutputImplToJson(
  _$RelationshipOutputImpl instance,
) => <String, dynamic>{
  'myth': instance.myth,
  'relationshipModel': instance.relationshipModel,
  'narrative': instance.narrative,
  'examples': instance.examples,
  'meta': instance.meta,
};

_$RelationshipMythImpl _$$RelationshipMythImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipMythImpl(
  title: json['title'] as String?,
  summary: json['summary'] as String?,
  story: json['story'] as String?,
  themes:
      (json['themes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$RelationshipMythImplToJson(
  _$RelationshipMythImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'summary': instance.summary,
  'story': instance.story,
  'themes': instance.themes,
};

_$RelationshipNarrativeImpl _$$RelationshipNarrativeImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipNarrativeImpl(
  relationalField: json['relationalField'] == null
      ? null
      : ModuleNarrative.fromJson(
          json['relationalField'] as Map<String, dynamic>,
        ),
  attractionBonding: json['attractionBonding'] == null
      ? null
      : ModuleNarrative.fromJson(
          json['attractionBonding'] as Map<String, dynamic>,
        ),
  projectionShadow: json['projectionShadow'] == null
      ? null
      : ModuleNarrative.fromJson(
          json['projectionShadow'] as Map<String, dynamic>,
        ),
  egoPersonaMismatch: json['egoPersonaMismatch'] == null
      ? null
      : ModuleNarrative.fromJson(
          json['egoPersonaMismatch'] as Map<String, dynamic>,
        ),
  communicationConflict: json['communicationConflict'] == null
      ? null
      : ModuleNarrative.fromJson(
          json['communicationConflict'] as Map<String, dynamic>,
        ),
  needsBoundaries: json['needsBoundaries'] == null
      ? null
      : ModuleNarrative.fromJson(
          json['needsBoundaries'] as Map<String, dynamic>,
        ),
  growthPath: json['growthPath'] == null
      ? null
      : ModuleNarrative.fromJson(json['growthPath'] as Map<String, dynamic>),
  redFlagsRepair: json['redFlagsRepair'] == null
      ? null
      : ModuleNarrative.fromJson(
          json['redFlagsRepair'] as Map<String, dynamic>,
        ),
  nextSteps:
      (json['nextSteps'] as List<dynamic>?)
          ?.map((e) => SituationalGuidance.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$RelationshipNarrativeImplToJson(
  _$RelationshipNarrativeImpl instance,
) => <String, dynamic>{
  'relationalField': instance.relationalField,
  'attractionBonding': instance.attractionBonding,
  'projectionShadow': instance.projectionShadow,
  'egoPersonaMismatch': instance.egoPersonaMismatch,
  'communicationConflict': instance.communicationConflict,
  'needsBoundaries': instance.needsBoundaries,
  'growthPath': instance.growthPath,
  'redFlagsRepair': instance.redFlagsRepair,
  'nextSteps': instance.nextSteps,
};

_$ModuleNarrativeImpl _$$ModuleNarrativeImplFromJson(
  Map<String, dynamic> json,
) => _$ModuleNarrativeImpl(
  summary: json['summary'] as String?,
  story: json['story'] as String?,
  analysisBullets:
      (json['analysisBullets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  situations:
      (json['situations'] as List<dynamic>?)
          ?.map((e) => SituationalExample.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ModuleNarrativeImplToJson(
  _$ModuleNarrativeImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'story': instance.story,
  'analysisBullets': instance.analysisBullets,
  'situations': instance.situations,
};

_$SituationalExampleImpl _$$SituationalExampleImplFromJson(
  Map<String, dynamic> json,
) => _$SituationalExampleImpl(
  title: json['title'] as String?,
  description: json['description'] as String?,
  exampleRefs:
      (json['exampleRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$SituationalExampleImplToJson(
  _$SituationalExampleImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'exampleRefs': instance.exampleRefs,
};

_$SituationalGuidanceImpl _$$SituationalGuidanceImplFromJson(
  Map<String, dynamic> json,
) => _$SituationalGuidanceImpl(
  situation: json['situation'] as String?,
  guidance: json['guidance'] as String?,
  exampleRefs:
      (json['exampleRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$SituationalGuidanceImplToJson(
  _$SituationalGuidanceImpl instance,
) => <String, dynamic>{
  'situation': instance.situation,
  'guidance': instance.guidance,
  'exampleRefs': instance.exampleRefs,
};

_$RelationshipExamplesImpl _$$RelationshipExamplesImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipExamplesImpl(
  relationalField:
      (json['relationalField'] as List<dynamic>?)
          ?.map(
            (e) => RelationshipExampleRef.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  attractionBonding:
      (json['attractionBonding'] as List<dynamic>?)
          ?.map(
            (e) => RelationshipExampleRef.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  projectionShadow:
      (json['projectionShadow'] as List<dynamic>?)
          ?.map(
            (e) => RelationshipExampleRef.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  egoPersonaMismatch:
      (json['egoPersonaMismatch'] as List<dynamic>?)
          ?.map(
            (e) => RelationshipExampleRef.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  communicationConflict:
      (json['communicationConflict'] as List<dynamic>?)
          ?.map(
            (e) => RelationshipExampleRef.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  needsBoundaries:
      (json['needsBoundaries'] as List<dynamic>?)
          ?.map(
            (e) => RelationshipExampleRef.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  growthPath:
      (json['growthPath'] as List<dynamic>?)
          ?.map(
            (e) => RelationshipExampleRef.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  redFlagsRepair:
      (json['redFlagsRepair'] as List<dynamic>?)
          ?.map(
            (e) => RelationshipExampleRef.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  nextSteps:
      (json['nextSteps'] as List<dynamic>?)
          ?.map(
            (e) => RelationshipExampleRef.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$RelationshipExamplesImplToJson(
  _$RelationshipExamplesImpl instance,
) => <String, dynamic>{
  'relationalField': instance.relationalField,
  'attractionBonding': instance.attractionBonding,
  'projectionShadow': instance.projectionShadow,
  'egoPersonaMismatch': instance.egoPersonaMismatch,
  'communicationConflict': instance.communicationConflict,
  'needsBoundaries': instance.needsBoundaries,
  'growthPath': instance.growthPath,
  'redFlagsRepair': instance.redFlagsRepair,
  'nextSteps': instance.nextSteps,
};

_$RelationshipExampleRefImpl _$$RelationshipExampleRefImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipExampleRefImpl(
  characterName: json['characterName'] as String?,
  fromSide: json['fromSide'] as String?,
  reference: json['reference'] == null
      ? null
      : RelationshipExampleReference.fromJson(
          json['reference'] as Map<String, dynamic>,
        ),
  situation: json['situation'] as String?,
  actions:
      (json['actions'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  outcomeAndCost:
      (json['outcomeAndCost'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  tier: json['tier'] as String? ?? 'B',
);

Map<String, dynamic> _$$RelationshipExampleRefImplToJson(
  _$RelationshipExampleRefImpl instance,
) => <String, dynamic>{
  'characterName': instance.characterName,
  'fromSide': instance.fromSide,
  'reference': instance.reference,
  'situation': instance.situation,
  'actions': instance.actions,
  'outcomeAndCost': instance.outcomeAndCost,
  'tier': instance.tier,
};

_$RelationshipExampleReferenceImpl _$$RelationshipExampleReferenceImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipExampleReferenceImpl(
  title: json['title'] as String?,
  year: json['year'] as String?,
  medium: json['medium'] as String? ?? 'film',
);

Map<String, dynamic> _$$RelationshipExampleReferenceImplToJson(
  _$RelationshipExampleReferenceImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'year': instance.year,
  'medium': instance.medium,
};

_$RelationshipMetaImpl _$$RelationshipMetaImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipMetaImpl(
  generatedAt: json['generatedAt'] as String?,
  modelVersion: json['modelVersion'] as String?,
  inputHash: json['inputHash'] as String?,
  relationshipType: json['relationshipType'] as String?,
  hasMeData: json['hasMeData'] as bool?,
);

Map<String, dynamic> _$$RelationshipMetaImplToJson(
  _$RelationshipMetaImpl instance,
) => <String, dynamic>{
  'generatedAt': instance.generatedAt,
  'modelVersion': instance.modelVersion,
  'inputHash': instance.inputHash,
  'relationshipType': instance.relationshipType,
  'hasMeData': instance.hasMeData,
};
