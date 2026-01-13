import 'package:freezed_annotation/freezed_annotation.dart';

part 'resonance.freezed.dart';
part 'resonance.g.dart';

/// Reference mode for character phase selection
enum ReferenceMode {
  @JsonValue('NONE')
  none,
  @JsonValue('GENERAL')
  general,
  @JsonValue('SPECIFIC')
  specific,
}

/// Version option - a specific version/era of a character (e.g., "Daniel Craig era")
@freezed
class VersionOption with _$VersionOption {
  const factory VersionOption({
    required String versionId,
    required String label,
    required String cue,
    @Default([]) List<String> tags,
    @Default([]) List<String> exampleRefs,
  }) = _VersionOption;

  factory VersionOption.fromJson(Map<String, dynamic> json) =>
      _$VersionOptionFromJson(json);
}

/// Phase option - an arc phase of a character (e.g., "Broken Knight", "Redemption Arc")
@freezed
class PhaseOption with _$PhaseOption {
  const factory PhaseOption({
    required String phaseId,
    required String label,
    required String cue,
    @Default([]) List<String> tags,
    @Default([]) List<String> exampleRefs,
    /// Whether this phase can be excluded (for negative arc exclusion)
    @Default(true) bool excludable,
  }) = _PhaseOption;

  factory PhaseOption.fromJson(Map<String, dynamic> json) =>
      _$PhaseOptionFromJson(json);
}

/// Character reference - user's selected version and phase
@freezed
class CharacterReference with _$CharacterReference {
  const factory CharacterReference({
    @Default(ReferenceMode.none) ReferenceMode mode,
    String? versionId,
    String? phaseId,
    /// Explicitly excluded phase IDs (negative arc exclusion)
    @Default([]) List<String> excludedPhaseIds,
    @Default([]) List<String> tags,
    String? text,
  }) = _CharacterReference;

  factory CharacterReference.fromJson(Map<String, dynamic> json) =>
      _$CharacterReferenceFromJson(json);
}

/// Resonance input - positive and negative free-text inputs
@freezed
class ResonanceInput with _$ResonanceInput {
  const factory ResonanceInput({
    /// What the user connects with (positive resonance)
    String? positiveText,
    /// What the user doesn't connect with (negative resonance)
    String? negativeText,
    /// Specific moment they identify with
    String? anchorMoment,
    /// What they admire
    String? admire,
    /// What they reject
    String? reject,
  }) = _ResonanceInput;

  factory ResonanceInput.fromJson(Map<String, dynamic> json) =>
      _$ResonanceInputFromJson(json);
}

/// Ambiguity analysis result for a single character
@freezed
class CharacterAmbiguityAnalysis with _$CharacterAmbiguityAnalysis {
  const factory CharacterAmbiguityAnalysis({
    required String input,
    String? characterName,
    String? canonicalId,
    // Character identification reference (always shown to user)
    String? franchise,
    String? medium,
    String? referenceDescription,
    @Default(false) bool needsClarification,
    String? disambiguationReason,
    /// User-friendly message explaining why clarification is needed
    String? clarificationMessage,
    /// AI specifically requested clarification for this character
    @Default(false) bool aiNeedsClarification,
    /// True if the input was detected as an actor name
    @Default(false) bool inputWasActor,
    // Concrete version options with labels and cues
    @Default([]) List<VersionOption> versionOptions,
    // Concrete phase options with labels and cues
    @Default([]) List<PhaseOption> phaseOptions,
    // Whether to show arc exclusion section (true if >1 phases or polarized character)
    @Default(false) bool showExclusionSection,
    // User's selection (to be filled in)
    CharacterReference? selectedReference,
    // Entry reference info (from Character Entry page)
    @Default(false) bool hasEntryReference,
    String? entryReferenceText,
    /// True if top match doesn't align with user's entry reference
    @Default(false) bool entryReferenceMismatch,
    /// Message explaining the mismatch
    String? entryReferenceMismatchMessage,
    /// Alternative candidates that match the reference
    @Default([]) List<AlternativeCandidate> alternativeCandidates,
  }) = _CharacterAmbiguityAnalysis;

  factory CharacterAmbiguityAnalysis.fromJson(Map<String, dynamic> json) =>
      _$CharacterAmbiguityAnalysisFromJson(json);
}

/// Alternative candidate for disambiguation
@freezed
class AlternativeCandidate with _$AlternativeCandidate {
  const factory AlternativeCandidate({
    required String canonicalId,
    required String name,
    String? franchise,
    String? medium,
    @Default(false) bool matchesReference,
  }) = _AlternativeCandidate;

  factory AlternativeCandidate.fromJson(Map<String, dynamic> json) =>
      _$AlternativeCandidateFromJson(json);
}

/// Response from resonance analyze endpoint
@freezed
class ResonanceAnalysisResponse with _$ResonanceAnalysisResponse {
  const factory ResonanceAnalysisResponse({
    @Default(false) bool success,
    @Default(false) bool needsClarification,
    @Default([]) List<CharacterAmbiguityAnalysis> characters,
    ResonanceSummary? recognitionSummary,
  }) = _ResonanceAnalysisResponse;

  factory ResonanceAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      _$ResonanceAnalysisResponseFromJson(json);
}

/// Summary of recognition results
@freezed
class ResonanceSummary with _$ResonanceSummary {
  const factory ResonanceSummary({
    @Default(0) int total,
    @Default(0) int recognized,
    @Default(0) int needsClarification,
    /// Number of characters with entry references from Character Entry page
    @Default(0) int withEntryReferences,
    /// Number of characters where top match doesn't align with entry reference
    @Default(0) int referenceMismatches,
  }) = _ResonanceSummary;

  factory ResonanceSummary.fromJson(Map<String, dynamic> json) =>
      _$ResonanceSummaryFromJson(json);
}

/// User's clarification choices to send back
@freezed
class ClarificationChoice with _$ClarificationChoice {
  const factory ClarificationChoice({
    @Default('NONE') String referenceMode,
    String? versionId,
    String? phaseId,
    /// Explicitly excluded phase IDs (negative arc exclusion)
    @Default([]) List<String> excludedPhaseIds,
    @Default([]) List<String> referenceTags,
    String? referenceText,
    /// Positive resonance - what user connects with
    String? positiveText,
    /// Negative resonance - what doesn't feel like the user
    String? negativeText,
  }) = _ClarificationChoice;

  factory ClarificationChoice.fromJson(Map<String, dynamic> json) =>
      _$ClarificationChoiceFromJson(json);
}

// ============================================================================
// RE-RECOGNITION MODELS
// ============================================================================

/// Response from re-recognizing a single character
@freezed
class RerecognizeResponse with _$RerecognizeResponse {
  const factory RerecognizeResponse({
    @Default(false) bool success,
    @Default(0) int characterIndex,
    String? originalInput,
    RerecognizedCharacter? updatedCharacter,
    String? message,
    String? error,
  }) = _RerecognizeResponse;

  factory RerecognizeResponse.fromJson(Map<String, dynamic> json) =>
      _$RerecognizeResponseFromJson(json);
}

/// Updated character data after re-recognition
@freezed
class RerecognizedCharacter with _$RerecognizedCharacter {
  const factory RerecognizedCharacter({
    required String input,
    String? characterName,
    String? canonicalId,
    String? franchise,
    String? medium,
    @Default(0.0) double confidence,
    @Default(false) bool needsClarification,
    @Default([]) List<VersionOption> versionOptions,
    @Default([]) List<PhaseOption> phaseOptions,
    @Default(false) bool wasRerecognized,
  }) = _RerecognizedCharacter;

  factory RerecognizedCharacter.fromJson(Map<String, dynamic> json) =>
      _$RerecognizedCharacterFromJson(json);
}
