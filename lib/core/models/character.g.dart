// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterEntryReferenceImpl _$$CharacterEntryReferenceImplFromJson(
  Map<String, dynamic> json,
) => _$CharacterEntryReferenceImpl(
  text: json['text'] as String?,
  type:
      $enumDecodeNullable(_$ReferenceTypeEnumMap, json['type']) ??
      ReferenceType.other,
  limitMode:
      $enumDecodeNullable(_$LimitModeEnumMap, json['limitMode']) ??
      LimitMode.assistive,
);

Map<String, dynamic> _$$CharacterEntryReferenceImplToJson(
  _$CharacterEntryReferenceImpl instance,
) => <String, dynamic>{
  'text': instance.text,
  'type': _$ReferenceTypeEnumMap[instance.type]!,
  'limitMode': _$LimitModeEnumMap[instance.limitMode]!,
};

const _$ReferenceTypeEnumMap = {
  ReferenceType.movie: 'MOVIE',
  ReferenceType.tv: 'TV',
  ReferenceType.book: 'BOOK',
  ReferenceType.game: 'GAME',
  ReferenceType.realLife: 'REAL_LIFE',
  ReferenceType.other: 'OTHER',
};

const _$LimitModeEnumMap = {
  LimitMode.none: 'NONE',
  LimitMode.assistive: 'ASSISTIVE',
  LimitMode.strict: 'STRICT',
};

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      canonHint: json['canonHint'] as String?,
      entryReference: json['entryReference'] == null
          ? null
          : CharacterEntryReference.fromJson(
              json['entryReference'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'canonHint': instance.canonHint,
      'entryReference': instance.entryReference,
    };
