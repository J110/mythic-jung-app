import 'package:freezed_annotation/freezed_annotation.dart';

part 'tone.freezed.dart';
part 'tone.g.dart';

/// Supported narrative tones
enum NarrativeTone {
  @JsonValue('PLAIN')
  plain,
  @JsonValue('MYTHIC')
  mythic,
  @JsonValue('REFLECTIVE')
  reflective,
  @JsonValue('PRACTICAL')
  practical,
  @JsonValue('ANALYTICAL')
  analytical,
}

/// Extension for human-readable labels
extension NarrativeToneX on NarrativeTone {
  String get label {
    switch (this) {
      case NarrativeTone.plain:
        return 'Clear & Direct';
      case NarrativeTone.mythic:
        return 'Mythic & Poetic';
      case NarrativeTone.reflective:
        return 'Gentle & Contemplative';
      case NarrativeTone.practical:
        return 'Action-Oriented';
      case NarrativeTone.analytical:
        return 'Deep & Psychological';
    }
  }

  String get description {
    switch (this) {
      case NarrativeTone.plain:
        return 'No metaphors, just clear everyday language you can share with anyone';
      case NarrativeTone.mythic:
        return 'Rich with archetypal imagery, metaphors, and a sense of epic storytelling';
      case NarrativeTone.reflective:
        return 'Soft questions and invitations to explore — like a wise friend speaking';
      case NarrativeTone.practical:
        return 'Bullet points and "do this, avoid that" — ready for immediate action';
      case NarrativeTone.analytical:
        return 'Full Jungian terminology — ego, shadow, anima explained explicitly';
    }
  }

  String get apiValue {
    switch (this) {
      case NarrativeTone.plain:
        return 'PLAIN';
      case NarrativeTone.mythic:
        return 'MYTHIC';
      case NarrativeTone.reflective:
        return 'REFLECTIVE';
      case NarrativeTone.practical:
        return 'PRACTICAL';
      case NarrativeTone.analytical:
        return 'ANALYTICAL';
    }
  }

  static NarrativeTone fromApiValue(String value) {
    switch (value.toUpperCase()) {
      case 'PLAIN':
        return NarrativeTone.plain;
      case 'MYTHIC':
        return NarrativeTone.mythic;
      case 'REFLECTIVE':
        return NarrativeTone.reflective;
      case 'PRACTICAL':
        return NarrativeTone.practical;
      case 'ANALYTICAL':
        return NarrativeTone.analytical;
      default:
        return NarrativeTone.plain;
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
    @Default('PLAIN') String defaultTone,
  }) = _AvailableTonesResponse;

  factory AvailableTonesResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableTonesResponseFromJson(json);
}

/// Response from /v1/tone/preference
@freezed
class TonePreferenceResponse with _$TonePreferenceResponse {
  const factory TonePreferenceResponse({
    @Default('PLAIN') String narrativeTone,
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
