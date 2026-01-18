// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToneInfoImpl _$$ToneInfoImplFromJson(Map<String, dynamic> json) =>
    _$ToneInfoImpl(
      value: json['value'] as String,
      label: json['label'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ToneInfoImplToJson(_$ToneInfoImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'description': instance.description,
    };

_$AvailableTonesResponseImpl _$$AvailableTonesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AvailableTonesResponseImpl(
  tones:
      (json['tones'] as List<dynamic>?)
          ?.map((e) => ToneInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  defaultTone: json['defaultTone'] as String? ?? 'MODERN',
);

Map<String, dynamic> _$$AvailableTonesResponseImplToJson(
  _$AvailableTonesResponseImpl instance,
) => <String, dynamic>{
  'tones': instance.tones,
  'defaultTone': instance.defaultTone,
};

_$TonePreferenceResponseImpl _$$TonePreferenceResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TonePreferenceResponseImpl(
  narrativeTone: json['narrativeTone'] as String? ?? 'MODERN',
  availableTones:
      (json['availableTones'] as List<dynamic>?)
          ?.map((e) => ToneInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$TonePreferenceResponseImplToJson(
  _$TonePreferenceResponseImpl instance,
) => <String, dynamic>{
  'narrativeTone': instance.narrativeTone,
  'availableTones': instance.availableTones,
};

_$ToneRenderResponseImpl _$$ToneRenderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ToneRenderResponseImpl(
  success: json['success'] as bool? ?? false,
  tone: json['tone'] as String?,
  rendered: json['rendered'] as Map<String, dynamic>?,
  cached: json['cached'] as bool? ?? false,
);

Map<String, dynamic> _$$ToneRenderResponseImplToJson(
  _$ToneRenderResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'tone': instance.tone,
  'rendered': instance.rendered,
  'cached': instance.cached,
};
