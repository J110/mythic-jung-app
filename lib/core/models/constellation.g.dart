// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constellation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StructuralAssignmentImpl _$$StructuralAssignmentImplFromJson(
  Map<String, dynamic> json,
) => _$StructuralAssignmentImpl(
  primary: json['primary'] as String?,
  secondary:
      (json['secondary'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  confidence: (json['confidence'] as num?)?.toDouble() ?? 0.5,
);

Map<String, dynamic> _$$StructuralAssignmentImplToJson(
  _$StructuralAssignmentImpl instance,
) => <String, dynamic>{
  'primary': instance.primary,
  'secondary': instance.secondary,
  'confidence': instance.confidence,
};

_$SelfDirectionAssignmentImpl _$$SelfDirectionAssignmentImplFromJson(
  Map<String, dynamic> json,
) => _$SelfDirectionAssignmentImpl(
  vector:
      (json['vector'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  confidence: (json['confidence'] as num?)?.toDouble() ?? 0.5,
);

Map<String, dynamic> _$$SelfDirectionAssignmentImplToJson(
  _$SelfDirectionAssignmentImpl instance,
) => <String, dynamic>{
  'vector': instance.vector,
  'confidence': instance.confidence,
};

_$StructuralArchetypesImpl _$$StructuralArchetypesImplFromJson(
  Map<String, dynamic> json,
) => _$StructuralArchetypesImpl(
  ego: json['EGO'] == null
      ? null
      : StructuralAssignment.fromJson(json['EGO'] as Map<String, dynamic>),
  persona: json['PERSONA'] == null
      ? null
      : StructuralAssignment.fromJson(json['PERSONA'] as Map<String, dynamic>),
  shadow: json['SHADOW'] == null
      ? null
      : StructuralAssignment.fromJson(json['SHADOW'] as Map<String, dynamic>),
  animaAnimus: json['ANIMA_ANIMUS'] == null
      ? null
      : StructuralAssignment.fromJson(
          json['ANIMA_ANIMUS'] as Map<String, dynamic>,
        ),
  selfDirection: json['SELF_DIRECTION'] == null
      ? null
      : SelfDirectionAssignment.fromJson(
          json['SELF_DIRECTION'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$StructuralArchetypesImplToJson(
  _$StructuralArchetypesImpl instance,
) => <String, dynamic>{
  'EGO': instance.ego,
  'PERSONA': instance.persona,
  'SHADOW': instance.shadow,
  'ANIMA_ANIMUS': instance.animaAnimus,
  'SELF_DIRECTION': instance.selfDirection,
};

_$MotifScoreImpl _$$MotifScoreImplFromJson(Map<String, dynamic> json) =>
    _$MotifScoreImpl(
      motif: json['motif'] as String,
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$MotifScoreImplToJson(_$MotifScoreImpl instance) =>
    <String, dynamic>{'motif': instance.motif, 'score': instance.score};

_$MotifDistributionImpl _$$MotifDistributionImplFromJson(
  Map<String, dynamic> json,
) => _$MotifDistributionImpl(
  top:
      (json['top'] as List<dynamic>?)
          ?.map((e) => MotifScore.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shadow:
      (json['shadow'] as List<dynamic>?)
          ?.map((e) => MotifScore.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  distribution:
      (json['distribution'] as List<dynamic>?)
          ?.map((e) => MotifScore.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$MotifDistributionImplToJson(
  _$MotifDistributionImpl instance,
) => <String, dynamic>{
  'top': instance.top,
  'shadow': instance.shadow,
  'distribution': instance.distribution,
};

_$ConstellationImpl _$$ConstellationImplFromJson(Map<String, dynamic> json) =>
    _$ConstellationImpl(
      structural: json['structural'] == null
          ? null
          : StructuralArchetypes.fromJson(
              json['structural'] as Map<String, dynamic>,
            ),
      motifs: json['motifs'] == null
          ? null
          : MotifDistribution.fromJson(json['motifs'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ConstellationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConstellationImplToJson(_$ConstellationImpl instance) =>
    <String, dynamic>{
      'structural': instance.structural,
      'motifs': instance.motifs,
      'meta': instance.meta,
    };

_$ConstellationMetaImpl _$$ConstellationMetaImplFromJson(
  Map<String, dynamic> json,
) => _$ConstellationMetaImpl(
  taxonomyVersion: json['taxonomyVersion'] as String?,
  computedAt: json['computedAt'] as String?,
);

Map<String, dynamic> _$$ConstellationMetaImplToJson(
  _$ConstellationMetaImpl instance,
) => <String, dynamic>{
  'taxonomyVersion': instance.taxonomyVersion,
  'computedAt': instance.computedAt,
};

_$SharedMotifImpl _$$SharedMotifImplFromJson(Map<String, dynamic> json) =>
    _$SharedMotifImpl(
      motif: json['motif'] as String,
      meScore: (json['meScore'] as num?)?.toDouble() ?? 0.0,
      partnerScore: (json['partnerScore'] as num?)?.toDouble() ?? 0.0,
      label: json['label'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SharedMotifImplToJson(_$SharedMotifImpl instance) =>
    <String, dynamic>{
      'motif': instance.motif,
      'meScore': instance.meScore,
      'partnerScore': instance.partnerScore,
      'label': instance.label,
      'description': instance.description,
    };

_$ComplementaryMotifImpl _$$ComplementaryMotifImplFromJson(
  Map<String, dynamic> json,
) => _$ComplementaryMotifImpl(
  motif: json['motif'] as String,
  highSide: json['highSide'] as String? ?? 'me',
  delta: (json['delta'] as num?)?.toDouble() ?? 0.0,
  meScore: (json['meScore'] as num?)?.toDouble() ?? 0.0,
  partnerScore: (json['partnerScore'] as num?)?.toDouble() ?? 0.0,
  label: json['label'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$ComplementaryMotifImplToJson(
  _$ComplementaryMotifImpl instance,
) => <String, dynamic>{
  'motif': instance.motif,
  'highSide': instance.highSide,
  'delta': instance.delta,
  'meScore': instance.meScore,
  'partnerScore': instance.partnerScore,
  'label': instance.label,
  'description': instance.description,
};

_$TensionPairImpl _$$TensionPairImplFromJson(Map<String, dynamic> json) =>
    _$TensionPairImpl(
      pair:
          (json['pair'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      direction: json['direction'] as String? ?? 'me_vs_partner',
      theme: json['theme'] as String?,
      themeLabel: json['themeLabel'] as String?,
      strength: (json['strength'] as num?)?.toDouble() ?? 0.0,
      labels:
          (json['labels'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      boostedByField: json['boostedByField'] as bool? ?? false,
    );

Map<String, dynamic> _$$TensionPairImplToJson(_$TensionPairImpl instance) =>
    <String, dynamic>{
      'pair': instance.pair,
      'direction': instance.direction,
      'theme': instance.theme,
      'themeLabel': instance.themeLabel,
      'strength': instance.strength,
      'labels': instance.labels,
      'boostedByField': instance.boostedByField,
    };

_$RelationalFieldImpl _$$RelationalFieldImplFromJson(
  Map<String, dynamic> json,
) => _$RelationalFieldImpl(
  label: json['label'] as String,
  primaryThemes:
      (json['primaryThemes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  riskLoops:
      (json['riskLoops'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$RelationalFieldImplToJson(
  _$RelationalFieldImpl instance,
) => <String, dynamic>{
  'label': instance.label,
  'primaryThemes': instance.primaryThemes,
  'riskLoops': instance.riskLoops,
};

_$RelationshipConstellationImpl _$$RelationshipConstellationImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipConstellationImpl(
  shared:
      (json['shared'] as List<dynamic>?)
          ?.map((e) => SharedMotif.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  complementary:
      (json['complementary'] as List<dynamic>?)
          ?.map((e) => ComplementaryMotif.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tensions:
      (json['tensions'] as List<dynamic>?)
          ?.map((e) => TensionPair.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  field: json['field'] == null
      ? null
      : RelationalField.fromJson(json['field'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ConstellationMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$RelationshipConstellationImplToJson(
  _$RelationshipConstellationImpl instance,
) => <String, dynamic>{
  'shared': instance.shared,
  'complementary': instance.complementary,
  'tensions': instance.tensions,
  'field': instance.field,
  'meta': instance.meta,
};

_$MeConstellationResponseImpl _$$MeConstellationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MeConstellationResponseImpl(
  meConstellation: Constellation.fromJson(
    json['meConstellation'] as Map<String, dynamic>,
  ),
  taxonomyVersion: json['taxonomyVersion'] as String?,
  computedAt: json['computedAt'] as String?,
);

Map<String, dynamic> _$$MeConstellationResponseImplToJson(
  _$MeConstellationResponseImpl instance,
) => <String, dynamic>{
  'meConstellation': instance.meConstellation,
  'taxonomyVersion': instance.taxonomyVersion,
  'computedAt': instance.computedAt,
};

_$RelationshipConstellationResponseImpl
_$$RelationshipConstellationResponseImplFromJson(Map<String, dynamic> json) =>
    _$RelationshipConstellationResponseImpl(
      meConstellation: json['meConstellation'] == null
          ? null
          : Constellation.fromJson(
              json['meConstellation'] as Map<String, dynamic>,
            ),
      partnerConstellation: json['partnerConstellation'] == null
          ? null
          : Constellation.fromJson(
              json['partnerConstellation'] as Map<String, dynamic>,
            ),
      relationshipConstellation: json['relationshipConstellation'] == null
          ? null
          : RelationshipConstellation.fromJson(
              json['relationshipConstellation'] as Map<String, dynamic>,
            ),
      taxonomyVersion: json['taxonomyVersion'] as String?,
      computedAt: json['computedAt'] as String?,
    );

Map<String, dynamic> _$$RelationshipConstellationResponseImplToJson(
  _$RelationshipConstellationResponseImpl instance,
) => <String, dynamic>{
  'meConstellation': instance.meConstellation,
  'partnerConstellation': instance.partnerConstellation,
  'relationshipConstellation': instance.relationshipConstellation,
  'taxonomyVersion': instance.taxonomyVersion,
  'computedAt': instance.computedAt,
};
