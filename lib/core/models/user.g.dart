// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      displayName: json['displayName'] as String,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'displayName': instance.displayName,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      success: json['success'] as bool,
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
      isReturningUser: json['isReturningUser'] as bool,
      hasExistingData: json['hasExistingData'] as bool,
      dataSummary: json['dataSummary'] == null
          ? null
          : DataSummary.fromJson(json['dataSummary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'user': instance.user,
      'isReturningUser': instance.isReturningUser,
      'hasExistingData': instance.hasExistingData,
      'dataSummary': instance.dataSummary,
    };

_$DataSummaryImpl _$$DataSummaryImplFromJson(Map<String, dynamic> json) =>
    _$DataSummaryImpl(
      characterCount: (json['characterCount'] as num).toInt(),
      hasStory: json['hasStory'] as bool,
      hasRelationship: json['hasRelationship'] as bool,
      lastUpdated: json['lastUpdated'] as String?,
    );

Map<String, dynamic> _$$DataSummaryImplToJson(_$DataSummaryImpl instance) =>
    <String, dynamic>{
      'characterCount': instance.characterCount,
      'hasStory': instance.hasStory,
      'hasRelationship': instance.hasRelationship,
      'lastUpdated': instance.lastUpdated,
    };

_$UserStatusImpl _$$UserStatusImplFromJson(Map<String, dynamic> json) =>
    _$UserStatusImpl(
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
      data: UserDataStatus.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserStatusImplToJson(_$UserStatusImpl instance) =>
    <String, dynamic>{'user': instance.user, 'data': instance.data};

_$UserDataStatusImpl _$$UserDataStatusImplFromJson(Map<String, dynamic> json) =>
    _$UserDataStatusImpl(
      hasCharacters: json['hasCharacters'] as bool,
      characterCount: (json['characterCount'] as num).toInt(),
      hasMeOutput: json['hasMeOutput'] as bool,
      hasRelationshipOutput: json['hasRelationshipOutput'] as bool,
      tonePreference: json['tonePreference'] as String,
      lastUpdated: json['lastUpdated'] as String?,
    );

Map<String, dynamic> _$$UserDataStatusImplToJson(
  _$UserDataStatusImpl instance,
) => <String, dynamic>{
  'hasCharacters': instance.hasCharacters,
  'characterCount': instance.characterCount,
  'hasMeOutput': instance.hasMeOutput,
  'hasRelationshipOutput': instance.hasRelationshipOutput,
  'tonePreference': instance.tonePreference,
  'lastUpdated': instance.lastUpdated,
};

_$UserSyncDataImpl _$$UserSyncDataImplFromJson(Map<String, dynamic> json) =>
    _$UserSyncDataImpl(
      user: json['user'] == null
          ? null
          : AppUser.fromJson(json['user'] as Map<String, dynamic>),
      meOutput: json['meOutput'] == null
          ? null
          : GeneratedOutput.fromJson(json['meOutput'] as Map<String, dynamic>),
      relationshipOutput: json['relationshipOutput'] == null
          ? null
          : RelationshipOutput.fromJson(
              json['relationshipOutput'] as Map<String, dynamic>,
            ),
      relationshipSettings: json['relationshipSettings'] == null
          ? null
          : RelationshipSettings.fromJson(
              json['relationshipSettings'] as Map<String, dynamic>,
            ),
      tonePreference: json['tonePreference'] as String,
    );

Map<String, dynamic> _$$UserSyncDataImplToJson(_$UserSyncDataImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'meOutput': instance.meOutput,
      'relationshipOutput': instance.relationshipOutput,
      'relationshipSettings': instance.relationshipSettings,
      'tonePreference': instance.tonePreference,
    };

_$RelationshipSettingsImpl _$$RelationshipSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$RelationshipSettingsImpl(
  enabled: json['enabled'] as bool,
  type: json['type'] as String,
);

Map<String, dynamic> _$$RelationshipSettingsImplToJson(
  _$RelationshipSettingsImpl instance,
) => <String, dynamic>{'enabled': instance.enabled, 'type': instance.type};
