// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call({String id, String username, String displayName});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? displayName = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
    _$AppUserImpl value,
    $Res Function(_$AppUserImpl) then,
  ) = __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, String displayName});
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
    _$AppUserImpl _value,
    $Res Function(_$AppUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? displayName = null,
  }) {
    return _then(
      _$AppUserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserImpl implements _AppUser {
  const _$AppUserImpl({
    required this.id,
    required this.username,
    required this.displayName,
  });

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String displayName;

  @override
  String toString() {
    return 'AppUser(id: $id, username: $username, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, displayName);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(this);
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser({
    required final String id,
    required final String username,
    required final String displayName,
  }) = _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get displayName;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  bool get success => throw _privateConstructorUsedError;
  AppUser get user => throw _privateConstructorUsedError;
  bool get isReturningUser => throw _privateConstructorUsedError;
  bool get hasExistingData => throw _privateConstructorUsedError;
  DataSummary? get dataSummary => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
    LoginResponse value,
    $Res Function(LoginResponse) then,
  ) = _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({
    bool success,
    AppUser user,
    bool isReturningUser,
    bool hasExistingData,
    DataSummary? dataSummary,
  });

  $AppUserCopyWith<$Res> get user;
  $DataSummaryCopyWith<$Res>? get dataSummary;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? user = null,
    Object? isReturningUser = null,
    Object? hasExistingData = null,
    Object? dataSummary = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as AppUser,
            isReturningUser: null == isReturningUser
                ? _value.isReturningUser
                : isReturningUser // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasExistingData: null == hasExistingData
                ? _value.hasExistingData
                : hasExistingData // ignore: cast_nullable_to_non_nullable
                      as bool,
            dataSummary: freezed == dataSummary
                ? _value.dataSummary
                : dataSummary // ignore: cast_nullable_to_non_nullable
                      as DataSummary?,
          )
          as $Val,
    );
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataSummaryCopyWith<$Res>? get dataSummary {
    if (_value.dataSummary == null) {
      return null;
    }

    return $DataSummaryCopyWith<$Res>(_value.dataSummary!, (value) {
      return _then(_value.copyWith(dataSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
    _$LoginResponseImpl value,
    $Res Function(_$LoginResponseImpl) then,
  ) = __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    AppUser user,
    bool isReturningUser,
    bool hasExistingData,
    DataSummary? dataSummary,
  });

  @override
  $AppUserCopyWith<$Res> get user;
  @override
  $DataSummaryCopyWith<$Res>? get dataSummary;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
    _$LoginResponseImpl _value,
    $Res Function(_$LoginResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? user = null,
    Object? isReturningUser = null,
    Object? hasExistingData = null,
    Object? dataSummary = freezed,
  }) {
    return _then(
      _$LoginResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AppUser,
        isReturningUser: null == isReturningUser
            ? _value.isReturningUser
            : isReturningUser // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasExistingData: null == hasExistingData
            ? _value.hasExistingData
            : hasExistingData // ignore: cast_nullable_to_non_nullable
                  as bool,
        dataSummary: freezed == dataSummary
            ? _value.dataSummary
            : dataSummary // ignore: cast_nullable_to_non_nullable
                  as DataSummary?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl({
    required this.success,
    required this.user,
    required this.isReturningUser,
    required this.hasExistingData,
    this.dataSummary,
  });

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final AppUser user;
  @override
  final bool isReturningUser;
  @override
  final bool hasExistingData;
  @override
  final DataSummary? dataSummary;

  @override
  String toString() {
    return 'LoginResponse(success: $success, user: $user, isReturningUser: $isReturningUser, hasExistingData: $hasExistingData, dataSummary: $dataSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isReturningUser, isReturningUser) ||
                other.isReturningUser == isReturningUser) &&
            (identical(other.hasExistingData, hasExistingData) ||
                other.hasExistingData == hasExistingData) &&
            (identical(other.dataSummary, dataSummary) ||
                other.dataSummary == dataSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    user,
    isReturningUser,
    hasExistingData,
    dataSummary,
  );

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(this);
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse({
    required final bool success,
    required final AppUser user,
    required final bool isReturningUser,
    required final bool hasExistingData,
    final DataSummary? dataSummary,
  }) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  bool get success;
  @override
  AppUser get user;
  @override
  bool get isReturningUser;
  @override
  bool get hasExistingData;
  @override
  DataSummary? get dataSummary;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataSummary _$DataSummaryFromJson(Map<String, dynamic> json) {
  return _DataSummary.fromJson(json);
}

/// @nodoc
mixin _$DataSummary {
  int get characterCount => throw _privateConstructorUsedError;
  bool get hasStory => throw _privateConstructorUsedError;
  bool get hasRelationship => throw _privateConstructorUsedError;
  String? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this DataSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataSummaryCopyWith<DataSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSummaryCopyWith<$Res> {
  factory $DataSummaryCopyWith(
    DataSummary value,
    $Res Function(DataSummary) then,
  ) = _$DataSummaryCopyWithImpl<$Res, DataSummary>;
  @useResult
  $Res call({
    int characterCount,
    bool hasStory,
    bool hasRelationship,
    String? lastUpdated,
  });
}

/// @nodoc
class _$DataSummaryCopyWithImpl<$Res, $Val extends DataSummary>
    implements $DataSummaryCopyWith<$Res> {
  _$DataSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterCount = null,
    Object? hasStory = null,
    Object? hasRelationship = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _value.copyWith(
            characterCount: null == characterCount
                ? _value.characterCount
                : characterCount // ignore: cast_nullable_to_non_nullable
                      as int,
            hasStory: null == hasStory
                ? _value.hasStory
                : hasStory // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasRelationship: null == hasRelationship
                ? _value.hasRelationship
                : hasRelationship // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastUpdated: freezed == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DataSummaryImplCopyWith<$Res>
    implements $DataSummaryCopyWith<$Res> {
  factory _$$DataSummaryImplCopyWith(
    _$DataSummaryImpl value,
    $Res Function(_$DataSummaryImpl) then,
  ) = __$$DataSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int characterCount,
    bool hasStory,
    bool hasRelationship,
    String? lastUpdated,
  });
}

/// @nodoc
class __$$DataSummaryImplCopyWithImpl<$Res>
    extends _$DataSummaryCopyWithImpl<$Res, _$DataSummaryImpl>
    implements _$$DataSummaryImplCopyWith<$Res> {
  __$$DataSummaryImplCopyWithImpl(
    _$DataSummaryImpl _value,
    $Res Function(_$DataSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DataSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterCount = null,
    Object? hasStory = null,
    Object? hasRelationship = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _$DataSummaryImpl(
        characterCount: null == characterCount
            ? _value.characterCount
            : characterCount // ignore: cast_nullable_to_non_nullable
                  as int,
        hasStory: null == hasStory
            ? _value.hasStory
            : hasStory // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasRelationship: null == hasRelationship
            ? _value.hasRelationship
            : hasRelationship // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastUpdated: freezed == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DataSummaryImpl implements _DataSummary {
  const _$DataSummaryImpl({
    required this.characterCount,
    required this.hasStory,
    required this.hasRelationship,
    this.lastUpdated,
  });

  factory _$DataSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataSummaryImplFromJson(json);

  @override
  final int characterCount;
  @override
  final bool hasStory;
  @override
  final bool hasRelationship;
  @override
  final String? lastUpdated;

  @override
  String toString() {
    return 'DataSummary(characterCount: $characterCount, hasStory: $hasStory, hasRelationship: $hasRelationship, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSummaryImpl &&
            (identical(other.characterCount, characterCount) ||
                other.characterCount == characterCount) &&
            (identical(other.hasStory, hasStory) ||
                other.hasStory == hasStory) &&
            (identical(other.hasRelationship, hasRelationship) ||
                other.hasRelationship == hasRelationship) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    characterCount,
    hasStory,
    hasRelationship,
    lastUpdated,
  );

  /// Create a copy of DataSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSummaryImplCopyWith<_$DataSummaryImpl> get copyWith =>
      __$$DataSummaryImplCopyWithImpl<_$DataSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataSummaryImplToJson(this);
  }
}

abstract class _DataSummary implements DataSummary {
  const factory _DataSummary({
    required final int characterCount,
    required final bool hasStory,
    required final bool hasRelationship,
    final String? lastUpdated,
  }) = _$DataSummaryImpl;

  factory _DataSummary.fromJson(Map<String, dynamic> json) =
      _$DataSummaryImpl.fromJson;

  @override
  int get characterCount;
  @override
  bool get hasStory;
  @override
  bool get hasRelationship;
  @override
  String? get lastUpdated;

  /// Create a copy of DataSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataSummaryImplCopyWith<_$DataSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStatus _$UserStatusFromJson(Map<String, dynamic> json) {
  return _UserStatus.fromJson(json);
}

/// @nodoc
mixin _$UserStatus {
  AppUser get user => throw _privateConstructorUsedError;
  UserDataStatus get data => throw _privateConstructorUsedError;

  /// Serializes this UserStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatusCopyWith<UserStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatusCopyWith<$Res> {
  factory $UserStatusCopyWith(
    UserStatus value,
    $Res Function(UserStatus) then,
  ) = _$UserStatusCopyWithImpl<$Res, UserStatus>;
  @useResult
  $Res call({AppUser user, UserDataStatus data});

  $AppUserCopyWith<$Res> get user;
  $UserDataStatusCopyWith<$Res> get data;
}

/// @nodoc
class _$UserStatusCopyWithImpl<$Res, $Val extends UserStatus>
    implements $UserStatusCopyWith<$Res> {
  _$UserStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? data = null}) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as AppUser,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as UserDataStatus,
          )
          as $Val,
    );
  }

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataStatusCopyWith<$Res> get data {
    return $UserDataStatusCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStatusImplCopyWith<$Res>
    implements $UserStatusCopyWith<$Res> {
  factory _$$UserStatusImplCopyWith(
    _$UserStatusImpl value,
    $Res Function(_$UserStatusImpl) then,
  ) = __$$UserStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppUser user, UserDataStatus data});

  @override
  $AppUserCopyWith<$Res> get user;
  @override
  $UserDataStatusCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserStatusImplCopyWithImpl<$Res>
    extends _$UserStatusCopyWithImpl<$Res, _$UserStatusImpl>
    implements _$$UserStatusImplCopyWith<$Res> {
  __$$UserStatusImplCopyWithImpl(
    _$UserStatusImpl _value,
    $Res Function(_$UserStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? data = null}) {
    return _then(
      _$UserStatusImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AppUser,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as UserDataStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatusImpl implements _UserStatus {
  const _$UserStatusImpl({required this.user, required this.data});

  factory _$UserStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatusImplFromJson(json);

  @override
  final AppUser user;
  @override
  final UserDataStatus data;

  @override
  String toString() {
    return 'UserStatus(user: $user, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatusImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, data);

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatusImplCopyWith<_$UserStatusImpl> get copyWith =>
      __$$UserStatusImplCopyWithImpl<_$UserStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatusImplToJson(this);
  }
}

abstract class _UserStatus implements UserStatus {
  const factory _UserStatus({
    required final AppUser user,
    required final UserDataStatus data,
  }) = _$UserStatusImpl;

  factory _UserStatus.fromJson(Map<String, dynamic> json) =
      _$UserStatusImpl.fromJson;

  @override
  AppUser get user;
  @override
  UserDataStatus get data;

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatusImplCopyWith<_$UserStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDataStatus _$UserDataStatusFromJson(Map<String, dynamic> json) {
  return _UserDataStatus.fromJson(json);
}

/// @nodoc
mixin _$UserDataStatus {
  bool get hasCharacters => throw _privateConstructorUsedError;
  int get characterCount => throw _privateConstructorUsedError;
  bool get hasMeOutput => throw _privateConstructorUsedError;
  bool get hasRelationshipOutput => throw _privateConstructorUsedError;
  String get tonePreference => throw _privateConstructorUsedError;
  String? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this UserDataStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDataStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataStatusCopyWith<UserDataStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataStatusCopyWith<$Res> {
  factory $UserDataStatusCopyWith(
    UserDataStatus value,
    $Res Function(UserDataStatus) then,
  ) = _$UserDataStatusCopyWithImpl<$Res, UserDataStatus>;
  @useResult
  $Res call({
    bool hasCharacters,
    int characterCount,
    bool hasMeOutput,
    bool hasRelationshipOutput,
    String tonePreference,
    String? lastUpdated,
  });
}

/// @nodoc
class _$UserDataStatusCopyWithImpl<$Res, $Val extends UserDataStatus>
    implements $UserDataStatusCopyWith<$Res> {
  _$UserDataStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDataStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasCharacters = null,
    Object? characterCount = null,
    Object? hasMeOutput = null,
    Object? hasRelationshipOutput = null,
    Object? tonePreference = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _value.copyWith(
            hasCharacters: null == hasCharacters
                ? _value.hasCharacters
                : hasCharacters // ignore: cast_nullable_to_non_nullable
                      as bool,
            characterCount: null == characterCount
                ? _value.characterCount
                : characterCount // ignore: cast_nullable_to_non_nullable
                      as int,
            hasMeOutput: null == hasMeOutput
                ? _value.hasMeOutput
                : hasMeOutput // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasRelationshipOutput: null == hasRelationshipOutput
                ? _value.hasRelationshipOutput
                : hasRelationshipOutput // ignore: cast_nullable_to_non_nullable
                      as bool,
            tonePreference: null == tonePreference
                ? _value.tonePreference
                : tonePreference // ignore: cast_nullable_to_non_nullable
                      as String,
            lastUpdated: freezed == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDataStatusImplCopyWith<$Res>
    implements $UserDataStatusCopyWith<$Res> {
  factory _$$UserDataStatusImplCopyWith(
    _$UserDataStatusImpl value,
    $Res Function(_$UserDataStatusImpl) then,
  ) = __$$UserDataStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool hasCharacters,
    int characterCount,
    bool hasMeOutput,
    bool hasRelationshipOutput,
    String tonePreference,
    String? lastUpdated,
  });
}

/// @nodoc
class __$$UserDataStatusImplCopyWithImpl<$Res>
    extends _$UserDataStatusCopyWithImpl<$Res, _$UserDataStatusImpl>
    implements _$$UserDataStatusImplCopyWith<$Res> {
  __$$UserDataStatusImplCopyWithImpl(
    _$UserDataStatusImpl _value,
    $Res Function(_$UserDataStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserDataStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasCharacters = null,
    Object? characterCount = null,
    Object? hasMeOutput = null,
    Object? hasRelationshipOutput = null,
    Object? tonePreference = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _$UserDataStatusImpl(
        hasCharacters: null == hasCharacters
            ? _value.hasCharacters
            : hasCharacters // ignore: cast_nullable_to_non_nullable
                  as bool,
        characterCount: null == characterCount
            ? _value.characterCount
            : characterCount // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMeOutput: null == hasMeOutput
            ? _value.hasMeOutput
            : hasMeOutput // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasRelationshipOutput: null == hasRelationshipOutput
            ? _value.hasRelationshipOutput
            : hasRelationshipOutput // ignore: cast_nullable_to_non_nullable
                  as bool,
        tonePreference: null == tonePreference
            ? _value.tonePreference
            : tonePreference // ignore: cast_nullable_to_non_nullable
                  as String,
        lastUpdated: freezed == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataStatusImpl implements _UserDataStatus {
  const _$UserDataStatusImpl({
    required this.hasCharacters,
    required this.characterCount,
    required this.hasMeOutput,
    required this.hasRelationshipOutput,
    required this.tonePreference,
    this.lastUpdated,
  });

  factory _$UserDataStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataStatusImplFromJson(json);

  @override
  final bool hasCharacters;
  @override
  final int characterCount;
  @override
  final bool hasMeOutput;
  @override
  final bool hasRelationshipOutput;
  @override
  final String tonePreference;
  @override
  final String? lastUpdated;

  @override
  String toString() {
    return 'UserDataStatus(hasCharacters: $hasCharacters, characterCount: $characterCount, hasMeOutput: $hasMeOutput, hasRelationshipOutput: $hasRelationshipOutput, tonePreference: $tonePreference, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataStatusImpl &&
            (identical(other.hasCharacters, hasCharacters) ||
                other.hasCharacters == hasCharacters) &&
            (identical(other.characterCount, characterCount) ||
                other.characterCount == characterCount) &&
            (identical(other.hasMeOutput, hasMeOutput) ||
                other.hasMeOutput == hasMeOutput) &&
            (identical(other.hasRelationshipOutput, hasRelationshipOutput) ||
                other.hasRelationshipOutput == hasRelationshipOutput) &&
            (identical(other.tonePreference, tonePreference) ||
                other.tonePreference == tonePreference) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hasCharacters,
    characterCount,
    hasMeOutput,
    hasRelationshipOutput,
    tonePreference,
    lastUpdated,
  );

  /// Create a copy of UserDataStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataStatusImplCopyWith<_$UserDataStatusImpl> get copyWith =>
      __$$UserDataStatusImplCopyWithImpl<_$UserDataStatusImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataStatusImplToJson(this);
  }
}

abstract class _UserDataStatus implements UserDataStatus {
  const factory _UserDataStatus({
    required final bool hasCharacters,
    required final int characterCount,
    required final bool hasMeOutput,
    required final bool hasRelationshipOutput,
    required final String tonePreference,
    final String? lastUpdated,
  }) = _$UserDataStatusImpl;

  factory _UserDataStatus.fromJson(Map<String, dynamic> json) =
      _$UserDataStatusImpl.fromJson;

  @override
  bool get hasCharacters;
  @override
  int get characterCount;
  @override
  bool get hasMeOutput;
  @override
  bool get hasRelationshipOutput;
  @override
  String get tonePreference;
  @override
  String? get lastUpdated;

  /// Create a copy of UserDataStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataStatusImplCopyWith<_$UserDataStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
