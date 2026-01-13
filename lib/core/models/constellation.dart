import 'package:freezed_annotation/freezed_annotation.dart';

part 'constellation.freezed.dart';
part 'constellation.g.dart';

// ============================================================================
// ENUMS
// ============================================================================

/// Structural archetypes (Jung's core psychological components)
enum StructuralArchetype {
  @JsonValue('EGO')
  ego,
  @JsonValue('PERSONA')
  persona,
  @JsonValue('SHADOW')
  shadow,
  @JsonValue('ANIMA_ANIMUS')
  animaAnimus,
  @JsonValue('SELF_DIRECTION')
  selfDirection,
}

/// Motif archetypes (archetypal figure images)
enum MotifArchetype {
  @JsonValue('HERO')
  hero,
  @JsonValue('TRICKSTER')
  trickster,
  @JsonValue('WISE_OLD_MAN')
  wiseOldMan,
  @JsonValue('GREAT_MOTHER')
  greatMother,
  @JsonValue('FATHER_AUTHORITY')
  fatherAuthority,
  @JsonValue('CHILD')
  child,
  @JsonValue('LOVER_EROS')
  loverEros,
  @JsonValue('WARRIOR')
  warrior,
  @JsonValue('MAGICIAN')
  magician,
  @JsonValue('CAREGIVER_HEALER')
  caregiverHealer,
  @JsonValue('OUTLAW_REBEL')
  outlawRebel,
  @JsonValue('SEEKER_WANDERER')
  seekerWanderer,
}

// ============================================================================
// STRUCTURAL ARCHETYPE DATA
// ============================================================================

/// Character assignment to a structural archetype
@freezed
class StructuralAssignment with _$StructuralAssignment {
  const factory StructuralAssignment({
    String? primary,
    @Default([]) List<String> secondary,
    @Default(0.5) double confidence,
  }) = _StructuralAssignment;

  factory StructuralAssignment.fromJson(Map<String, dynamic> json) =>
      _$StructuralAssignmentFromJson(json);
}

/// Self-direction vector (for SELF_DIRECTION archetype)
@freezed
class SelfDirectionAssignment with _$SelfDirectionAssignment {
  const factory SelfDirectionAssignment({
    @Default([]) List<String> vector,
    @Default(0.5) double confidence,
  }) = _SelfDirectionAssignment;

  factory SelfDirectionAssignment.fromJson(Map<String, dynamic> json) =>
      _$SelfDirectionAssignmentFromJson(json);
}

/// Complete structural archetypes mapping
@freezed
class StructuralArchetypes with _$StructuralArchetypes {
  const factory StructuralArchetypes({
    @JsonKey(name: 'EGO') StructuralAssignment? ego,
    @JsonKey(name: 'PERSONA') StructuralAssignment? persona,
    @JsonKey(name: 'SHADOW') StructuralAssignment? shadow,
    @JsonKey(name: 'ANIMA_ANIMUS') StructuralAssignment? animaAnimus,
    @JsonKey(name: 'SELF_DIRECTION') SelfDirectionAssignment? selfDirection,
  }) = _StructuralArchetypes;

  factory StructuralArchetypes.fromJson(Map<String, dynamic> json) =>
      _$StructuralArchetypesFromJson(json);
}

// ============================================================================
// MOTIF DATA
// ============================================================================

/// A single motif with its score
@freezed
class MotifScore with _$MotifScore {
  const factory MotifScore({
    required String motif,
    @Default(0.0) double score,
  }) = _MotifScore;

  factory MotifScore.fromJson(Map<String, dynamic> json) =>
      _$MotifScoreFromJson(json);
}

/// Complete motif distribution
@freezed
class MotifDistribution with _$MotifDistribution {
  const factory MotifDistribution({
    @Default([]) List<MotifScore> top,
    @Default([]) List<MotifScore> shadow,
    @Default([]) List<MotifScore> distribution,
  }) = _MotifDistribution;

  factory MotifDistribution.fromJson(Map<String, dynamic> json) =>
      _$MotifDistributionFromJson(json);
}

// ============================================================================
// CONSTELLATION (Single Subject: Me or Partner)
// ============================================================================

/// Complete constellation for a single subject
@freezed
class Constellation with _$Constellation {
  const factory Constellation({
    StructuralArchetypes? structural,
    MotifDistribution? motifs,
    ConstellationMeta? meta,
  }) = _Constellation;

  factory Constellation.fromJson(Map<String, dynamic> json) =>
      _$ConstellationFromJson(json);
}

/// Constellation metadata
@freezed
class ConstellationMeta with _$ConstellationMeta {
  const factory ConstellationMeta({
    String? taxonomyVersion,
    String? computedAt,
  }) = _ConstellationMeta;

  factory ConstellationMeta.fromJson(Map<String, dynamic> json) =>
      _$ConstellationMetaFromJson(json);
}

// ============================================================================
// RELATIONSHIP CONSTELLATION
// ============================================================================

/// Shared motif between Me and Partner
@freezed
class SharedMotif with _$SharedMotif {
  const factory SharedMotif({
    required String motif,
    @Default(0.0) double meScore,
    @Default(0.0) double partnerScore,
    String? label,
    String? description,
  }) = _SharedMotif;

  factory SharedMotif.fromJson(Map<String, dynamic> json) =>
      _$SharedMotifFromJson(json);
}

/// Complementary motif (one high, other low)
@freezed
class ComplementaryMotif with _$ComplementaryMotif {
  const factory ComplementaryMotif({
    required String motif,
    @Default('me') String highSide, // 'me' or 'partner'
    @Default(0.0) double delta,
    @Default(0.0) double meScore,
    @Default(0.0) double partnerScore,
    String? label,
    String? description,
  }) = _ComplementaryMotif;

  factory ComplementaryMotif.fromJson(Map<String, dynamic> json) =>
      _$ComplementaryMotifFromJson(json);
}

/// Tension pair between Me and Partner
@freezed
class TensionPair with _$TensionPair {
  const factory TensionPair({
    @Default([]) List<String> pair,
    @Default('me_vs_partner') String direction,
    String? theme,
    String? themeLabel,
    @Default(0.0) double strength,
    @Default([]) List<String> labels,
    @Default(false) bool boostedByField,
  }) = _TensionPair;

  factory TensionPair.fromJson(Map<String, dynamic> json) =>
      _$TensionPairFromJson(json);
}

/// Relational field summary
@freezed
class RelationalField with _$RelationalField {
  const factory RelationalField({
    required String label,
    @Default([]) List<String> primaryThemes,
    @Default([]) List<String> riskLoops,
  }) = _RelationalField;

  factory RelationalField.fromJson(Map<String, dynamic> json) =>
      _$RelationalFieldFromJson(json);
}

/// Complete relationship constellation
@freezed
class RelationshipConstellation with _$RelationshipConstellation {
  const factory RelationshipConstellation({
    @Default([]) List<SharedMotif> shared,
    @Default([]) List<ComplementaryMotif> complementary,
    @Default([]) List<TensionPair> tensions,
    RelationalField? field,
    ConstellationMeta? meta,
  }) = _RelationshipConstellation;

  factory RelationshipConstellation.fromJson(Map<String, dynamic> json) =>
      _$RelationshipConstellationFromJson(json);
}

// ============================================================================
// API RESPONSES
// ============================================================================

/// Response from GET /v1/me/archetypes
@freezed
class MeConstellationResponse with _$MeConstellationResponse {
  const factory MeConstellationResponse({
    required Constellation meConstellation,
    String? taxonomyVersion,
    String? computedAt,
  }) = _MeConstellationResponse;

  factory MeConstellationResponse.fromJson(Map<String, dynamic> json) =>
      _$MeConstellationResponseFromJson(json);
}

/// Response from GET /v1/relationship/archetypes
@freezed
class RelationshipConstellationResponse with _$RelationshipConstellationResponse {
  const factory RelationshipConstellationResponse({
    Constellation? meConstellation,
    Constellation? partnerConstellation,
    RelationshipConstellation? relationshipConstellation,
    String? taxonomyVersion,
    String? computedAt,
  }) = _RelationshipConstellationResponse;

  factory RelationshipConstellationResponse.fromJson(Map<String, dynamic> json) =>
      _$RelationshipConstellationResponseFromJson(json);
}

// ============================================================================
// MOTIF DISPLAY HELPERS
// ============================================================================

/// Extension methods for motif display
extension MotifArchetypeExtension on MotifArchetype {
  String get displayName {
    switch (this) {
      case MotifArchetype.hero:
        return 'Hero';
      case MotifArchetype.trickster:
        return 'Trickster';
      case MotifArchetype.wiseOldMan:
        return 'Sage';
      case MotifArchetype.greatMother:
        return 'Nurturer';
      case MotifArchetype.fatherAuthority:
        return 'Authority';
      case MotifArchetype.child:
        return 'Inner Child';
      case MotifArchetype.loverEros:
        return 'Lover';
      case MotifArchetype.warrior:
        return 'Warrior';
      case MotifArchetype.magician:
        return 'Transformer';
      case MotifArchetype.caregiverHealer:
        return 'Healer';
      case MotifArchetype.outlawRebel:
        return 'Rebel';
      case MotifArchetype.seekerWanderer:
        return 'Seeker';
    }
  }

  String get mythicName {
    switch (this) {
      case MotifArchetype.hero:
        return 'The Hero';
      case MotifArchetype.trickster:
        return 'The Trickster';
      case MotifArchetype.wiseOldMan:
        return 'The Wise Old Man';
      case MotifArchetype.greatMother:
        return 'The Great Mother';
      case MotifArchetype.fatherAuthority:
        return 'The Father';
      case MotifArchetype.child:
        return 'The Divine Child';
      case MotifArchetype.loverEros:
        return 'The Lover';
      case MotifArchetype.warrior:
        return 'The Warrior';
      case MotifArchetype.magician:
        return 'The Magician';
      case MotifArchetype.caregiverHealer:
        return 'The Healer';
      case MotifArchetype.outlawRebel:
        return 'The Outlaw';
      case MotifArchetype.seekerWanderer:
        return 'The Wanderer';
    }
  }

  String get description {
    switch (this) {
      case MotifArchetype.hero:
        return 'Courage, transformation through challenge';
      case MotifArchetype.trickster:
        return 'Boundary-crossing, playful subversion';
      case MotifArchetype.wiseOldMan:
        return 'Wisdom, guidance, knowledge';
      case MotifArchetype.greatMother:
        return 'Nurturing, protection, acceptance';
      case MotifArchetype.fatherAuthority:
        return 'Structure, rules, discipline';
      case MotifArchetype.child:
        return 'Innocence, wonder, new beginnings';
      case MotifArchetype.loverEros:
        return 'Passion, connection, intimacy';
      case MotifArchetype.warrior:
        return 'Strength, discipline, protection';
      case MotifArchetype.magician:
        return 'Transformation, vision, possibility';
      case MotifArchetype.caregiverHealer:
        return 'Compassion, service, restoration';
      case MotifArchetype.outlawRebel:
        return 'Liberation, authenticity, disruption';
      case MotifArchetype.seekerWanderer:
        return 'Quest, exploration, meaning-seeking';
    }
  }
}

/// Extension methods for structural archetype display
extension StructuralArchetypeExtension on StructuralArchetype {
  String get displayName {
    switch (this) {
      case StructuralArchetype.ego:
        return 'Core Self';
      case StructuralArchetype.persona:
        return 'Social Self';
      case StructuralArchetype.shadow:
        return 'Hidden Self';
      case StructuralArchetype.animaAnimus:
        return 'Inner Opposite';
      case StructuralArchetype.selfDirection:
        return 'Life Direction';
    }
  }

  String get mythicName {
    switch (this) {
      case StructuralArchetype.ego:
        return 'The Ego';
      case StructuralArchetype.persona:
        return 'The Mask';
      case StructuralArchetype.shadow:
        return 'The Shadow';
      case StructuralArchetype.animaAnimus:
        return 'The Soul Image';
      case StructuralArchetype.selfDirection:
        return 'The Self';
    }
  }
}
