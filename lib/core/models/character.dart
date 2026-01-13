import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

/// Reference type for character disambiguation
enum ReferenceType {
  @JsonValue('MOVIE')
  movie,
  @JsonValue('TV')
  tv,
  @JsonValue('BOOK')
  book,
  @JsonValue('GAME')
  game,
  @JsonValue('REAL_LIFE')
  realLife,
  @JsonValue('OTHER')
  other,
}

/// Limit mode for recognition
enum LimitMode {
  @JsonValue('NONE')
  none,
  @JsonValue('ASSISTIVE')
  assistive,
  @JsonValue('STRICT')
  strict,
}

/// Character reference for disambiguation
@freezed
class CharacterEntryReference with _$CharacterEntryReference {
  const factory CharacterEntryReference({
    String? text,
    @Default(ReferenceType.other) ReferenceType type,
    @Default(LimitMode.assistive) LimitMode limitMode,
  }) = _CharacterEntryReference;

  factory CharacterEntryReference.fromJson(Map<String, dynamic> json) =>
      _$CharacterEntryReferenceFromJson(json);
}

@freezed
class Character with _$Character {
  const factory Character({
    required String id,
    required String displayName,
    String? canonHint,
    /// Optional reference for disambiguation (e.g., "Yes Man", "Saat Khoon Maaf")
    CharacterEntryReference? entryReference,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
