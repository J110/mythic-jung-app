// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneratedOutputImpl _$$GeneratedOutputImplFromJson(
  Map<String, dynamic> json,
) => _$GeneratedOutputImpl(
  story: StoryOutput.fromJson(json['story'] as Map<String, dynamic>),
  identification: IdentificationOutput.fromJson(
    json['identification'] as Map<String, dynamic>,
  ),
  functioning: FunctioningOutput.fromJson(
    json['functioning'] as Map<String, dynamic>,
  ),
  actions: ActionsOutput.fromJson(json['actions'] as Map<String, dynamic>),
  lifeDomains: LifeDomainsOutput.fromJson(
    json['lifeDomains'] as Map<String, dynamic>,
  ),
  meta: MetaOutput.fromJson(json['meta'] as Map<String, dynamic>),
  examples: json['examples'] == null
      ? null
      : ExamplesOutput.fromJson(json['examples'] as Map<String, dynamic>),
  identificationV2: json['identification_v2'] == null
      ? null
      : IdentificationV2.fromJson(
          json['identification_v2'] as Map<String, dynamic>,
        ),
  deltaSummary: json['deltaSummary'] == null
      ? null
      : DeltaSummary.fromJson(json['deltaSummary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$GeneratedOutputImplToJson(
  _$GeneratedOutputImpl instance,
) => <String, dynamic>{
  'story': instance.story,
  'identification': instance.identification,
  'functioning': instance.functioning,
  'actions': instance.actions,
  'lifeDomains': instance.lifeDomains,
  'meta': instance.meta,
  'examples': instance.examples,
  'identification_v2': instance.identificationV2,
  'deltaSummary': instance.deltaSummary,
};

_$StoryOutputImpl _$$StoryOutputImplFromJson(Map<String, dynamic> json) =>
    _$StoryOutputImpl(
      mythSummary: json['mythSummary'] as String,
      centralTension: json['centralTension'] as String,
      guidingSentence: json['guidingSentence'] as String,
      northStarScene: json['northStarScene'] as String?,
      currentChapter: json['currentChapter'] as String?,
    );

Map<String, dynamic> _$$StoryOutputImplToJson(_$StoryOutputImpl instance) =>
    <String, dynamic>{
      'mythSummary': instance.mythSummary,
      'centralTension': instance.centralTension,
      'guidingSentence': instance.guidingSentence,
      'northStarScene': instance.northStarScene,
      'currentChapter': instance.currentChapter,
    };

_$IdentificationOutputImpl _$$IdentificationOutputImplFromJson(
  Map<String, dynamic> json,
) => _$IdentificationOutputImpl(
  ego: ArchetypeBlock.fromJson(json['ego'] as Map<String, dynamic>),
  persona: ArchetypeBlock.fromJson(json['persona'] as Map<String, dynamic>),
  shadow: ArchetypeBlock.fromJson(json['shadow'] as Map<String, dynamic>),
  shadowVirtue: json['shadowVirtue'] == null
      ? null
      : ArchetypeBlock.fromJson(json['shadowVirtue'] as Map<String, dynamic>),
  feelingFunction: ArchetypeBlock.fromJson(
    json['feelingFunction'] as Map<String, dynamic>,
  ),
  erosAxis: json['erosAxis'] == null
      ? null
      : ArchetypeBlock.fromJson(json['erosAxis'] as Map<String, dynamic>),
  moralOrientation: json['moralOrientation'] == null
      ? null
      : ArchetypeBlock.fromJson(
          json['moralOrientation'] as Map<String, dynamic>,
        ),
  evidence:
      (json['evidence'] as List<dynamic>?)
          ?.map((e) => EvidenceItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$IdentificationOutputImplToJson(
  _$IdentificationOutputImpl instance,
) => <String, dynamic>{
  'ego': instance.ego,
  'persona': instance.persona,
  'shadow': instance.shadow,
  'shadowVirtue': instance.shadowVirtue,
  'feelingFunction': instance.feelingFunction,
  'erosAxis': instance.erosAxis,
  'moralOrientation': instance.moralOrientation,
  'evidence': instance.evidence,
};

_$FunctioningOutputImpl _$$FunctioningOutputImplFromJson(
  Map<String, dynamic> json,
) => _$FunctioningOutputImpl(
  coreTraits: (json['coreTraits'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  symbolicEssence: json['symbolicEssence'] as String,
  narrativeArc: json['narrativeArc'] as String,
  redemptionArc: json['redemptionArc'] as String,
  costsAndCompensations: const CostsConverter().fromJson(
    json['costsAndCompensations'],
  ),
  powerStance: json['powerStance'] as String?,
  alignmentIndicators: json['alignmentIndicators'] == null
      ? null
      : AlignmentIndicators.fromJson(
          json['alignmentIndicators'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$FunctioningOutputImplToJson(
  _$FunctioningOutputImpl instance,
) => <String, dynamic>{
  'coreTraits': instance.coreTraits,
  'symbolicEssence': instance.symbolicEssence,
  'narrativeArc': instance.narrativeArc,
  'redemptionArc': instance.redemptionArc,
  'costsAndCompensations': const CostsConverter().toJson(
    instance.costsAndCompensations,
  ),
  'powerStance': instance.powerStance,
  'alignmentIndicators': instance.alignmentIndicators,
};

_$ActionsOutputImpl _$$ActionsOutputImplFromJson(Map<String, dynamic> json) =>
    _$ActionsOutputImpl(
      situationBlocks: (json['situationBlocks'] as List<dynamic>)
          .map((e) => SituationBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      guidingQuestion: json['guidingQuestion'] as String,
    );

Map<String, dynamic> _$$ActionsOutputImplToJson(_$ActionsOutputImpl instance) =>
    <String, dynamic>{
      'situationBlocks': instance.situationBlocks,
      'guidingQuestion': instance.guidingQuestion,
    };

_$LifeDomainsOutputImpl _$$LifeDomainsOutputImplFromJson(
  Map<String, dynamic> json,
) => _$LifeDomainsOutputImpl(
  work: DomainBlock.fromJson(json['work'] as Map<String, dynamic>),
  leadership: DomainBlock.fromJson(json['leadership'] as Map<String, dynamic>),
  truth: DomainBlock.fromJson(json['truth'] as Map<String, dynamic>),
  intimacy: DomainBlock.fromJson(json['intimacy'] as Map<String, dynamic>),
  social: DomainBlock.fromJson(json['social'] as Map<String, dynamic>),
  innerLife: DomainBlock.fromJson(json['innerLife'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$LifeDomainsOutputImplToJson(
  _$LifeDomainsOutputImpl instance,
) => <String, dynamic>{
  'work': instance.work,
  'leadership': instance.leadership,
  'truth': instance.truth,
  'intimacy': instance.intimacy,
  'social': instance.social,
  'innerLife': instance.innerLife,
};

_$ArchetypeBlockImpl _$$ArchetypeBlockImplFromJson(Map<String, dynamic> json) =>
    _$ArchetypeBlockImpl(
      title: json['title'] as String,
      summary: json['summary'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$ArchetypeBlockImplToJson(
  _$ArchetypeBlockImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'summary': instance.summary,
  'characters': instance.characters,
  'details': instance.details,
};

_$EvidenceItemImpl _$$EvidenceItemImplFromJson(Map<String, dynamic> json) =>
    _$EvidenceItemImpl(
      targetPath: json['targetPath'] as String,
      characterRefs: (json['characterRefs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      assessmentRefs: (json['assessmentRefs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$EvidenceItemImplToJson(_$EvidenceItemImpl instance) =>
    <String, dynamic>{
      'targetPath': instance.targetPath,
      'characterRefs': instance.characterRefs,
      'assessmentRefs': instance.assessmentRefs,
    };

_$SituationBlockImpl _$$SituationBlockImplFromJson(Map<String, dynamic> json) =>
    _$SituationBlockImpl(
      title: json['title'] as String?,
      situation: json['situation'] as String,
      alignedResponse: (json['alignedResponse'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      beWaryOf: (json['beWaryOf'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SituationBlockImplToJson(
  _$SituationBlockImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'situation': instance.situation,
  'alignedResponse': instance.alignedResponse,
  'beWaryOf': instance.beWaryOf,
};

_$DomainBlockImpl _$$DomainBlockImplFromJson(Map<String, dynamic> json) =>
    _$DomainBlockImpl(
      title: json['title'] as String,
      iAm: const StringOrListConverter().fromJson(json['iAm']),
      iTendTo: const StringOrListConverter().fromJson(json['iTendTo']),
      typicalSituations: const StringOrListConverter().fromJson(
        json['typicalSituations'],
      ),
      watchOuts: const StringOrListConverter().fromJson(json['watchOuts']),
      toRealizePotential: const StringOrListConverter().fromJson(
        json['toRealizePotential'],
      ),
      selfDirection: json['selfDirection'] as String,
    );

Map<String, dynamic> _$$DomainBlockImplToJson(_$DomainBlockImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'iAm': const StringOrListConverter().toJson(instance.iAm),
      'iTendTo': const StringOrListConverter().toJson(instance.iTendTo),
      'typicalSituations': const StringOrListConverter().toJson(
        instance.typicalSituations,
      ),
      'watchOuts': const StringOrListConverter().toJson(instance.watchOuts),
      'toRealizePotential': const StringOrListConverter().toJson(
        instance.toRealizePotential,
      ),
      'selfDirection': instance.selfDirection,
    };

_$AlignmentIndicatorsImpl _$$AlignmentIndicatorsImplFromJson(
  Map<String, dynamic> json,
) => _$AlignmentIndicatorsImpl(
  aligned: (json['aligned'] as List<dynamic>).map((e) => e as String).toList(),
  unaligned: (json['unaligned'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$AlignmentIndicatorsImplToJson(
  _$AlignmentIndicatorsImpl instance,
) => <String, dynamic>{
  'aligned': instance.aligned,
  'unaligned': instance.unaligned,
};

_$MetaOutputImpl _$$MetaOutputImplFromJson(Map<String, dynamic> json) =>
    _$MetaOutputImpl(
      generatedAt: json['generatedAt'] as String,
      modelVersion: json['modelVersion'] as String,
      promptVersion: json['promptVersion'] as String,
      schemaVersion: (json['schemaVersion'] as num).toInt(),
      identificationVersion: json['identificationVersion'] as String?,
      regenerationType: json['regenerationType'] as String?,
      changedMappings: json['changedMappings'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MetaOutputImplToJson(_$MetaOutputImpl instance) =>
    <String, dynamic>{
      'generatedAt': instance.generatedAt,
      'modelVersion': instance.modelVersion,
      'promptVersion': instance.promptVersion,
      'schemaVersion': instance.schemaVersion,
      'identificationVersion': instance.identificationVersion,
      'regenerationType': instance.regenerationType,
      'changedMappings': instance.changedMappings,
    };

_$DeltaSummaryImpl _$$DeltaSummaryImplFromJson(Map<String, dynamic> json) =>
    _$DeltaSummaryImpl(
      changes:
          (json['changes'] as List<dynamic>?)
              ?.map((e) => DeltaChange.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      changedMappings: json['changedMappings'] as Map<String, dynamic>?,
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$$DeltaSummaryImplToJson(_$DeltaSummaryImpl instance) =>
    <String, dynamic>{
      'changes': instance.changes,
      'changedMappings': instance.changedMappings,
      'timestamp': instance.timestamp,
    };

_$DeltaChangeImpl _$$DeltaChangeImplFromJson(Map<String, dynamic> json) =>
    _$DeltaChangeImpl(
      what: json['what'] as String,
      from: json['from'] as String?,
      to: json['to'] as String?,
      triggeredBy:
          (json['triggeredBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DeltaChangeImplToJson(_$DeltaChangeImpl instance) =>
    <String, dynamic>{
      'what': instance.what,
      'from': instance.from,
      'to': instance.to,
      'triggeredBy': instance.triggeredBy,
    };

_$IdentificationV2Impl _$$IdentificationV2ImplFromJson(
  Map<String, dynamic> json,
) => _$IdentificationV2Impl(
  version: json['version'] as String? ?? '2.0',
  ego: json['ego'] == null
      ? null
      : ArchetypeDynamics.fromJson(json['ego'] as Map<String, dynamic>),
  persona: json['persona'] == null
      ? null
      : ArchetypeDynamics.fromJson(json['persona'] as Map<String, dynamic>),
  shadow: json['shadow'] == null
      ? null
      : ArchetypeDynamics.fromJson(json['shadow'] as Map<String, dynamic>),
  shadowVirtue: json['shadowVirtue'] == null
      ? null
      : ArchetypeDynamics.fromJson(
          json['shadowVirtue'] as Map<String, dynamic>,
        ),
  feelingFunction: json['feelingFunction'] == null
      ? null
      : ArchetypeDynamics.fromJson(
          json['feelingFunction'] as Map<String, dynamic>,
        ),
  erosAxis: json['erosAxis'] == null
      ? null
      : ArchetypeDynamics.fromJson(json['erosAxis'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$IdentificationV2ImplToJson(
  _$IdentificationV2Impl instance,
) => <String, dynamic>{
  'version': instance.version,
  'ego': instance.ego,
  'persona': instance.persona,
  'shadow': instance.shadow,
  'shadowVirtue': instance.shadowVirtue,
  'feelingFunction': instance.feelingFunction,
  'erosAxis': instance.erosAxis,
};

_$ArchetypeDynamicsImpl _$$ArchetypeDynamicsImplFromJson(
  Map<String, dynamic> json,
) => _$ArchetypeDynamicsImpl(
  center: CenterPosition.fromJson(json['center'] as Map<String, dynamic>),
  orbit:
      (json['orbit'] as List<dynamic>?)
          ?.map((e) => OrbitEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  compensations:
      (json['compensations'] as List<dynamic>?)
          ?.map((e) => CompensationEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ArchetypeDynamicsImplToJson(
  _$ArchetypeDynamicsImpl instance,
) => <String, dynamic>{
  'center': instance.center,
  'orbit': instance.orbit,
  'compensations': instance.compensations,
};

_$CenterPositionImpl _$$CenterPositionImplFromJson(Map<String, dynamic> json) =>
    _$CenterPositionImpl(
      label: json['label'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      summary: json['summary'] as String,
      details: json['details'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
      rationale: json['rationale'] == null
          ? null
          : DynamicsRationale.fromJson(
              json['rationale'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$CenterPositionImplToJson(
  _$CenterPositionImpl instance,
) => <String, dynamic>{
  'label': instance.label,
  'characters': instance.characters,
  'summary': instance.summary,
  'details': instance.details,
  'confidence': instance.confidence,
  'rationale': instance.rationale,
};

_$OrbitEntryImpl _$$OrbitEntryImplFromJson(Map<String, dynamic> json) =>
    _$OrbitEntryImpl(
      trigger: OrbitTrigger.fromJson(json['trigger'] as Map<String, dynamic>),
      characters:
          (json['characters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      pattern: json['pattern'] as String?,
      costRisk: json['costRisk'] as String?,
      stabilizer: json['stabilizer'] as String?,
      rationale: json['rationale'] == null
          ? null
          : DynamicsRationale.fromJson(
              json['rationale'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$OrbitEntryImplToJson(_$OrbitEntryImpl instance) =>
    <String, dynamic>{
      'trigger': instance.trigger,
      'characters': instance.characters,
      'pattern': instance.pattern,
      'costRisk': instance.costRisk,
      'stabilizer': instance.stabilizer,
      'rationale': instance.rationale,
    };

_$OrbitTriggerImpl _$$OrbitTriggerImplFromJson(Map<String, dynamic> json) =>
    _$OrbitTriggerImpl(
      name: json['name'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$OrbitTriggerImplToJson(_$OrbitTriggerImpl instance) =>
    <String, dynamic>{'name': instance.name, 'tags': instance.tags};

_$CompensationEntryImpl _$$CompensationEntryImplFromJson(
  Map<String, dynamic> json,
) => _$CompensationEntryImpl(
  name: json['name'] as String,
  when: json['when'] as String?,
  expression: json['expression'] == null
      ? const []
      : const StringOrListConverter().fromJson(json['expression']),
  risk: json['risk'] as String?,
  returnPath: json['returnPath'] as String?,
  characters:
      (json['characters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  rationale: json['rationale'] == null
      ? null
      : DynamicsRationale.fromJson(json['rationale'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CompensationEntryImplToJson(
  _$CompensationEntryImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'when': instance.when,
  'expression': const StringOrListConverter().toJson(instance.expression),
  'risk': instance.risk,
  'returnPath': instance.returnPath,
  'characters': instance.characters,
  'rationale': instance.rationale,
};

_$DynamicsRationaleImpl _$$DynamicsRationaleImplFromJson(
  Map<String, dynamic> json,
) => _$DynamicsRationaleImpl(
  traitSignals:
      (json['traitSignals'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  assessmentRefs:
      (json['assessmentRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  exampleRefs:
      (json['exampleRefs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$DynamicsRationaleImplToJson(
  _$DynamicsRationaleImpl instance,
) => <String, dynamic>{
  'traitSignals': instance.traitSignals,
  'assessmentRefs': instance.assessmentRefs,
  'exampleRefs': instance.exampleRefs,
};

_$ExamplesOutputImpl _$$ExamplesOutputImplFromJson(Map<String, dynamic> json) =>
    _$ExamplesOutputImpl(
      story: json['story'] == null
          ? const StoryExamples()
          : const StoryExamplesConverter().fromJson(json['story']),
      identification: json['identification'] == null
          ? null
          : IdentificationExamples.fromJson(
              json['identification'] as Map<String, dynamic>,
            ),
      functioning: json['functioning'] == null
          ? const FunctioningExamples()
          : const FunctioningExamplesConverter().fromJson(json['functioning']),
      actions:
          (json['actions'] as List<dynamic>?)
              ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lifeDomains: json['lifeDomains'] == null
          ? null
          : LifeDomainsExamples.fromJson(
              json['lifeDomains'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$ExamplesOutputImplToJson(
  _$ExamplesOutputImpl instance,
) => <String, dynamic>{
  'story': const StoryExamplesConverter().toJson(instance.story),
  'identification': instance.identification,
  'functioning': const FunctioningExamplesConverter().toJson(
    instance.functioning,
  ),
  'actions': instance.actions,
  'lifeDomains': instance.lifeDomains,
};

_$StoryExamplesImpl _$$StoryExamplesImplFromJson(Map<String, dynamic> json) =>
    _$StoryExamplesImpl(
      mythSummary:
          (json['mythSummary'] as List<dynamic>?)
              ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      centralTension:
          (json['centralTension'] as List<dynamic>?)
              ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      guidingSentence:
          (json['guidingSentence'] as List<dynamic>?)
              ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      northStarScene:
          (json['northStarScene'] as List<dynamic>?)
              ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StoryExamplesImplToJson(_$StoryExamplesImpl instance) =>
    <String, dynamic>{
      'mythSummary': instance.mythSummary,
      'centralTension': instance.centralTension,
      'guidingSentence': instance.guidingSentence,
      'northStarScene': instance.northStarScene,
    };

_$FunctioningExamplesImpl _$$FunctioningExamplesImplFromJson(
  Map<String, dynamic> json,
) => _$FunctioningExamplesImpl(
  coreTraits:
      (json['coreTraits'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  symbolicEssence:
      (json['symbolicEssence'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  narrativeArc:
      (json['narrativeArc'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  redemptionArc:
      (json['redemptionArc'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  costsAndCompensations:
      (json['costsAndCompensations'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  alignmentIndicators:
      (json['alignmentIndicators'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$FunctioningExamplesImplToJson(
  _$FunctioningExamplesImpl instance,
) => <String, dynamic>{
  'coreTraits': instance.coreTraits,
  'symbolicEssence': instance.symbolicEssence,
  'narrativeArc': instance.narrativeArc,
  'redemptionArc': instance.redemptionArc,
  'costsAndCompensations': instance.costsAndCompensations,
  'alignmentIndicators': instance.alignmentIndicators,
};

_$IdentificationExamplesImpl _$$IdentificationExamplesImplFromJson(
  Map<String, dynamic> json,
) => _$IdentificationExamplesImpl(
  ego:
      (json['ego'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  persona:
      (json['persona'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shadow:
      (json['shadow'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shadowVirtue:
      (json['shadowVirtue'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  feelingFunction:
      (json['feelingFunction'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  erosAxis:
      (json['erosAxis'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$IdentificationExamplesImplToJson(
  _$IdentificationExamplesImpl instance,
) => <String, dynamic>{
  'ego': instance.ego,
  'persona': instance.persona,
  'shadow': instance.shadow,
  'shadowVirtue': instance.shadowVirtue,
  'feelingFunction': instance.feelingFunction,
  'erosAxis': instance.erosAxis,
};

_$LifeDomainsExamplesImpl _$$LifeDomainsExamplesImplFromJson(
  Map<String, dynamic> json,
) => _$LifeDomainsExamplesImpl(
  work:
      (json['work'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  leadership:
      (json['leadership'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  truth:
      (json['truth'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  intimacy:
      (json['intimacy'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  social:
      (json['social'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  innerLife:
      (json['innerLife'] as List<dynamic>?)
          ?.map((e) => ExampleItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$LifeDomainsExamplesImplToJson(
  _$LifeDomainsExamplesImpl instance,
) => <String, dynamic>{
  'work': instance.work,
  'leadership': instance.leadership,
  'truth': instance.truth,
  'intimacy': instance.intimacy,
  'social': instance.social,
  'innerLife': instance.innerLife,
};

_$ExampleItemImpl _$$ExampleItemImplFromJson(Map<String, dynamic> json) =>
    _$ExampleItemImpl(
      characterName: json['characterName'] as String,
      reference: ExampleReference.fromJson(
        json['reference'] as Map<String, dynamic>,
      ),
      situation: json['situation'] as String,
      actions: (json['actions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      outcomeAndCost: (json['outcomeAndCost'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tier: json['tier'] as String? ?? 'A',
      autoGenerated: json['autoGenerated'] as bool? ?? false,
    );

Map<String, dynamic> _$$ExampleItemImplToJson(_$ExampleItemImpl instance) =>
    <String, dynamic>{
      'characterName': instance.characterName,
      'reference': instance.reference,
      'situation': instance.situation,
      'actions': instance.actions,
      'outcomeAndCost': instance.outcomeAndCost,
      'tier': instance.tier,
      'autoGenerated': instance.autoGenerated,
    };

_$ExampleReferenceImpl _$$ExampleReferenceImplFromJson(
  Map<String, dynamic> json,
) => _$ExampleReferenceImpl(
  title: json['title'] as String,
  year: const YearToStringConverter().fromJson(json['year']),
  medium: json['medium'] as String,
);

Map<String, dynamic> _$$ExampleReferenceImplToJson(
  _$ExampleReferenceImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'year': const YearToStringConverter().toJson(instance.year),
  'medium': instance.medium,
};
