import 'package:freezed_annotation/freezed_annotation.dart';
import 'character.dart';

part 'relationship.freezed.dart';
part 'relationship.g.dart';

/// Relationship character set - stores the "Other" person's characters
@freezed
class RelationshipCharacterSet with _$RelationshipCharacterSet {
  const factory RelationshipCharacterSet({
    required String userId,
    @Default(false) bool enabled,
    @Default('platonic') String relationshipType, // 'romantic' or 'platonic'
    @Default('friend') String otherLabel, // 'partner', 'friend', 'other'
    @Default([]) List<Character> characters,
    @Default([]) List<String> rawInputs,
    DateTime? updatedAt,
  }) = _RelationshipCharacterSet;

  factory RelationshipCharacterSet.fromJson(Map<String, dynamic> json) =>
      _$RelationshipCharacterSetFromJson(json);
}

/// Relationship Model - the deterministic computation result
@freezed
class RelationshipModel with _$RelationshipModel {
  const factory RelationshipModel({
    required String type, // 'romantic' or 'platonic'
    RelationshipField? field,
    BondingAxis? bondingAxis,
    ProjectionShadow? projectionShadow,
    EgoPersonaMismatch? egoPersonaMismatch,
    CommunicationConflict? communicationConflict,
    NeedsBoundaries? needsBoundaries,
    GrowthPath? growthPath,
    RedFlagsRepair? redFlagsRepair,
    @Default([]) List<NextStepSituation> nextStepsSituations,
  }) = _RelationshipModel;

  factory RelationshipModel.fromJson(Map<String, dynamic> json) =>
      _$RelationshipModelFromJson(json);
}

/// The relational field between two people
@freezed
class RelationshipField with _$RelationshipField {
  const factory RelationshipField({
    String? summary,
    String? story,
    @Default([]) List<String> analysisBullets,
    @Default([]) List<String> exampleRefs,
  }) = _RelationshipField;

  factory RelationshipField.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFieldFromJson(json);
}

/// Attraction and bonding dynamics
@freezed
class BondingAxis with _$BondingAxis {
  const factory BondingAxis({
    String? summary,
    String? story,
    @Default([]) List<String> analysisBullets,
    @Default([]) List<String> exampleRefs,
  }) = _BondingAxis;

  factory BondingAxis.fromJson(Map<String, dynamic> json) =>
      _$BondingAxisFromJson(json);
}

/// Projection and shadow triggers
@freezed
class ProjectionShadow with _$ProjectionShadow {
  const factory ProjectionShadow({
    String? summary,
    String? story,
    @Default([]) List<String> analysisBullets,
    @Default([]) List<String> exampleRefs,
  }) = _ProjectionShadow;

  factory ProjectionShadow.fromJson(Map<String, dynamic> json) =>
      _$ProjectionShadowFromJson(json);
}

/// Ego-persona mismatch analysis
@freezed
class EgoPersonaMismatch with _$EgoPersonaMismatch {
  const factory EgoPersonaMismatch({
    String? summary,
    String? story,
    @Default([]) List<String> analysisBullets,
    @Default([]) List<String> exampleRefs,
  }) = _EgoPersonaMismatch;

  factory EgoPersonaMismatch.fromJson(Map<String, dynamic> json) =>
      _$EgoPersonaMismatchFromJson(json);
}

/// Communication and conflict style
@freezed
class CommunicationConflict with _$CommunicationConflict {
  const factory CommunicationConflict({
    String? summary,
    String? story,
    @Default([]) List<String> analysisBullets,
    @Default([]) List<String> exampleRefs,
  }) = _CommunicationConflict;

  factory CommunicationConflict.fromJson(Map<String, dynamic> json) =>
      _$CommunicationConflictFromJson(json);
}

/// Needs, boundaries, and deal-breakers
@freezed
class NeedsBoundaries with _$NeedsBoundaries {
  const factory NeedsBoundaries({
    String? summary,
    String? story,
    @Default([]) List<String> analysisBullets,
    @Default([]) List<String> exampleRefs,
  }) = _NeedsBoundaries;

  factory NeedsBoundaries.fromJson(Map<String, dynamic> json) =>
      _$NeedsBoundariesFromJson(json);
}

/// Growth path together
@freezed
class GrowthPath with _$GrowthPath {
  const factory GrowthPath({
    String? summary,
    String? story,
    @Default([]) List<String> analysisBullets,
    @Default([]) List<String> exampleRefs,
  }) = _GrowthPath;

  factory GrowthPath.fromJson(Map<String, dynamic> json) =>
      _$GrowthPathFromJson(json);
}

/// Red flags and repair signals
@freezed
class RedFlagsRepair with _$RedFlagsRepair {
  const factory RedFlagsRepair({
    String? summary,
    String? story,
    @Default([]) List<String> analysisBullets,
    @Default([]) List<String> exampleRefs,
  }) = _RedFlagsRepair;

  factory RedFlagsRepair.fromJson(Map<String, dynamic> json) =>
      _$RedFlagsRepairFromJson(json);
}

/// Situational guidance for next steps
@freezed
class NextStepSituation with _$NextStepSituation {
  const factory NextStepSituation({
    String? title,
    String? context,
    String? guidance,
    @Default([]) List<String> exampleRefs,
  }) = _NextStepSituation;

  factory NextStepSituation.fromJson(Map<String, dynamic> json) =>
      _$NextStepSituationFromJson(json);
}

/// Full relationship output from backend
@freezed
class RelationshipOutput with _$RelationshipOutput {
  const factory RelationshipOutput({
    RelationshipMyth? myth,
    RelationshipModel? relationshipModel,
    RelationshipNarrative? narrative,
    RelationshipExamples? examples,
    RelationshipMeta? meta,
  }) = _RelationshipOutput;

  factory RelationshipOutput.fromJson(Map<String, dynamic> json) =>
      _$RelationshipOutputFromJson(json);
}

/// The mythic story of the relationship
@freezed
class RelationshipMyth with _$RelationshipMyth {
  const factory RelationshipMyth({
    String? title,
    String? summary,
    String? story,
    @Default([]) List<String> themes,
  }) = _RelationshipMyth;

  factory RelationshipMyth.fromJson(Map<String, dynamic> json) =>
      _$RelationshipMythFromJson(json);
}

/// Narrative output for each module
@freezed
class RelationshipNarrative with _$RelationshipNarrative {
  const factory RelationshipNarrative({
    ModuleNarrative? relationalField,
    ModuleNarrative? attractionBonding,
    ModuleNarrative? projectionShadow,
    ModuleNarrative? egoPersonaMismatch,
    ModuleNarrative? communicationConflict,
    ModuleNarrative? needsBoundaries,
    ModuleNarrative? growthPath,
    ModuleNarrative? redFlagsRepair,
    @Default([]) List<SituationalGuidance> nextSteps,
  }) = _RelationshipNarrative;

  factory RelationshipNarrative.fromJson(Map<String, dynamic> json) =>
      _$RelationshipNarrativeFromJson(json);
}

/// Generic module narrative structure
@freezed
class ModuleNarrative with _$ModuleNarrative {
  const factory ModuleNarrative({
    String? summary,
    String? story,
    @Default([]) List<String> analysisBullets,
    @Default([]) List<SituationalExample> situations,
  }) = _ModuleNarrative;

  factory ModuleNarrative.fromJson(Map<String, dynamic> json) =>
      _$ModuleNarrativeFromJson(json);
}

/// Situational example within a module
@freezed
class SituationalExample with _$SituationalExample {
  const factory SituationalExample({
    String? title,
    String? description,
    @Default([]) List<String> exampleRefs,
  }) = _SituationalExample;

  factory SituationalExample.fromJson(Map<String, dynamic> json) =>
      _$SituationalExampleFromJson(json);
}

/// Situational guidance
@freezed
class SituationalGuidance with _$SituationalGuidance {
  const factory SituationalGuidance({
    String? situation,
    String? guidance,
    @Default([]) List<String> exampleRefs,
  }) = _SituationalGuidance;

  factory SituationalGuidance.fromJson(Map<String, dynamic> json) =>
      _$SituationalGuidanceFromJson(json);
}

/// Examples for relationship modules
@freezed
class RelationshipExamples with _$RelationshipExamples {
  const factory RelationshipExamples({
    @Default([]) List<RelationshipExampleRef> relationalField,
    @Default([]) List<RelationshipExampleRef> attractionBonding,
    @Default([]) List<RelationshipExampleRef> projectionShadow,
    @Default([]) List<RelationshipExampleRef> egoPersonaMismatch,
    @Default([]) List<RelationshipExampleRef> communicationConflict,
    @Default([]) List<RelationshipExampleRef> needsBoundaries,
    @Default([]) List<RelationshipExampleRef> growthPath,
    @Default([]) List<RelationshipExampleRef> redFlagsRepair,
    @Default([]) List<RelationshipExampleRef> nextSteps,
  }) = _RelationshipExamples;

  factory RelationshipExamples.fromJson(Map<String, dynamic> json) =>
      _$RelationshipExamplesFromJson(json);
}

/// Reference to an example in relationships
@freezed
class RelationshipExampleRef with _$RelationshipExampleRef {
  const factory RelationshipExampleRef({
    String? characterName,
    String? fromSide, // 'me' or 'other'
    RelationshipExampleReference? reference,
    String? situation,
    @Default([]) List<String> actions,
    @Default([]) List<String> outcomeAndCost,
    @Default('B') String tier,
  }) = _RelationshipExampleRef;

  factory RelationshipExampleRef.fromJson(Map<String, dynamic> json) =>
      _$RelationshipExampleRefFromJson(json);
}

/// Media reference for relationship examples
@freezed
class RelationshipExampleReference with _$RelationshipExampleReference {
  const factory RelationshipExampleReference({
    String? title,
    String? year,
    @Default('film') String medium,
  }) = _RelationshipExampleReference;

  factory RelationshipExampleReference.fromJson(Map<String, dynamic> json) =>
      _$RelationshipExampleReferenceFromJson(json);
}

/// Metadata for relationship output
@freezed
class RelationshipMeta with _$RelationshipMeta {
  const factory RelationshipMeta({
    String? generatedAt,
    String? modelVersion,
    String? inputHash,
    String? relationshipType,
    bool? hasMeData,
  }) = _RelationshipMeta;

  factory RelationshipMeta.fromJson(Map<String, dynamic> json) =>
      _$RelationshipMetaFromJson(json);
}
