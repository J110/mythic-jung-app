import 'package:freezed_annotation/freezed_annotation.dart';

part 'tone.freezed.dart';
part 'tone.g.dart';

/// Supported narrative tones - 3 distinct styles
/// 
/// MINIMAL: Action-oriented, no story form, characters only in Psyche & Examples
/// MODERN: Contemporary language, story form with recognized characters
/// MYTHICAL: Magical/fairy tale style with recognized characters, accessible language
enum NarrativeTone {
  @JsonValue('MINIMAL')
  minimal,
  @JsonValue('MODERN')
  modern,
  @JsonValue('MYTHICAL')
  mythical,
}

/// Extension for human-readable labels
extension NarrativeToneX on NarrativeTone {
  String get label {
    switch (this) {
      case NarrativeTone.minimal:
        return 'Minimal';
      case NarrativeTone.modern:
        return 'Modern';
      case NarrativeTone.mythical:
        return 'Mythical';
    }
  }

  String get description {
    switch (this) {
      case NarrativeTone.minimal:
        return 'Clean, action-oriented insights without storytelling. Characters appear only in identification and examples.';
      case NarrativeTone.modern:
        return 'Contemporary narrative weaving your characters into a meaningful personal story.';
      case NarrativeTone.mythical:
        return 'Enchanting, fairy-tale style narrative bringing your characters to life in an epic journey.';
    }
  }

  String get shortDescription {
    switch (this) {
      case NarrativeTone.minimal:
        return 'Direct & actionable';
      case NarrativeTone.modern:
        return 'Story-driven & relatable';
      case NarrativeTone.mythical:
        return 'Magical & epic';
    }
  }

  String get apiValue {
    switch (this) {
      case NarrativeTone.minimal:
        return 'MINIMAL';
      case NarrativeTone.modern:
        return 'MODERN';
      case NarrativeTone.mythical:
        return 'MYTHICAL';
    }
  }

  static NarrativeTone fromApiValue(String value) {
    switch (value.toUpperCase()) {
      case 'MINIMAL':
        return NarrativeTone.minimal;
      case 'MODERN':
        return NarrativeTone.modern;
      case 'MYTHICAL':
        return NarrativeTone.mythical;
      // Legacy mappings for backward compatibility
      case 'PLAIN':
      case 'PRACTICAL':
      case 'ANALYTICAL':
        return NarrativeTone.minimal;
      case 'REFLECTIVE':
        return NarrativeTone.modern;
      case 'MYTHIC':
        return NarrativeTone.mythical;
      default:
        return NarrativeTone.modern; // Default to modern
    }
  }
}

/// Tone metadata from API
@freezed
class ToneInfo with _$ToneInfo {
  const factory ToneInfo({
    required String value,
    required String label,
    required String description,
  }) = _ToneInfo;

  factory ToneInfo.fromJson(Map<String, dynamic> json) =>
      _$ToneInfoFromJson(json);
}

/// Response from /v1/tone/available
@freezed
class AvailableTonesResponse with _$AvailableTonesResponse {
  const factory AvailableTonesResponse({
    @Default([]) List<ToneInfo> tones,
    @Default('MODERN') String defaultTone,
  }) = _AvailableTonesResponse;

  factory AvailableTonesResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableTonesResponseFromJson(json);
}

/// Response from /v1/tone/preference
@freezed
class TonePreferenceResponse with _$TonePreferenceResponse {
  const factory TonePreferenceResponse({
    @Default('MODERN') String narrativeTone,
    @Default([]) List<ToneInfo> availableTones,
  }) = _TonePreferenceResponse;

  factory TonePreferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$TonePreferenceResponseFromJson(json);
}

/// Response from /v1/tone/render/*
@freezed
class ToneRenderResponse with _$ToneRenderResponse {
  const factory ToneRenderResponse({
    @Default(false) bool success,
    String? tone,
    Map<String, dynamic>? rendered,
    @Default(false) bool cached,
  }) = _ToneRenderResponse;

  factory ToneRenderResponse.fromJson(Map<String, dynamic> json) =>
      _$ToneRenderResponseFromJson(json);
}
