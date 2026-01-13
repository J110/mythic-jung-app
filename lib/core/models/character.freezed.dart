// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CharacterEntryReference _$CharacterEntryReferenceFromJson(
  Map<String, dynamic> json,
) {
  return _CharacterEntryReference.fromJson(json);
}

/// @nodoc
mixin _$CharacterEntryReference {
  String? get text => throw _privateConstructorUsedError;
  ReferenceType get type => throw _privateConstructorUsedError;
  LimitMode get limitMode => throw _privateConstructorUsedError;

  /// Serializes this CharacterEntryReference to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterEntryReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterEntryReferenceCopyWith<CharacterEntryReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterEntryReferenceCopyWith<$Res> {
  factory $CharacterEntryReferenceCopyWith(
    CharacterEntryReference value,
    $Res Function(CharacterEntryReference) then,
  ) = _$CharacterEntryReferenceCopyWithImpl<$Res, CharacterEntryReference>;
  @useResult
  $Res call({String? text, ReferenceType type, LimitMode limitMode});
}

/// @nodoc
class _$CharacterEntryReferenceCopyWithImpl<
  $Res,
  $Val extends CharacterEntryReference
>
    implements $CharacterEntryReferenceCopyWith<$Res> {
  _$CharacterEntryReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterEntryReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = null,
    Object? limitMode = null,
  }) {
    return _then(
      _value.copyWith(
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ReferenceType,
            limitMode: null == limitMode
                ? _value.limitMode
                : limitMode // ignore: cast_nullable_to_non_nullable
                      as LimitMode,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CharacterEntryReferenceImplCopyWith<$Res>
    implements $CharacterEntryReferenceCopyWith<$Res> {
  factory _$$CharacterEntryReferenceImplCopyWith(
    _$CharacterEntryReferenceImpl value,
    $Res Function(_$CharacterEntryReferenceImpl) then,
  ) = __$$CharacterEntryReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, ReferenceType type, LimitMode limitMode});
}

/// @nodoc
class __$$CharacterEntryReferenceImplCopyWithImpl<$Res>
    extends
        _$CharacterEntryReferenceCopyWithImpl<
          $Res,
          _$CharacterEntryReferenceImpl
        >
    implements _$$CharacterEntryReferenceImplCopyWith<$Res> {
  __$$CharacterEntryReferenceImplCopyWithImpl(
    _$CharacterEntryReferenceImpl _value,
    $Res Function(_$CharacterEntryReferenceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CharacterEntryReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? type = null,
    Object? limitMode = null,
  }) {
    return _then(
      _$CharacterEntryReferenceImpl(
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ReferenceType,
        limitMode: null == limitMode
            ? _value.limitMode
            : limitMode // ignore: cast_nullable_to_non_nullable
                  as LimitMode,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterEntryReferenceImpl implements _CharacterEntryReference {
  const _$CharacterEntryReferenceImpl({
    this.text,
    this.type = ReferenceType.other,
    this.limitMode = LimitMode.assistive,
  });

  factory _$CharacterEntryReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterEntryReferenceImplFromJson(json);

  @override
  final String? text;
  @override
  @JsonKey()
  final ReferenceType type;
  @override
  @JsonKey()
  final LimitMode limitMode;

  @override
  String toString() {
    return 'CharacterEntryReference(text: $text, type: $type, limitMode: $limitMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterEntryReferenceImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.limitMode, limitMode) ||
                other.limitMode == limitMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, type, limitMode);

  /// Create a copy of CharacterEntryReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterEntryReferenceImplCopyWith<_$CharacterEntryReferenceImpl>
  get copyWith =>
      __$$CharacterEntryReferenceImplCopyWithImpl<
        _$CharacterEntryReferenceImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterEntryReferenceImplToJson(this);
  }
}

abstract class _CharacterEntryReference implements CharacterEntryReference {
  const factory _CharacterEntryReference({
    final String? text,
    final ReferenceType type,
    final LimitMode limitMode,
  }) = _$CharacterEntryReferenceImpl;

  factory _CharacterEntryReference.fromJson(Map<String, dynamic> json) =
      _$CharacterEntryReferenceImpl.fromJson;

  @override
  String? get text;
  @override
  ReferenceType get type;
  @override
  LimitMode get limitMode;

  /// Create a copy of CharacterEntryReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterEntryReferenceImplCopyWith<_$CharacterEntryReferenceImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return _Character.fromJson(json);
}

/// @nodoc
mixin _$Character {
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get canonHint => throw _privateConstructorUsedError;

  /// Optional reference for disambiguation (e.g., "Yes Man", "Saat Khoon Maaf")
  CharacterEntryReference? get entryReference =>
      throw _privateConstructorUsedError;

  /// Serializes this Character to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterCopyWith<Character> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) then) =
      _$CharacterCopyWithImpl<$Res, Character>;
  @useResult
  $Res call({
    String id,
    String displayName,
    String? canonHint,
    CharacterEntryReference? entryReference,
  });

  $CharacterEntryReferenceCopyWith<$Res>? get entryReference;
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res, $Val extends Character>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? canonHint = freezed,
    Object? entryReference = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            canonHint: freezed == canonHint
                ? _value.canonHint
                : canonHint // ignore: cast_nullable_to_non_nullable
                      as String?,
            entryReference: freezed == entryReference
                ? _value.entryReference
                : entryReference // ignore: cast_nullable_to_non_nullable
                      as CharacterEntryReference?,
          )
          as $Val,
    );
  }

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterEntryReferenceCopyWith<$Res>? get entryReference {
    if (_value.entryReference == null) {
      return null;
    }

    return $CharacterEntryReferenceCopyWith<$Res>(_value.entryReference!, (
      value,
    ) {
      return _then(_value.copyWith(entryReference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterImplCopyWith<$Res>
    implements $CharacterCopyWith<$Res> {
  factory _$$CharacterImplCopyWith(
    _$CharacterImpl value,
    $Res Function(_$CharacterImpl) then,
  ) = __$$CharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String displayName,
    String? canonHint,
    CharacterEntryReference? entryReference,
  });

  @override
  $CharacterEntryReferenceCopyWith<$Res>? get entryReference;
}

/// @nodoc
class __$$CharacterImplCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$CharacterImpl>
    implements _$$CharacterImplCopyWith<$Res> {
  __$$CharacterImplCopyWithImpl(
    _$CharacterImpl _value,
    $Res Function(_$CharacterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? canonHint = freezed,
    Object? entryReference = freezed,
  }) {
    return _then(
      _$CharacterImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        canonHint: freezed == canonHint
            ? _value.canonHint
            : canonHint // ignore: cast_nullable_to_non_nullable
                  as String?,
        entryReference: freezed == entryReference
            ? _value.entryReference
            : entryReference // ignore: cast_nullable_to_non_nullable
                  as CharacterEntryReference?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterImpl implements _Character {
  const _$CharacterImpl({
    required this.id,
    required this.displayName,
    this.canonHint,
    this.entryReference,
  });

  factory _$CharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterImplFromJson(json);

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String? canonHint;

  /// Optional reference for disambiguation (e.g., "Yes Man", "Saat Khoon Maaf")
  @override
  final CharacterEntryReference? entryReference;

  @override
  String toString() {
    return 'Character(id: $id, displayName: $displayName, canonHint: $canonHint, entryReference: $entryReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.canonHint, canonHint) ||
                other.canonHint == canonHint) &&
            (identical(other.entryReference, entryReference) ||
                other.entryReference == entryReference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, displayName, canonHint, entryReference);

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      __$$CharacterImplCopyWithImpl<_$CharacterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterImplToJson(this);
  }
}

abstract class _Character implements Character {
  const factory _Character({
    required final String id,
    required final String displayName,
    final String? canonHint,
    final CharacterEntryReference? entryReference,
  }) = _$CharacterImpl;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$CharacterImpl.fromJson;

  @override
  String get id;
  @override
  String get displayName;
  @override
  String? get canonHint;

  /// Optional reference for disambiguation (e.g., "Yes Man", "Saat Khoon Maaf")
  @override
  CharacterEntryReference? get entryReference;

  /// Create a copy of Character
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterImplCopyWith<_$CharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
