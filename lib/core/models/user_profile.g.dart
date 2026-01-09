// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
      answers:
          (json['answers'] as List<dynamic>?)
              ?.map((e) => AssessmentAnswer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cachedOutput: json['cachedOutput'] == null
          ? null
          : GeneratedOutput.fromJson(
              json['cachedOutput'] as Map<String, dynamic>,
            ),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'characters': instance.characters,
      'answers': instance.answers,
      'cachedOutput': instance.cachedOutput,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };
