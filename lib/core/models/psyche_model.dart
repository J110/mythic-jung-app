import 'package:freezed_annotation/freezed_annotation.dart';

part 'psyche_model.freezed.dart';
part 'psyche_model.g.dart';

/// Structural role types (Jungian)
enum StructuralRole {
  @JsonValue('EGO')
  ego,
  @JsonValue('PERSONA')
  persona,
  @JsonValue('SHADOW')
  shadow,
  @JsonValue('FEELING_FUNCTION')
  feelingFunction,
  @JsonValue('EROS_AXIS')
  erosAxis,
  @JsonValue('SELF_DIRECTION')
  selfDirection,
}

/// Profile stability types
enum ProfileType {
  @JsonValue('DOMINANT')
  dominant,
  @JsonValue('DISTRIBUTED')
  distributed,
  @JsonValue('MIXED')
  mixed,
}

/// A structural position assignment (character -> role)
@freezed
class StructuralPosition with _$StructuralPosition {
  const factory StructuralPosition({
    String? primary,
    @Default([]) List<String> secondary,
    @Default(0.5) double confidence,
    @Default([]) List<String> evidenceFlags,
    /// Iconic shape for shadow illustration (e.g., "fist", "gun", "cane")
    /// Comes from character recognition AI
    String? iconicShape,
  }) = _StructuralPosition;

  factory StructuralPosition.fromJson(Map<String, dynamic> json) =>
      _$StructuralPositionFromJson(json);
}

/// Self-direction position (vector-based)
@freezed
class SelfDirectionPosition with _$SelfDirectionPosition {
  const factory SelfDirectionPosition({
    @Default(['integration', 'growth']) List<String> vector,
    @Default(0.5) double confidence,
    @Default([]) List<String> evidenceFlags,
  }) = _SelfDirectionPosition;

  factory SelfDirectionPosition.fromJson(Map<String, dynamic> json) =>
      _$SelfDirectionPositionFromJson(json);
}

/// Motif distribution entry
@freezed
class MotifEntry with _$MotifEntry {
  const factory MotifEntry({
    required String motif,
    required double score,
  }) = _MotifEntry;

  factory MotifEntry.fromJson(Map<String, dynamic> json) =>
      _$MotifEntryFromJson(json);
}

/// UI label mapping (how UI labels map to structural roles)
@freezed
class UiLabelMapping with _$UiLabelMapping {
  const factory UiLabelMapping({
    @Default('EGO') String coreSelfRole,
    @Default('PERSONA') String socialSelfRole,
    @Default('SHADOW') String hiddenSelfRole,
    @Default('FEELING_FUNCTION') String innerOppositeRole,
    @Default('SELF_DIRECTION') String directionRole,
    @Default('EROS_AXIS') String vitalityRole,
  }) = _UiLabelMapping;

  factory UiLabelMapping.fromJson(Map<String, dynamic> json) =>
      _$UiLabelMappingFromJson(json);
}

/// Stability analysis
@freezed
class StabilityAnalysis with _$StabilityAnalysis {
  const factory StabilityAnalysis({
    @Default(ProfileType.distributed) ProfileType profileType,
    String? dominantCharacterId,
    @Default([]) List<ShiftSummary> shiftSummary,
  }) = _StabilityAnalysis;

  factory StabilityAnalysis.fromJson(Map<String, dynamic> json) =>
      _$StabilityAnalysisFromJson(json);
}

/// Shift summary (when roles change between runs)
@freezed
class ShiftSummary with _$ShiftSummary {
  const factory ShiftSummary({
    required String role,
    required String from,
    required String to,
    @Default([]) List<String> reasonFlags,
  }) = _ShiftSummary;

  factory ShiftSummary.fromJson(Map<String, dynamic> json) =>
      _$ShiftSummaryFromJson(json);
}

/// Input hashes for cache invalidation
@freezed
class InputHashes with _$InputHashes {
  const factory InputHashes({
    String? lockedPacketsHash,
    String? resonanceHash,
    String? assessmentHash,
    String? toneHash,
    // REL-specific
    String? meLockedPacketsHash,
    String? partnerLockedPacketsHash,
    String? partnerResonanceHash,
    String? relationshipSettingsHash,
  }) = _InputHashes;

  factory InputHashes.fromJson(Map<String, dynamic> json) =>
      _$InputHashesFromJson(json);
}

/// Engine versions for cache invalidation
@freezed
class EngineVersions with _$EngineVersions {
  const factory EngineVersions({
    String? recognition,
    String? discovery,
    String? resonance,
    String? synthesis,
    String? constellation,
    String? examples,
    String? narrative,
  }) = _EngineVersions;

  factory EngineVersions.fromJson(Map<String, dynamic> json) =>
      _$EngineVersionsFromJson(json);
}

/// Structural positions map (all roles)
@freezed
class StructuralPositions with _$StructuralPositions {
  const factory StructuralPositions({
    @JsonKey(name: 'EGO') StructuralPosition? ego,
    @JsonKey(name: 'PERSONA') StructuralPosition? persona,
    @JsonKey(name: 'SHADOW') StructuralPosition? shadow,
    @JsonKey(name: 'FEELING_FUNCTION') StructuralPosition? feelingFunction,
    @JsonKey(name: 'EROS_AXIS') StructuralPosition? erosAxis,
    @JsonKey(name: 'SELF_DIRECTION') SelfDirectionPosition? selfDirection,
  }) = _StructuralPositions;

  factory StructuralPositions.fromJson(Map<String, dynamic> json) =>
      _$StructuralPositionsFromJson(json);
}

/// Relationship constellation (shared, complementary, tensions)
@freezed
class RelationshipConstellationData with _$RelationshipConstellationData {
  const factory RelationshipConstellationData({
    @Default([]) List<SharedMotifEntry> shared,
    @Default([]) List<ComplementaryMotifEntry> complementary,
    @Default([]) List<TensionEntry> tensions,
    FieldSummary? field,
  }) = _RelationshipConstellationData;

  factory RelationshipConstellationData.fromJson(Map<String, dynamic> json) =>
      _$RelationshipConstellationDataFromJson(json);
}

/// Shared motif entry (both have high score)
@freezed
class SharedMotifEntry with _$SharedMotifEntry {
  const factory SharedMotifEntry({
    required String motif,
    required double meScore,
    required double partnerScore,
    String? label,
    String? description,
  }) = _SharedMotifEntry;

  factory SharedMotifEntry.fromJson(Map<String, dynamic> json) =>
      _$SharedMotifEntryFromJson(json);
}

/// Complementary motif entry (one high, other low)
@freezed
class ComplementaryMotifEntry with _$ComplementaryMotifEntry {
  const factory ComplementaryMotifEntry({
    required String motif,
    required String highSide, // 'me' or 'partner'
    required double delta,
    double? meScore,
    double? partnerScore,
    String? label,
    String? description,
  }) = _ComplementaryMotifEntry;

  factory ComplementaryMotifEntry.fromJson(Map<String, dynamic> json) =>
      _$ComplementaryMotifEntryFromJson(json);
}

/// Tension entry (opposing motifs)
@freezed
class TensionEntry with _$TensionEntry {
  const factory TensionEntry({
    required List<String> pair,
    required String direction, // 'me_vs_partner' or 'partner_vs_me'
    String? theme,
    String? themeLabel,
    required double strength,
    @Default([]) List<String?> labels,
  }) = _TensionEntry;

  factory TensionEntry.fromJson(Map<String, dynamic> json) =>
      _$TensionEntryFromJson(json);
}

/// Field summary (relationship dynamic label)
@freezed
class FieldSummary with _$FieldSummary {
  const factory FieldSummary({
    required String label,
    @Default([]) List<String> primaryThemes,
    @Default([]) List<String> riskLoops,
  }) = _FieldSummary;

  factory FieldSummary.fromJson(Map<String, dynamic> json) =>
      _$FieldSummaryFromJson(json);
}

/// Me summary (for relationship context)
@freezed
class MeSummary with _$MeSummary {
  const factory MeSummary({
    String? runId,
    @Default([]) List<MotifEntry> motifDistribution,
  }) = _MeSummary;

  factory MeSummary.fromJson(Map<String, dynamic> json) =>
      _$MeSummaryFromJson(json);
}

/// PsycheModel - The single source of truth
/// for both Constellation and Identification UI modules
@freezed
class PsycheModel with _$PsycheModel {
  const factory PsycheModel({
    required String runId,
    required String userId,
    required String context, // 'ME' or 'REL'
    required String createdAt,
    InputHashes? inputHashes,
    EngineVersions? engineVersions,
    
    // ME context: Structural positions (authoritative source)
    StructuralPositions? structuralPositions,
    
    // ME context: Motif data
    @Default([]) List<MotifEntry> motifDistribution,
    @Default([]) List<MotifEntry> shadowMotifs,
    
    // UI mapping
    UiLabelMapping? uiLabelMapping,
    
    // Stability analysis
    StabilityAnalysis? stability,
    
    // Quality flags
    @Default([]) List<String> qualityFlags,
    
    // REL context: Partner structural positions
    @JsonKey(name: 'partnerStructuralPositions')
    StructuralPositions? partnerStructuralPositions,
    
    // REL context: Partner motif data
    @Default([]) List<MotifEntry> partnerMotifDistribution,
    @Default([]) List<MotifEntry> partnerShadowMotifs,
    
    // REL context: Partner UI mapping
    @JsonKey(name: 'partnerUiLabelMapping')
    UiLabelMapping? partnerUiLabelMapping,
    
    // REL context: Relationship constellation
    RelationshipConstellationData? relationshipConstellation,
    
    // REL context: Me summary for comparison
    MeSummary? meSummary,
  }) = _PsycheModel;

  factory PsycheModel.fromJson(Map<String, dynamic> json) =>
      _$PsycheModelFromJson(json);
}

/// Response from POST /v1/runs/generate
@freezed
class RunGenerateResponse with _$RunGenerateResponse {
  const factory RunGenerateResponse({
    required String runId,
    @Default(false) bool cached,
  }) = _RunGenerateResponse;

  factory RunGenerateResponse.fromJson(Map<String, dynamic> json) =>
      _$RunGenerateResponseFromJson(json);
}

/// Response from GET /v1/runs/latest
@freezed
class RunLatestResponse with _$RunLatestResponse {
  const factory RunLatestResponse({
    required String runId,
    String? createdAt,
    String? context,
  }) = _RunLatestResponse;

  factory RunLatestResponse.fromJson(Map<String, dynamic> json) =>
      _$RunLatestResponseFromJson(json);
}
