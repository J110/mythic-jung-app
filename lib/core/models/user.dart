import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String username,
    required String displayName,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool success,
    required AppUser user,
    required bool isReturningUser,
    required bool hasExistingData,
    DataSummary? dataSummary,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@freezed
class DataSummary with _$DataSummary {
  const factory DataSummary({
    required int characterCount,
    required bool hasStory,
    required bool hasRelationship,
    String? lastUpdated,
  }) = _DataSummary;

  factory DataSummary.fromJson(Map<String, dynamic> json) => _$DataSummaryFromJson(json);
}

@freezed
class UserStatus with _$UserStatus {
  const factory UserStatus({
    required AppUser user,
    required UserDataStatus data,
  }) = _UserStatus;

  factory UserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusFromJson(json);
}

@freezed
class UserDataStatus with _$UserDataStatus {
  const factory UserDataStatus({
    required bool hasCharacters,
    required int characterCount,
    required bool hasMeOutput,
    required bool hasRelationshipOutput,
    required String tonePreference,
    String? lastUpdated,
  }) = _UserDataStatus;

  factory UserDataStatus.fromJson(Map<String, dynamic> json) => _$UserDataStatusFromJson(json);
}
