// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resonance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VersionOption _$VersionOptionFromJson(Map<String, dynamic> json) {
  return _VersionOption.fromJson(json);
}

/// @nodoc
mixin _$VersionOption {
  String get versionId => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get cue => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this VersionOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VersionOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VersionOptionCopyWith<VersionOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionOptionCopyWith<$Res> {
  factory $VersionOptionCopyWith(
    VersionOption value,
    $Res Function(VersionOption) then,
  ) = _$VersionOptionCopyWithImpl<$Res, VersionOption>;
  @useResult
  $Res call({
    String versionId,
    String label,
    String cue,
    List<String> tags,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$VersionOptionCopyWithImpl<$Res, $Val extends VersionOption>
    implements $VersionOptionCopyWith<$Res> {
  _$VersionOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VersionOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionId = null,
    Object? label = null,
    Object? cue = null,
    Object? tags = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            versionId: null == versionId
                ? _value.versionId
                : versionId // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            cue: null == cue
                ? _value.cue
                : cue // ignore: cast_nullable_to_non_nullable
                      as String,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            exampleRefs: null == exampleRefs
                ? _value.exampleRefs
                : exampleRefs // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VersionOptionImplCopyWith<$Res>
    implements $VersionOptionCopyWith<$Res> {
  factory _$$VersionOptionImplCopyWith(
    _$VersionOptionImpl value,
    $Res Function(_$VersionOptionImpl) then,
  ) = __$$VersionOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String versionId,
    String label,
    String cue,
    List<String> tags,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$VersionOptionImplCopyWithImpl<$Res>
    extends _$VersionOptionCopyWithImpl<$Res, _$VersionOptionImpl>
    implements _$$VersionOptionImplCopyWith<$Res> {
  __$$VersionOptionImplCopyWithImpl(
    _$VersionOptionImpl _value,
    $Res Function(_$VersionOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VersionOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versionId = null,
    Object? label = null,
    Object? cue = null,
    Object? tags = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$VersionOptionImpl(
        versionId: null == versionId
            ? _value.versionId
            : versionId // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        cue: null == cue
            ? _value.cue
            : cue // ignore: cast_nullable_to_non_nullable
                  as String,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        exampleRefs: null == exampleRefs
            ? _value._exampleRefs
            : exampleRefs // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VersionOptionImpl implements _VersionOption {
  const _$VersionOptionImpl({
    required this.versionId,
    required this.label,
    required this.cue,
    final List<String> tags = const [],
    final List<String> exampleRefs = const [],
  }) : _tags = tags,
       _exampleRefs = exampleRefs;

  factory _$VersionOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$VersionOptionImplFromJson(json);

  @override
  final String versionId;
  @override
  final String label;
  @override
  final String cue;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _exampleRefs;
  @override
  @JsonKey()
  List<String> get exampleRefs {
    if (_exampleRefs is EqualUnmodifiableListView) return _exampleRefs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exampleRefs);
  }

  @override
  String toString() {
    return 'VersionOption(versionId: $versionId, label: $label, cue: $cue, tags: $tags, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionOptionImpl &&
            (identical(other.versionId, versionId) ||
                other.versionId == versionId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.cue, cue) || other.cue == cue) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    versionId,
    label,
    cue,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of VersionOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionOptionImplCopyWith<_$VersionOptionImpl> get copyWith =>
      __$$VersionOptionImplCopyWithImpl<_$VersionOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionOptionImplToJson(this);
  }
}

abstract class _VersionOption implements VersionOption {
  const factory _VersionOption({
    required final String versionId,
    required final String label,
    required final String cue,
    final List<String> tags,
    final List<String> exampleRefs,
  }) = _$VersionOptionImpl;

  factory _VersionOption.fromJson(Map<String, dynamic> json) =
      _$VersionOptionImpl.fromJson;

  @override
  String get versionId;
  @override
  String get label;
  @override
  String get cue;
  @override
  List<String> get tags;
  @override
  List<String> get exampleRefs;

  /// Create a copy of VersionOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VersionOptionImplCopyWith<_$VersionOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhaseOption _$PhaseOptionFromJson(Map<String, dynamic> json) {
  return _PhaseOption.fromJson(json);
}

/// @nodoc
mixin _$PhaseOption {
  String get phaseId => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get cue => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Whether this phase can be excluded (for negative arc exclusion)
  bool get excludable => throw _privateConstructorUsedError;

  /// Serializes this PhaseOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhaseOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhaseOptionCopyWith<PhaseOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhaseOptionCopyWith<$Res> {
  factory $PhaseOptionCopyWith(
    PhaseOption value,
    $Res Function(PhaseOption) then,
  ) = _$PhaseOptionCopyWithImpl<$Res, PhaseOption>;
  @useResult
  $Res call({
    String phaseId,
    String label,
    String cue,
    List<String> tags,
    List<String> exampleRefs,
    bool excludable,
  });
}

/// @nodoc
class _$PhaseOptionCopyWithImpl<$Res, $Val extends PhaseOption>
    implements $PhaseOptionCopyWith<$Res> {
  _$PhaseOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhaseOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phaseId = null,
    Object? label = null,
    Object? cue = null,
    Object? tags = null,
    Object? exampleRefs = null,
    Object? excludable = null,
  }) {
    return _then(
      _value.copyWith(
            phaseId: null == phaseId
                ? _value.phaseId
                : phaseId // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            cue: null == cue
                ? _value.cue
                : cue // ignore: cast_nullable_to_non_nullable
                      as String,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            exampleRefs: null == exampleRefs
                ? _value.exampleRefs
                : exampleRefs // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            excludable: null == excludable
                ? _value.excludable
                : excludable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PhaseOptionImplCopyWith<$Res>
    implements $PhaseOptionCopyWith<$Res> {
  factory _$$PhaseOptionImplCopyWith(
    _$PhaseOptionImpl value,
    $Res Function(_$PhaseOptionImpl) then,
  ) = __$$PhaseOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String phaseId,
    String label,
    String cue,
    List<String> tags,
    List<String> exampleRefs,
    bool excludable,
  });
}

/// @nodoc
class __$$PhaseOptionImplCopyWithImpl<$Res>
    extends _$PhaseOptionCopyWithImpl<$Res, _$PhaseOptionImpl>
    implements _$$PhaseOptionImplCopyWith<$Res> {
  __$$PhaseOptionImplCopyWithImpl(
    _$PhaseOptionImpl _value,
    $Res Function(_$PhaseOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PhaseOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phaseId = null,
    Object? label = null,
    Object? cue = null,
    Object? tags = null,
    Object? exampleRefs = null,
    Object? excludable = null,
  }) {
    return _then(
      _$PhaseOptionImpl(
        phaseId: null == phaseId
            ? _value.phaseId
            : phaseId // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        cue: null == cue
            ? _value.cue
            : cue // ignore: cast_nullable_to_non_nullable
                  as String,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        exampleRefs: null == exampleRefs
            ? _value._exampleRefs
            : exampleRefs // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        excludable: null == excludable
            ? _value.excludable
            : excludable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PhaseOptionImpl implements _PhaseOption {
  const _$PhaseOptionImpl({
    required this.phaseId,
    required this.label,
    required this.cue,
    final List<String> tags = const [],
    final List<String> exampleRefs = const [],
    this.excludable = true,
  }) : _tags = tags,
       _exampleRefs = exampleRefs;

  factory _$PhaseOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhaseOptionImplFromJson(json);

  @override
  final String phaseId;
  @override
  final String label;
  @override
  final String cue;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _exampleRefs;
  @override
  @JsonKey()
  List<String> get exampleRefs {
    if (_exampleRefs is EqualUnmodifiableListView) return _exampleRefs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exampleRefs);
  }

  /// Whether this phase can be excluded (for negative arc exclusion)
  @override
  @JsonKey()
  final bool excludable;

  @override
  String toString() {
    return 'PhaseOption(phaseId: $phaseId, label: $label, cue: $cue, tags: $tags, exampleRefs: $exampleRefs, excludable: $excludable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhaseOptionImpl &&
            (identical(other.phaseId, phaseId) || other.phaseId == phaseId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.cue, cue) || other.cue == cue) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ) &&
            (identical(other.excludable, excludable) ||
                other.excludable == excludable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    phaseId,
    label,
    cue,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_exampleRefs),
    excludable,
  );

  /// Create a copy of PhaseOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhaseOptionImplCopyWith<_$PhaseOptionImpl> get copyWith =>
      __$$PhaseOptionImplCopyWithImpl<_$PhaseOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhaseOptionImplToJson(this);
  }
}

abstract class _PhaseOption implements PhaseOption {
  const factory _PhaseOption({
    required final String phaseId,
    required final String label,
    required final String cue,
    final List<String> tags,
    final List<String> exampleRefs,
    final bool excludable,
  }) = _$PhaseOptionImpl;

  factory _PhaseOption.fromJson(Map<String, dynamic> json) =
      _$PhaseOptionImpl.fromJson;

  @override
  String get phaseId;
  @override
  String get label;
  @override
  String get cue;
  @override
  List<String> get tags;
  @override
  List<String> get exampleRefs;

  /// Whether this phase can be excluded (for negative arc exclusion)
  @override
  bool get excludable;

  /// Create a copy of PhaseOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhaseOptionImplCopyWith<_$PhaseOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CharacterReference _$CharacterReferenceFromJson(Map<String, dynamic> json) {
  return _CharacterReference.fromJson(json);
}

/// @nodoc
mixin _$CharacterReference {
  ReferenceMode get mode => throw _privateConstructorUsedError;
  String? get versionId => throw _privateConstructorUsedError;
  String? get phaseId => throw _privateConstructorUsedError;

  /// Explicitly excluded phase IDs (negative arc exclusion)
  List<String> get excludedPhaseIds => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  /// Serializes this CharacterReference to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterReferenceCopyWith<CharacterReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterReferenceCopyWith<$Res> {
  factory $CharacterReferenceCopyWith(
    CharacterReference value,
    $Res Function(CharacterReference) then,
  ) = _$CharacterReferenceCopyWithImpl<$Res, CharacterReference>;
  @useResult
  $Res call({
    ReferenceMode mode,
    String? versionId,
    String? phaseId,
    List<String> excludedPhaseIds,
    List<String> tags,
    String? text,
  });
}

/// @nodoc
class _$CharacterReferenceCopyWithImpl<$Res, $Val extends CharacterReference>
    implements $CharacterReferenceCopyWith<$Res> {
  _$CharacterReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? versionId = freezed,
    Object? phaseId = freezed,
    Object? excludedPhaseIds = null,
    Object? tags = null,
    Object? text = freezed,
  }) {
    return _then(
      _value.copyWith(
            mode: null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as ReferenceMode,
            versionId: freezed == versionId
                ? _value.versionId
                : versionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            phaseId: freezed == phaseId
                ? _value.phaseId
                : phaseId // ignore: cast_nullable_to_non_nullable
                      as String?,
            excludedPhaseIds: null == excludedPhaseIds
                ? _value.excludedPhaseIds
                : excludedPhaseIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CharacterReferenceImplCopyWith<$Res>
    implements $CharacterReferenceCopyWith<$Res> {
  factory _$$CharacterReferenceImplCopyWith(
    _$CharacterReferenceImpl value,
    $Res Function(_$CharacterReferenceImpl) then,
  ) = __$$CharacterReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ReferenceMode mode,
    String? versionId,
    String? phaseId,
    List<String> excludedPhaseIds,
    List<String> tags,
    String? text,
  });
}

/// @nodoc
class __$$CharacterReferenceImplCopyWithImpl<$Res>
    extends _$CharacterReferenceCopyWithImpl<$Res, _$CharacterReferenceImpl>
    implements _$$CharacterReferenceImplCopyWith<$Res> {
  __$$CharacterReferenceImplCopyWithImpl(
    _$CharacterReferenceImpl _value,
    $Res Function(_$CharacterReferenceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CharacterReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? versionId = freezed,
    Object? phaseId = freezed,
    Object? excludedPhaseIds = null,
    Object? tags = null,
    Object? text = freezed,
  }) {
    return _then(
      _$CharacterReferenceImpl(
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as ReferenceMode,
        versionId: freezed == versionId
            ? _value.versionId
            : versionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        phaseId: freezed == phaseId
            ? _value.phaseId
            : phaseId // ignore: cast_nullable_to_non_nullable
                  as String?,
        excludedPhaseIds: null == excludedPhaseIds
            ? _value._excludedPhaseIds
            : excludedPhaseIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterReferenceImpl implements _CharacterReference {
  const _$CharacterReferenceImpl({
    this.mode = ReferenceMode.none,
    this.versionId,
    this.phaseId,
    final List<String> excludedPhaseIds = const [],
    final List<String> tags = const [],
    this.text,
  }) : _excludedPhaseIds = excludedPhaseIds,
       _tags = tags;

  factory _$CharacterReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterReferenceImplFromJson(json);

  @override
  @JsonKey()
  final ReferenceMode mode;
  @override
  final String? versionId;
  @override
  final String? phaseId;

  /// Explicitly excluded phase IDs (negative arc exclusion)
  final List<String> _excludedPhaseIds;

  /// Explicitly excluded phase IDs (negative arc exclusion)
  @override
  @JsonKey()
  List<String> get excludedPhaseIds {
    if (_excludedPhaseIds is EqualUnmodifiableListView)
      return _excludedPhaseIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedPhaseIds);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? text;

  @override
  String toString() {
    return 'CharacterReference(mode: $mode, versionId: $versionId, phaseId: $phaseId, excludedPhaseIds: $excludedPhaseIds, tags: $tags, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterReferenceImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.versionId, versionId) ||
                other.versionId == versionId) &&
            (identical(other.phaseId, phaseId) || other.phaseId == phaseId) &&
            const DeepCollectionEquality().equals(
              other._excludedPhaseIds,
              _excludedPhaseIds,
            ) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mode,
    versionId,
    phaseId,
    const DeepCollectionEquality().hash(_excludedPhaseIds),
    const DeepCollectionEquality().hash(_tags),
    text,
  );

  /// Create a copy of CharacterReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterReferenceImplCopyWith<_$CharacterReferenceImpl> get copyWith =>
      __$$CharacterReferenceImplCopyWithImpl<_$CharacterReferenceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterReferenceImplToJson(this);
  }
}

abstract class _CharacterReference implements CharacterReference {
  const factory _CharacterReference({
    final ReferenceMode mode,
    final String? versionId,
    final String? phaseId,
    final List<String> excludedPhaseIds,
    final List<String> tags,
    final String? text,
  }) = _$CharacterReferenceImpl;

  factory _CharacterReference.fromJson(Map<String, dynamic> json) =
      _$CharacterReferenceImpl.fromJson;

  @override
  ReferenceMode get mode;
  @override
  String? get versionId;
  @override
  String? get phaseId;

  /// Explicitly excluded phase IDs (negative arc exclusion)
  @override
  List<String> get excludedPhaseIds;
  @override
  List<String> get tags;
  @override
  String? get text;

  /// Create a copy of CharacterReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterReferenceImplCopyWith<_$CharacterReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResonanceInput _$ResonanceInputFromJson(Map<String, dynamic> json) {
  return _ResonanceInput.fromJson(json);
}

/// @nodoc
mixin _$ResonanceInput {
  /// What the user connects with (positive resonance)
  String? get positiveText => throw _privateConstructorUsedError;

  /// What the user doesn't connect with (negative resonance)
  String? get negativeText => throw _privateConstructorUsedError;

  /// Specific moment they identify with
  String? get anchorMoment => throw _privateConstructorUsedError;

  /// What they admire
  String? get admire => throw _privateConstructorUsedError;

  /// What they reject
  String? get reject => throw _privateConstructorUsedError;

  /// Serializes this ResonanceInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResonanceInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResonanceInputCopyWith<ResonanceInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResonanceInputCopyWith<$Res> {
  factory $ResonanceInputCopyWith(
    ResonanceInput value,
    $Res Function(ResonanceInput) then,
  ) = _$ResonanceInputCopyWithImpl<$Res, ResonanceInput>;
  @useResult
  $Res call({
    String? positiveText,
    String? negativeText,
    String? anchorMoment,
    String? admire,
    String? reject,
  });
}

/// @nodoc
class _$ResonanceInputCopyWithImpl<$Res, $Val extends ResonanceInput>
    implements $ResonanceInputCopyWith<$Res> {
  _$ResonanceInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResonanceInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positiveText = freezed,
    Object? negativeText = freezed,
    Object? anchorMoment = freezed,
    Object? admire = freezed,
    Object? reject = freezed,
  }) {
    return _then(
      _value.copyWith(
            positiveText: freezed == positiveText
                ? _value.positiveText
                : positiveText // ignore: cast_nullable_to_non_nullable
                      as String?,
            negativeText: freezed == negativeText
                ? _value.negativeText
                : negativeText // ignore: cast_nullable_to_non_nullable
                      as String?,
            anchorMoment: freezed == anchorMoment
                ? _value.anchorMoment
                : anchorMoment // ignore: cast_nullable_to_non_nullable
                      as String?,
            admire: freezed == admire
                ? _value.admire
                : admire // ignore: cast_nullable_to_non_nullable
                      as String?,
            reject: freezed == reject
                ? _value.reject
                : reject // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResonanceInputImplCopyWith<$Res>
    implements $ResonanceInputCopyWith<$Res> {
  factory _$$ResonanceInputImplCopyWith(
    _$ResonanceInputImpl value,
    $Res Function(_$ResonanceInputImpl) then,
  ) = __$$ResonanceInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? positiveText,
    String? negativeText,
    String? anchorMoment,
    String? admire,
    String? reject,
  });
}

/// @nodoc
class __$$ResonanceInputImplCopyWithImpl<$Res>
    extends _$ResonanceInputCopyWithImpl<$Res, _$ResonanceInputImpl>
    implements _$$ResonanceInputImplCopyWith<$Res> {
  __$$ResonanceInputImplCopyWithImpl(
    _$ResonanceInputImpl _value,
    $Res Function(_$ResonanceInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResonanceInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positiveText = freezed,
    Object? negativeText = freezed,
    Object? anchorMoment = freezed,
    Object? admire = freezed,
    Object? reject = freezed,
  }) {
    return _then(
      _$ResonanceInputImpl(
        positiveText: freezed == positiveText
            ? _value.positiveText
            : positiveText // ignore: cast_nullable_to_non_nullable
                  as String?,
        negativeText: freezed == negativeText
            ? _value.negativeText
            : negativeText // ignore: cast_nullable_to_non_nullable
                  as String?,
        anchorMoment: freezed == anchorMoment
            ? _value.anchorMoment
            : anchorMoment // ignore: cast_nullable_to_non_nullable
                  as String?,
        admire: freezed == admire
            ? _value.admire
            : admire // ignore: cast_nullable_to_non_nullable
                  as String?,
        reject: freezed == reject
            ? _value.reject
            : reject // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResonanceInputImpl implements _ResonanceInput {
  const _$ResonanceInputImpl({
    this.positiveText,
    this.negativeText,
    this.anchorMoment,
    this.admire,
    this.reject,
  });

  factory _$ResonanceInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResonanceInputImplFromJson(json);

  /// What the user connects with (positive resonance)
  @override
  final String? positiveText;

  /// What the user doesn't connect with (negative resonance)
  @override
  final String? negativeText;

  /// Specific moment they identify with
  @override
  final String? anchorMoment;

  /// What they admire
  @override
  final String? admire;

  /// What they reject
  @override
  final String? reject;

  @override
  String toString() {
    return 'ResonanceInput(positiveText: $positiveText, negativeText: $negativeText, anchorMoment: $anchorMoment, admire: $admire, reject: $reject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResonanceInputImpl &&
            (identical(other.positiveText, positiveText) ||
                other.positiveText == positiveText) &&
            (identical(other.negativeText, negativeText) ||
                other.negativeText == negativeText) &&
            (identical(other.anchorMoment, anchorMoment) ||
                other.anchorMoment == anchorMoment) &&
            (identical(other.admire, admire) || other.admire == admire) &&
            (identical(other.reject, reject) || other.reject == reject));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    positiveText,
    negativeText,
    anchorMoment,
    admire,
    reject,
  );

  /// Create a copy of ResonanceInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResonanceInputImplCopyWith<_$ResonanceInputImpl> get copyWith =>
      __$$ResonanceInputImplCopyWithImpl<_$ResonanceInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResonanceInputImplToJson(this);
  }
}

abstract class _ResonanceInput implements ResonanceInput {
  const factory _ResonanceInput({
    final String? positiveText,
    final String? negativeText,
    final String? anchorMoment,
    final String? admire,
    final String? reject,
  }) = _$ResonanceInputImpl;

  factory _ResonanceInput.fromJson(Map<String, dynamic> json) =
      _$ResonanceInputImpl.fromJson;

  /// What the user connects with (positive resonance)
  @override
  String? get positiveText;

  /// What the user doesn't connect with (negative resonance)
  @override
  String? get negativeText;

  /// Specific moment they identify with
  @override
  String? get anchorMoment;

  /// What they admire
  @override
  String? get admire;

  /// What they reject
  @override
  String? get reject;

  /// Create a copy of ResonanceInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResonanceInputImplCopyWith<_$ResonanceInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CharacterAmbiguityAnalysis _$CharacterAmbiguityAnalysisFromJson(
  Map<String, dynamic> json,
) {
  return _CharacterAmbiguityAnalysis.fromJson(json);
}

/// @nodoc
mixin _$CharacterAmbiguityAnalysis {
  String get input => throw _privateConstructorUsedError;
  String? get characterName => throw _privateConstructorUsedError;
  String? get canonicalId =>
      throw _privateConstructorUsedError; // Character identification reference (always shown to user)
  String? get franchise => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  String? get referenceDescription => throw _privateConstructorUsedError;
  bool get needsClarification => throw _privateConstructorUsedError;
  String? get disambiguationReason => throw _privateConstructorUsedError;

  /// User-friendly message explaining why clarification is needed
  String? get clarificationMessage => throw _privateConstructorUsedError;

  /// AI specifically requested clarification for this character
  bool get aiNeedsClarification => throw _privateConstructorUsedError;

  /// True if the input was detected as an actor name
  bool get inputWasActor =>
      throw _privateConstructorUsedError; // Concrete version options with labels and cues
  List<VersionOption> get versionOptions =>
      throw _privateConstructorUsedError; // Concrete phase options with labels and cues
  List<PhaseOption> get phaseOptions =>
      throw _privateConstructorUsedError; // Whether to show arc exclusion section (true if >1 phases or polarized character)
  bool get showExclusionSection =>
      throw _privateConstructorUsedError; // User's selection (to be filled in)
  CharacterReference? get selectedReference =>
      throw _privateConstructorUsedError; // Entry reference info (from Character Entry page)
  bool get hasEntryReference => throw _privateConstructorUsedError;
  String? get entryReferenceText => throw _privateConstructorUsedError;

  /// True if top match doesn't align with user's entry reference
  bool get entryReferenceMismatch => throw _privateConstructorUsedError;

  /// Message explaining the mismatch
  String? get entryReferenceMismatchMessage =>
      throw _privateConstructorUsedError;

  /// Alternative candidates that match the reference
  List<AlternativeCandidate> get alternativeCandidates =>
      throw _privateConstructorUsedError;

  /// Serializes this CharacterAmbiguityAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CharacterAmbiguityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CharacterAmbiguityAnalysisCopyWith<CharacterAmbiguityAnalysis>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterAmbiguityAnalysisCopyWith<$Res> {
  factory $CharacterAmbiguityAnalysisCopyWith(
    CharacterAmbiguityAnalysis value,
    $Res Function(CharacterAmbiguityAnalysis) then,
  ) =
      _$CharacterAmbiguityAnalysisCopyWithImpl<
        $Res,
        CharacterAmbiguityAnalysis
      >;
  @useResult
  $Res call({
    String input,
    String? characterName,
    String? canonicalId,
    String? franchise,
    String? medium,
    String? referenceDescription,
    bool needsClarification,
    String? disambiguationReason,
    String? clarificationMessage,
    bool aiNeedsClarification,
    bool inputWasActor,
    List<VersionOption> versionOptions,
    List<PhaseOption> phaseOptions,
    bool showExclusionSection,
    CharacterReference? selectedReference,
    bool hasEntryReference,
    String? entryReferenceText,
    bool entryReferenceMismatch,
    String? entryReferenceMismatchMessage,
    List<AlternativeCandidate> alternativeCandidates,
  });

  $CharacterReferenceCopyWith<$Res>? get selectedReference;
}

/// @nodoc
class _$CharacterAmbiguityAnalysisCopyWithImpl<
  $Res,
  $Val extends CharacterAmbiguityAnalysis
>
    implements $CharacterAmbiguityAnalysisCopyWith<$Res> {
  _$CharacterAmbiguityAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterAmbiguityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? characterName = freezed,
    Object? canonicalId = freezed,
    Object? franchise = freezed,
    Object? medium = freezed,
    Object? referenceDescription = freezed,
    Object? needsClarification = null,
    Object? disambiguationReason = freezed,
    Object? clarificationMessage = freezed,
    Object? aiNeedsClarification = null,
    Object? inputWasActor = null,
    Object? versionOptions = null,
    Object? phaseOptions = null,
    Object? showExclusionSection = null,
    Object? selectedReference = freezed,
    Object? hasEntryReference = null,
    Object? entryReferenceText = freezed,
    Object? entryReferenceMismatch = null,
    Object? entryReferenceMismatchMessage = freezed,
    Object? alternativeCandidates = null,
  }) {
    return _then(
      _value.copyWith(
            input: null == input
                ? _value.input
                : input // ignore: cast_nullable_to_non_nullable
                      as String,
            characterName: freezed == characterName
                ? _value.characterName
                : characterName // ignore: cast_nullable_to_non_nullable
                      as String?,
            canonicalId: freezed == canonicalId
                ? _value.canonicalId
                : canonicalId // ignore: cast_nullable_to_non_nullable
                      as String?,
            franchise: freezed == franchise
                ? _value.franchise
                : franchise // ignore: cast_nullable_to_non_nullable
                      as String?,
            medium: freezed == medium
                ? _value.medium
                : medium // ignore: cast_nullable_to_non_nullable
                      as String?,
            referenceDescription: freezed == referenceDescription
                ? _value.referenceDescription
                : referenceDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            needsClarification: null == needsClarification
                ? _value.needsClarification
                : needsClarification // ignore: cast_nullable_to_non_nullable
                      as bool,
            disambiguationReason: freezed == disambiguationReason
                ? _value.disambiguationReason
                : disambiguationReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            clarificationMessage: freezed == clarificationMessage
                ? _value.clarificationMessage
                : clarificationMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            aiNeedsClarification: null == aiNeedsClarification
                ? _value.aiNeedsClarification
                : aiNeedsClarification // ignore: cast_nullable_to_non_nullable
                      as bool,
            inputWasActor: null == inputWasActor
                ? _value.inputWasActor
                : inputWasActor // ignore: cast_nullable_to_non_nullable
                      as bool,
            versionOptions: null == versionOptions
                ? _value.versionOptions
                : versionOptions // ignore: cast_nullable_to_non_nullable
                      as List<VersionOption>,
            phaseOptions: null == phaseOptions
                ? _value.phaseOptions
                : phaseOptions // ignore: cast_nullable_to_non_nullable
                      as List<PhaseOption>,
            showExclusionSection: null == showExclusionSection
                ? _value.showExclusionSection
                : showExclusionSection // ignore: cast_nullable_to_non_nullable
                      as bool,
            selectedReference: freezed == selectedReference
                ? _value.selectedReference
                : selectedReference // ignore: cast_nullable_to_non_nullable
                      as CharacterReference?,
            hasEntryReference: null == hasEntryReference
                ? _value.hasEntryReference
                : hasEntryReference // ignore: cast_nullable_to_non_nullable
                      as bool,
            entryReferenceText: freezed == entryReferenceText
                ? _value.entryReferenceText
                : entryReferenceText // ignore: cast_nullable_to_non_nullable
                      as String?,
            entryReferenceMismatch: null == entryReferenceMismatch
                ? _value.entryReferenceMismatch
                : entryReferenceMismatch // ignore: cast_nullable_to_non_nullable
                      as bool,
            entryReferenceMismatchMessage:
                freezed == entryReferenceMismatchMessage
                ? _value.entryReferenceMismatchMessage
                : entryReferenceMismatchMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            alternativeCandidates: null == alternativeCandidates
                ? _value.alternativeCandidates
                : alternativeCandidates // ignore: cast_nullable_to_non_nullable
                      as List<AlternativeCandidate>,
          )
          as $Val,
    );
  }

  /// Create a copy of CharacterAmbiguityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterReferenceCopyWith<$Res>? get selectedReference {
    if (_value.selectedReference == null) {
      return null;
    }

    return $CharacterReferenceCopyWith<$Res>(_value.selectedReference!, (
      value,
    ) {
      return _then(_value.copyWith(selectedReference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterAmbiguityAnalysisImplCopyWith<$Res>
    implements $CharacterAmbiguityAnalysisCopyWith<$Res> {
  factory _$$CharacterAmbiguityAnalysisImplCopyWith(
    _$CharacterAmbiguityAnalysisImpl value,
    $Res Function(_$CharacterAmbiguityAnalysisImpl) then,
  ) = __$$CharacterAmbiguityAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String input,
    String? characterName,
    String? canonicalId,
    String? franchise,
    String? medium,
    String? referenceDescription,
    bool needsClarification,
    String? disambiguationReason,
    String? clarificationMessage,
    bool aiNeedsClarification,
    bool inputWasActor,
    List<VersionOption> versionOptions,
    List<PhaseOption> phaseOptions,
    bool showExclusionSection,
    CharacterReference? selectedReference,
    bool hasEntryReference,
    String? entryReferenceText,
    bool entryReferenceMismatch,
    String? entryReferenceMismatchMessage,
    List<AlternativeCandidate> alternativeCandidates,
  });

  @override
  $CharacterReferenceCopyWith<$Res>? get selectedReference;
}

/// @nodoc
class __$$CharacterAmbiguityAnalysisImplCopyWithImpl<$Res>
    extends
        _$CharacterAmbiguityAnalysisCopyWithImpl<
          $Res,
          _$CharacterAmbiguityAnalysisImpl
        >
    implements _$$CharacterAmbiguityAnalysisImplCopyWith<$Res> {
  __$$CharacterAmbiguityAnalysisImplCopyWithImpl(
    _$CharacterAmbiguityAnalysisImpl _value,
    $Res Function(_$CharacterAmbiguityAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CharacterAmbiguityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? characterName = freezed,
    Object? canonicalId = freezed,
    Object? franchise = freezed,
    Object? medium = freezed,
    Object? referenceDescription = freezed,
    Object? needsClarification = null,
    Object? disambiguationReason = freezed,
    Object? clarificationMessage = freezed,
    Object? aiNeedsClarification = null,
    Object? inputWasActor = null,
    Object? versionOptions = null,
    Object? phaseOptions = null,
    Object? showExclusionSection = null,
    Object? selectedReference = freezed,
    Object? hasEntryReference = null,
    Object? entryReferenceText = freezed,
    Object? entryReferenceMismatch = null,
    Object? entryReferenceMismatchMessage = freezed,
    Object? alternativeCandidates = null,
  }) {
    return _then(
      _$CharacterAmbiguityAnalysisImpl(
        input: null == input
            ? _value.input
            : input // ignore: cast_nullable_to_non_nullable
                  as String,
        characterName: freezed == characterName
            ? _value.characterName
            : characterName // ignore: cast_nullable_to_non_nullable
                  as String?,
        canonicalId: freezed == canonicalId
            ? _value.canonicalId
            : canonicalId // ignore: cast_nullable_to_non_nullable
                  as String?,
        franchise: freezed == franchise
            ? _value.franchise
            : franchise // ignore: cast_nullable_to_non_nullable
                  as String?,
        medium: freezed == medium
            ? _value.medium
            : medium // ignore: cast_nullable_to_non_nullable
                  as String?,
        referenceDescription: freezed == referenceDescription
            ? _value.referenceDescription
            : referenceDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        needsClarification: null == needsClarification
            ? _value.needsClarification
            : needsClarification // ignore: cast_nullable_to_non_nullable
                  as bool,
        disambiguationReason: freezed == disambiguationReason
            ? _value.disambiguationReason
            : disambiguationReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        clarificationMessage: freezed == clarificationMessage
            ? _value.clarificationMessage
            : clarificationMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        aiNeedsClarification: null == aiNeedsClarification
            ? _value.aiNeedsClarification
            : aiNeedsClarification // ignore: cast_nullable_to_non_nullable
                  as bool,
        inputWasActor: null == inputWasActor
            ? _value.inputWasActor
            : inputWasActor // ignore: cast_nullable_to_non_nullable
                  as bool,
        versionOptions: null == versionOptions
            ? _value._versionOptions
            : versionOptions // ignore: cast_nullable_to_non_nullable
                  as List<VersionOption>,
        phaseOptions: null == phaseOptions
            ? _value._phaseOptions
            : phaseOptions // ignore: cast_nullable_to_non_nullable
                  as List<PhaseOption>,
        showExclusionSection: null == showExclusionSection
            ? _value.showExclusionSection
            : showExclusionSection // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedReference: freezed == selectedReference
            ? _value.selectedReference
            : selectedReference // ignore: cast_nullable_to_non_nullable
                  as CharacterReference?,
        hasEntryReference: null == hasEntryReference
            ? _value.hasEntryReference
            : hasEntryReference // ignore: cast_nullable_to_non_nullable
                  as bool,
        entryReferenceText: freezed == entryReferenceText
            ? _value.entryReferenceText
            : entryReferenceText // ignore: cast_nullable_to_non_nullable
                  as String?,
        entryReferenceMismatch: null == entryReferenceMismatch
            ? _value.entryReferenceMismatch
            : entryReferenceMismatch // ignore: cast_nullable_to_non_nullable
                  as bool,
        entryReferenceMismatchMessage: freezed == entryReferenceMismatchMessage
            ? _value.entryReferenceMismatchMessage
            : entryReferenceMismatchMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        alternativeCandidates: null == alternativeCandidates
            ? _value._alternativeCandidates
            : alternativeCandidates // ignore: cast_nullable_to_non_nullable
                  as List<AlternativeCandidate>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterAmbiguityAnalysisImpl implements _CharacterAmbiguityAnalysis {
  const _$CharacterAmbiguityAnalysisImpl({
    required this.input,
    this.characterName,
    this.canonicalId,
    this.franchise,
    this.medium,
    this.referenceDescription,
    this.needsClarification = false,
    this.disambiguationReason,
    this.clarificationMessage,
    this.aiNeedsClarification = false,
    this.inputWasActor = false,
    final List<VersionOption> versionOptions = const [],
    final List<PhaseOption> phaseOptions = const [],
    this.showExclusionSection = false,
    this.selectedReference,
    this.hasEntryReference = false,
    this.entryReferenceText,
    this.entryReferenceMismatch = false,
    this.entryReferenceMismatchMessage,
    final List<AlternativeCandidate> alternativeCandidates = const [],
  }) : _versionOptions = versionOptions,
       _phaseOptions = phaseOptions,
       _alternativeCandidates = alternativeCandidates;

  factory _$CharacterAmbiguityAnalysisImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CharacterAmbiguityAnalysisImplFromJson(json);

  @override
  final String input;
  @override
  final String? characterName;
  @override
  final String? canonicalId;
  // Character identification reference (always shown to user)
  @override
  final String? franchise;
  @override
  final String? medium;
  @override
  final String? referenceDescription;
  @override
  @JsonKey()
  final bool needsClarification;
  @override
  final String? disambiguationReason;

  /// User-friendly message explaining why clarification is needed
  @override
  final String? clarificationMessage;

  /// AI specifically requested clarification for this character
  @override
  @JsonKey()
  final bool aiNeedsClarification;

  /// True if the input was detected as an actor name
  @override
  @JsonKey()
  final bool inputWasActor;
  // Concrete version options with labels and cues
  final List<VersionOption> _versionOptions;
  // Concrete version options with labels and cues
  @override
  @JsonKey()
  List<VersionOption> get versionOptions {
    if (_versionOptions is EqualUnmodifiableListView) return _versionOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versionOptions);
  }

  // Concrete phase options with labels and cues
  final List<PhaseOption> _phaseOptions;
  // Concrete phase options with labels and cues
  @override
  @JsonKey()
  List<PhaseOption> get phaseOptions {
    if (_phaseOptions is EqualUnmodifiableListView) return _phaseOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phaseOptions);
  }

  // Whether to show arc exclusion section (true if >1 phases or polarized character)
  @override
  @JsonKey()
  final bool showExclusionSection;
  // User's selection (to be filled in)
  @override
  final CharacterReference? selectedReference;
  // Entry reference info (from Character Entry page)
  @override
  @JsonKey()
  final bool hasEntryReference;
  @override
  final String? entryReferenceText;

  /// True if top match doesn't align with user's entry reference
  @override
  @JsonKey()
  final bool entryReferenceMismatch;

  /// Message explaining the mismatch
  @override
  final String? entryReferenceMismatchMessage;

  /// Alternative candidates that match the reference
  final List<AlternativeCandidate> _alternativeCandidates;

  /// Alternative candidates that match the reference
  @override
  @JsonKey()
  List<AlternativeCandidate> get alternativeCandidates {
    if (_alternativeCandidates is EqualUnmodifiableListView)
      return _alternativeCandidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alternativeCandidates);
  }

  @override
  String toString() {
    return 'CharacterAmbiguityAnalysis(input: $input, characterName: $characterName, canonicalId: $canonicalId, franchise: $franchise, medium: $medium, referenceDescription: $referenceDescription, needsClarification: $needsClarification, disambiguationReason: $disambiguationReason, clarificationMessage: $clarificationMessage, aiNeedsClarification: $aiNeedsClarification, inputWasActor: $inputWasActor, versionOptions: $versionOptions, phaseOptions: $phaseOptions, showExclusionSection: $showExclusionSection, selectedReference: $selectedReference, hasEntryReference: $hasEntryReference, entryReferenceText: $entryReferenceText, entryReferenceMismatch: $entryReferenceMismatch, entryReferenceMismatchMessage: $entryReferenceMismatchMessage, alternativeCandidates: $alternativeCandidates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterAmbiguityAnalysisImpl &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.characterName, characterName) ||
                other.characterName == characterName) &&
            (identical(other.canonicalId, canonicalId) ||
                other.canonicalId == canonicalId) &&
            (identical(other.franchise, franchise) ||
                other.franchise == franchise) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.referenceDescription, referenceDescription) ||
                other.referenceDescription == referenceDescription) &&
            (identical(other.needsClarification, needsClarification) ||
                other.needsClarification == needsClarification) &&
            (identical(other.disambiguationReason, disambiguationReason) ||
                other.disambiguationReason == disambiguationReason) &&
            (identical(other.clarificationMessage, clarificationMessage) ||
                other.clarificationMessage == clarificationMessage) &&
            (identical(other.aiNeedsClarification, aiNeedsClarification) ||
                other.aiNeedsClarification == aiNeedsClarification) &&
            (identical(other.inputWasActor, inputWasActor) ||
                other.inputWasActor == inputWasActor) &&
            const DeepCollectionEquality().equals(
              other._versionOptions,
              _versionOptions,
            ) &&
            const DeepCollectionEquality().equals(
              other._phaseOptions,
              _phaseOptions,
            ) &&
            (identical(other.showExclusionSection, showExclusionSection) ||
                other.showExclusionSection == showExclusionSection) &&
            (identical(other.selectedReference, selectedReference) ||
                other.selectedReference == selectedReference) &&
            (identical(other.hasEntryReference, hasEntryReference) ||
                other.hasEntryReference == hasEntryReference) &&
            (identical(other.entryReferenceText, entryReferenceText) ||
                other.entryReferenceText == entryReferenceText) &&
            (identical(other.entryReferenceMismatch, entryReferenceMismatch) ||
                other.entryReferenceMismatch == entryReferenceMismatch) &&
            (identical(
                  other.entryReferenceMismatchMessage,
                  entryReferenceMismatchMessage,
                ) ||
                other.entryReferenceMismatchMessage ==
                    entryReferenceMismatchMessage) &&
            const DeepCollectionEquality().equals(
              other._alternativeCandidates,
              _alternativeCandidates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    input,
    characterName,
    canonicalId,
    franchise,
    medium,
    referenceDescription,
    needsClarification,
    disambiguationReason,
    clarificationMessage,
    aiNeedsClarification,
    inputWasActor,
    const DeepCollectionEquality().hash(_versionOptions),
    const DeepCollectionEquality().hash(_phaseOptions),
    showExclusionSection,
    selectedReference,
    hasEntryReference,
    entryReferenceText,
    entryReferenceMismatch,
    entryReferenceMismatchMessage,
    const DeepCollectionEquality().hash(_alternativeCandidates),
  ]);

  /// Create a copy of CharacterAmbiguityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterAmbiguityAnalysisImplCopyWith<_$CharacterAmbiguityAnalysisImpl>
  get copyWith =>
      __$$CharacterAmbiguityAnalysisImplCopyWithImpl<
        _$CharacterAmbiguityAnalysisImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterAmbiguityAnalysisImplToJson(this);
  }
}

abstract class _CharacterAmbiguityAnalysis
    implements CharacterAmbiguityAnalysis {
  const factory _CharacterAmbiguityAnalysis({
    required final String input,
    final String? characterName,
    final String? canonicalId,
    final String? franchise,
    final String? medium,
    final String? referenceDescription,
    final bool needsClarification,
    final String? disambiguationReason,
    final String? clarificationMessage,
    final bool aiNeedsClarification,
    final bool inputWasActor,
    final List<VersionOption> versionOptions,
    final List<PhaseOption> phaseOptions,
    final bool showExclusionSection,
    final CharacterReference? selectedReference,
    final bool hasEntryReference,
    final String? entryReferenceText,
    final bool entryReferenceMismatch,
    final String? entryReferenceMismatchMessage,
    final List<AlternativeCandidate> alternativeCandidates,
  }) = _$CharacterAmbiguityAnalysisImpl;

  factory _CharacterAmbiguityAnalysis.fromJson(Map<String, dynamic> json) =
      _$CharacterAmbiguityAnalysisImpl.fromJson;

  @override
  String get input;
  @override
  String? get characterName;
  @override
  String? get canonicalId; // Character identification reference (always shown to user)
  @override
  String? get franchise;
  @override
  String? get medium;
  @override
  String? get referenceDescription;
  @override
  bool get needsClarification;
  @override
  String? get disambiguationReason;

  /// User-friendly message explaining why clarification is needed
  @override
  String? get clarificationMessage;

  /// AI specifically requested clarification for this character
  @override
  bool get aiNeedsClarification;

  /// True if the input was detected as an actor name
  @override
  bool get inputWasActor; // Concrete version options with labels and cues
  @override
  List<VersionOption> get versionOptions; // Concrete phase options with labels and cues
  @override
  List<PhaseOption> get phaseOptions; // Whether to show arc exclusion section (true if >1 phases or polarized character)
  @override
  bool get showExclusionSection; // User's selection (to be filled in)
  @override
  CharacterReference? get selectedReference; // Entry reference info (from Character Entry page)
  @override
  bool get hasEntryReference;
  @override
  String? get entryReferenceText;

  /// True if top match doesn't align with user's entry reference
  @override
  bool get entryReferenceMismatch;

  /// Message explaining the mismatch
  @override
  String? get entryReferenceMismatchMessage;

  /// Alternative candidates that match the reference
  @override
  List<AlternativeCandidate> get alternativeCandidates;

  /// Create a copy of CharacterAmbiguityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterAmbiguityAnalysisImplCopyWith<_$CharacterAmbiguityAnalysisImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AlternativeCandidate _$AlternativeCandidateFromJson(Map<String, dynamic> json) {
  return _AlternativeCandidate.fromJson(json);
}

/// @nodoc
mixin _$AlternativeCandidate {
  String get canonicalId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get franchise => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  bool get matchesReference => throw _privateConstructorUsedError;

  /// Serializes this AlternativeCandidate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlternativeCandidate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlternativeCandidateCopyWith<AlternativeCandidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlternativeCandidateCopyWith<$Res> {
  factory $AlternativeCandidateCopyWith(
    AlternativeCandidate value,
    $Res Function(AlternativeCandidate) then,
  ) = _$AlternativeCandidateCopyWithImpl<$Res, AlternativeCandidate>;
  @useResult
  $Res call({
    String canonicalId,
    String name,
    String? franchise,
    String? medium,
    bool matchesReference,
  });
}

/// @nodoc
class _$AlternativeCandidateCopyWithImpl<
  $Res,
  $Val extends AlternativeCandidate
>
    implements $AlternativeCandidateCopyWith<$Res> {
  _$AlternativeCandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlternativeCandidate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canonicalId = null,
    Object? name = null,
    Object? franchise = freezed,
    Object? medium = freezed,
    Object? matchesReference = null,
  }) {
    return _then(
      _value.copyWith(
            canonicalId: null == canonicalId
                ? _value.canonicalId
                : canonicalId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            franchise: freezed == franchise
                ? _value.franchise
                : franchise // ignore: cast_nullable_to_non_nullable
                      as String?,
            medium: freezed == medium
                ? _value.medium
                : medium // ignore: cast_nullable_to_non_nullable
                      as String?,
            matchesReference: null == matchesReference
                ? _value.matchesReference
                : matchesReference // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlternativeCandidateImplCopyWith<$Res>
    implements $AlternativeCandidateCopyWith<$Res> {
  factory _$$AlternativeCandidateImplCopyWith(
    _$AlternativeCandidateImpl value,
    $Res Function(_$AlternativeCandidateImpl) then,
  ) = __$$AlternativeCandidateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String canonicalId,
    String name,
    String? franchise,
    String? medium,
    bool matchesReference,
  });
}

/// @nodoc
class __$$AlternativeCandidateImplCopyWithImpl<$Res>
    extends _$AlternativeCandidateCopyWithImpl<$Res, _$AlternativeCandidateImpl>
    implements _$$AlternativeCandidateImplCopyWith<$Res> {
  __$$AlternativeCandidateImplCopyWithImpl(
    _$AlternativeCandidateImpl _value,
    $Res Function(_$AlternativeCandidateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlternativeCandidate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canonicalId = null,
    Object? name = null,
    Object? franchise = freezed,
    Object? medium = freezed,
    Object? matchesReference = null,
  }) {
    return _then(
      _$AlternativeCandidateImpl(
        canonicalId: null == canonicalId
            ? _value.canonicalId
            : canonicalId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        franchise: freezed == franchise
            ? _value.franchise
            : franchise // ignore: cast_nullable_to_non_nullable
                  as String?,
        medium: freezed == medium
            ? _value.medium
            : medium // ignore: cast_nullable_to_non_nullable
                  as String?,
        matchesReference: null == matchesReference
            ? _value.matchesReference
            : matchesReference // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AlternativeCandidateImpl implements _AlternativeCandidate {
  const _$AlternativeCandidateImpl({
    required this.canonicalId,
    required this.name,
    this.franchise,
    this.medium,
    this.matchesReference = false,
  });

  factory _$AlternativeCandidateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlternativeCandidateImplFromJson(json);

  @override
  final String canonicalId;
  @override
  final String name;
  @override
  final String? franchise;
  @override
  final String? medium;
  @override
  @JsonKey()
  final bool matchesReference;

  @override
  String toString() {
    return 'AlternativeCandidate(canonicalId: $canonicalId, name: $name, franchise: $franchise, medium: $medium, matchesReference: $matchesReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlternativeCandidateImpl &&
            (identical(other.canonicalId, canonicalId) ||
                other.canonicalId == canonicalId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.franchise, franchise) ||
                other.franchise == franchise) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.matchesReference, matchesReference) ||
                other.matchesReference == matchesReference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    canonicalId,
    name,
    franchise,
    medium,
    matchesReference,
  );

  /// Create a copy of AlternativeCandidate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlternativeCandidateImplCopyWith<_$AlternativeCandidateImpl>
  get copyWith =>
      __$$AlternativeCandidateImplCopyWithImpl<_$AlternativeCandidateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AlternativeCandidateImplToJson(this);
  }
}

abstract class _AlternativeCandidate implements AlternativeCandidate {
  const factory _AlternativeCandidate({
    required final String canonicalId,
    required final String name,
    final String? franchise,
    final String? medium,
    final bool matchesReference,
  }) = _$AlternativeCandidateImpl;

  factory _AlternativeCandidate.fromJson(Map<String, dynamic> json) =
      _$AlternativeCandidateImpl.fromJson;

  @override
  String get canonicalId;
  @override
  String get name;
  @override
  String? get franchise;
  @override
  String? get medium;
  @override
  bool get matchesReference;

  /// Create a copy of AlternativeCandidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlternativeCandidateImplCopyWith<_$AlternativeCandidateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResonanceAnalysisResponse _$ResonanceAnalysisResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ResonanceAnalysisResponse.fromJson(json);
}

/// @nodoc
mixin _$ResonanceAnalysisResponse {
  bool get success => throw _privateConstructorUsedError;
  bool get needsClarification => throw _privateConstructorUsedError;
  List<CharacterAmbiguityAnalysis> get characters =>
      throw _privateConstructorUsedError;
  ResonanceSummary? get recognitionSummary =>
      throw _privateConstructorUsedError;

  /// Serializes this ResonanceAnalysisResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResonanceAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResonanceAnalysisResponseCopyWith<ResonanceAnalysisResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResonanceAnalysisResponseCopyWith<$Res> {
  factory $ResonanceAnalysisResponseCopyWith(
    ResonanceAnalysisResponse value,
    $Res Function(ResonanceAnalysisResponse) then,
  ) = _$ResonanceAnalysisResponseCopyWithImpl<$Res, ResonanceAnalysisResponse>;
  @useResult
  $Res call({
    bool success,
    bool needsClarification,
    List<CharacterAmbiguityAnalysis> characters,
    ResonanceSummary? recognitionSummary,
  });

  $ResonanceSummaryCopyWith<$Res>? get recognitionSummary;
}

/// @nodoc
class _$ResonanceAnalysisResponseCopyWithImpl<
  $Res,
  $Val extends ResonanceAnalysisResponse
>
    implements $ResonanceAnalysisResponseCopyWith<$Res> {
  _$ResonanceAnalysisResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResonanceAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? needsClarification = null,
    Object? characters = null,
    Object? recognitionSummary = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            needsClarification: null == needsClarification
                ? _value.needsClarification
                : needsClarification // ignore: cast_nullable_to_non_nullable
                      as bool,
            characters: null == characters
                ? _value.characters
                : characters // ignore: cast_nullable_to_non_nullable
                      as List<CharacterAmbiguityAnalysis>,
            recognitionSummary: freezed == recognitionSummary
                ? _value.recognitionSummary
                : recognitionSummary // ignore: cast_nullable_to_non_nullable
                      as ResonanceSummary?,
          )
          as $Val,
    );
  }

  /// Create a copy of ResonanceAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResonanceSummaryCopyWith<$Res>? get recognitionSummary {
    if (_value.recognitionSummary == null) {
      return null;
    }

    return $ResonanceSummaryCopyWith<$Res>(_value.recognitionSummary!, (value) {
      return _then(_value.copyWith(recognitionSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResonanceAnalysisResponseImplCopyWith<$Res>
    implements $ResonanceAnalysisResponseCopyWith<$Res> {
  factory _$$ResonanceAnalysisResponseImplCopyWith(
    _$ResonanceAnalysisResponseImpl value,
    $Res Function(_$ResonanceAnalysisResponseImpl) then,
  ) = __$$ResonanceAnalysisResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    bool needsClarification,
    List<CharacterAmbiguityAnalysis> characters,
    ResonanceSummary? recognitionSummary,
  });

  @override
  $ResonanceSummaryCopyWith<$Res>? get recognitionSummary;
}

/// @nodoc
class __$$ResonanceAnalysisResponseImplCopyWithImpl<$Res>
    extends
        _$ResonanceAnalysisResponseCopyWithImpl<
          $Res,
          _$ResonanceAnalysisResponseImpl
        >
    implements _$$ResonanceAnalysisResponseImplCopyWith<$Res> {
  __$$ResonanceAnalysisResponseImplCopyWithImpl(
    _$ResonanceAnalysisResponseImpl _value,
    $Res Function(_$ResonanceAnalysisResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResonanceAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? needsClarification = null,
    Object? characters = null,
    Object? recognitionSummary = freezed,
  }) {
    return _then(
      _$ResonanceAnalysisResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        needsClarification: null == needsClarification
            ? _value.needsClarification
            : needsClarification // ignore: cast_nullable_to_non_nullable
                  as bool,
        characters: null == characters
            ? _value._characters
            : characters // ignore: cast_nullable_to_non_nullable
                  as List<CharacterAmbiguityAnalysis>,
        recognitionSummary: freezed == recognitionSummary
            ? _value.recognitionSummary
            : recognitionSummary // ignore: cast_nullable_to_non_nullable
                  as ResonanceSummary?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResonanceAnalysisResponseImpl implements _ResonanceAnalysisResponse {
  const _$ResonanceAnalysisResponseImpl({
    this.success = false,
    this.needsClarification = false,
    final List<CharacterAmbiguityAnalysis> characters = const [],
    this.recognitionSummary,
  }) : _characters = characters;

  factory _$ResonanceAnalysisResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResonanceAnalysisResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final bool needsClarification;
  final List<CharacterAmbiguityAnalysis> _characters;
  @override
  @JsonKey()
  List<CharacterAmbiguityAnalysis> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  final ResonanceSummary? recognitionSummary;

  @override
  String toString() {
    return 'ResonanceAnalysisResponse(success: $success, needsClarification: $needsClarification, characters: $characters, recognitionSummary: $recognitionSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResonanceAnalysisResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.needsClarification, needsClarification) ||
                other.needsClarification == needsClarification) &&
            const DeepCollectionEquality().equals(
              other._characters,
              _characters,
            ) &&
            (identical(other.recognitionSummary, recognitionSummary) ||
                other.recognitionSummary == recognitionSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    needsClarification,
    const DeepCollectionEquality().hash(_characters),
    recognitionSummary,
  );

  /// Create a copy of ResonanceAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResonanceAnalysisResponseImplCopyWith<_$ResonanceAnalysisResponseImpl>
  get copyWith =>
      __$$ResonanceAnalysisResponseImplCopyWithImpl<
        _$ResonanceAnalysisResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResonanceAnalysisResponseImplToJson(this);
  }
}

abstract class _ResonanceAnalysisResponse implements ResonanceAnalysisResponse {
  const factory _ResonanceAnalysisResponse({
    final bool success,
    final bool needsClarification,
    final List<CharacterAmbiguityAnalysis> characters,
    final ResonanceSummary? recognitionSummary,
  }) = _$ResonanceAnalysisResponseImpl;

  factory _ResonanceAnalysisResponse.fromJson(Map<String, dynamic> json) =
      _$ResonanceAnalysisResponseImpl.fromJson;

  @override
  bool get success;
  @override
  bool get needsClarification;
  @override
  List<CharacterAmbiguityAnalysis> get characters;
  @override
  ResonanceSummary? get recognitionSummary;

  /// Create a copy of ResonanceAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResonanceAnalysisResponseImplCopyWith<_$ResonanceAnalysisResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ResonanceSummary _$ResonanceSummaryFromJson(Map<String, dynamic> json) {
  return _ResonanceSummary.fromJson(json);
}

/// @nodoc
mixin _$ResonanceSummary {
  int get total => throw _privateConstructorUsedError;
  int get recognized => throw _privateConstructorUsedError;
  int get needsClarification => throw _privateConstructorUsedError;

  /// Number of characters with entry references from Character Entry page
  int get withEntryReferences => throw _privateConstructorUsedError;

  /// Number of characters where top match doesn't align with entry reference
  int get referenceMismatches => throw _privateConstructorUsedError;

  /// Serializes this ResonanceSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResonanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResonanceSummaryCopyWith<ResonanceSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResonanceSummaryCopyWith<$Res> {
  factory $ResonanceSummaryCopyWith(
    ResonanceSummary value,
    $Res Function(ResonanceSummary) then,
  ) = _$ResonanceSummaryCopyWithImpl<$Res, ResonanceSummary>;
  @useResult
  $Res call({
    int total,
    int recognized,
    int needsClarification,
    int withEntryReferences,
    int referenceMismatches,
  });
}

/// @nodoc
class _$ResonanceSummaryCopyWithImpl<$Res, $Val extends ResonanceSummary>
    implements $ResonanceSummaryCopyWith<$Res> {
  _$ResonanceSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResonanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? recognized = null,
    Object? needsClarification = null,
    Object? withEntryReferences = null,
    Object? referenceMismatches = null,
  }) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            recognized: null == recognized
                ? _value.recognized
                : recognized // ignore: cast_nullable_to_non_nullable
                      as int,
            needsClarification: null == needsClarification
                ? _value.needsClarification
                : needsClarification // ignore: cast_nullable_to_non_nullable
                      as int,
            withEntryReferences: null == withEntryReferences
                ? _value.withEntryReferences
                : withEntryReferences // ignore: cast_nullable_to_non_nullable
                      as int,
            referenceMismatches: null == referenceMismatches
                ? _value.referenceMismatches
                : referenceMismatches // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResonanceSummaryImplCopyWith<$Res>
    implements $ResonanceSummaryCopyWith<$Res> {
  factory _$$ResonanceSummaryImplCopyWith(
    _$ResonanceSummaryImpl value,
    $Res Function(_$ResonanceSummaryImpl) then,
  ) = __$$ResonanceSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int total,
    int recognized,
    int needsClarification,
    int withEntryReferences,
    int referenceMismatches,
  });
}

/// @nodoc
class __$$ResonanceSummaryImplCopyWithImpl<$Res>
    extends _$ResonanceSummaryCopyWithImpl<$Res, _$ResonanceSummaryImpl>
    implements _$$ResonanceSummaryImplCopyWith<$Res> {
  __$$ResonanceSummaryImplCopyWithImpl(
    _$ResonanceSummaryImpl _value,
    $Res Function(_$ResonanceSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResonanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? recognized = null,
    Object? needsClarification = null,
    Object? withEntryReferences = null,
    Object? referenceMismatches = null,
  }) {
    return _then(
      _$ResonanceSummaryImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        recognized: null == recognized
            ? _value.recognized
            : recognized // ignore: cast_nullable_to_non_nullable
                  as int,
        needsClarification: null == needsClarification
            ? _value.needsClarification
            : needsClarification // ignore: cast_nullable_to_non_nullable
                  as int,
        withEntryReferences: null == withEntryReferences
            ? _value.withEntryReferences
            : withEntryReferences // ignore: cast_nullable_to_non_nullable
                  as int,
        referenceMismatches: null == referenceMismatches
            ? _value.referenceMismatches
            : referenceMismatches // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResonanceSummaryImpl implements _ResonanceSummary {
  const _$ResonanceSummaryImpl({
    this.total = 0,
    this.recognized = 0,
    this.needsClarification = 0,
    this.withEntryReferences = 0,
    this.referenceMismatches = 0,
  });

  factory _$ResonanceSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResonanceSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int recognized;
  @override
  @JsonKey()
  final int needsClarification;

  /// Number of characters with entry references from Character Entry page
  @override
  @JsonKey()
  final int withEntryReferences;

  /// Number of characters where top match doesn't align with entry reference
  @override
  @JsonKey()
  final int referenceMismatches;

  @override
  String toString() {
    return 'ResonanceSummary(total: $total, recognized: $recognized, needsClarification: $needsClarification, withEntryReferences: $withEntryReferences, referenceMismatches: $referenceMismatches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResonanceSummaryImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.recognized, recognized) ||
                other.recognized == recognized) &&
            (identical(other.needsClarification, needsClarification) ||
                other.needsClarification == needsClarification) &&
            (identical(other.withEntryReferences, withEntryReferences) ||
                other.withEntryReferences == withEntryReferences) &&
            (identical(other.referenceMismatches, referenceMismatches) ||
                other.referenceMismatches == referenceMismatches));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    total,
    recognized,
    needsClarification,
    withEntryReferences,
    referenceMismatches,
  );

  /// Create a copy of ResonanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResonanceSummaryImplCopyWith<_$ResonanceSummaryImpl> get copyWith =>
      __$$ResonanceSummaryImplCopyWithImpl<_$ResonanceSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ResonanceSummaryImplToJson(this);
  }
}

abstract class _ResonanceSummary implements ResonanceSummary {
  const factory _ResonanceSummary({
    final int total,
    final int recognized,
    final int needsClarification,
    final int withEntryReferences,
    final int referenceMismatches,
  }) = _$ResonanceSummaryImpl;

  factory _ResonanceSummary.fromJson(Map<String, dynamic> json) =
      _$ResonanceSummaryImpl.fromJson;

  @override
  int get total;
  @override
  int get recognized;
  @override
  int get needsClarification;

  /// Number of characters with entry references from Character Entry page
  @override
  int get withEntryReferences;

  /// Number of characters where top match doesn't align with entry reference
  @override
  int get referenceMismatches;

  /// Create a copy of ResonanceSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResonanceSummaryImplCopyWith<_$ResonanceSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClarificationChoice _$ClarificationChoiceFromJson(Map<String, dynamic> json) {
  return _ClarificationChoice.fromJson(json);
}

/// @nodoc
mixin _$ClarificationChoice {
  String get referenceMode => throw _privateConstructorUsedError;
  String? get versionId => throw _privateConstructorUsedError;
  String? get phaseId => throw _privateConstructorUsedError;

  /// Explicitly excluded phase IDs (negative arc exclusion)
  List<String> get excludedPhaseIds => throw _privateConstructorUsedError;
  List<String> get referenceTags => throw _privateConstructorUsedError;
  String? get referenceText => throw _privateConstructorUsedError;

  /// Positive resonance - what user connects with
  String? get positiveText => throw _privateConstructorUsedError;

  /// Negative resonance - what doesn't feel like the user
  String? get negativeText => throw _privateConstructorUsedError;

  /// Serializes this ClarificationChoice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClarificationChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClarificationChoiceCopyWith<ClarificationChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClarificationChoiceCopyWith<$Res> {
  factory $ClarificationChoiceCopyWith(
    ClarificationChoice value,
    $Res Function(ClarificationChoice) then,
  ) = _$ClarificationChoiceCopyWithImpl<$Res, ClarificationChoice>;
  @useResult
  $Res call({
    String referenceMode,
    String? versionId,
    String? phaseId,
    List<String> excludedPhaseIds,
    List<String> referenceTags,
    String? referenceText,
    String? positiveText,
    String? negativeText,
  });
}

/// @nodoc
class _$ClarificationChoiceCopyWithImpl<$Res, $Val extends ClarificationChoice>
    implements $ClarificationChoiceCopyWith<$Res> {
  _$ClarificationChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClarificationChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceMode = null,
    Object? versionId = freezed,
    Object? phaseId = freezed,
    Object? excludedPhaseIds = null,
    Object? referenceTags = null,
    Object? referenceText = freezed,
    Object? positiveText = freezed,
    Object? negativeText = freezed,
  }) {
    return _then(
      _value.copyWith(
            referenceMode: null == referenceMode
                ? _value.referenceMode
                : referenceMode // ignore: cast_nullable_to_non_nullable
                      as String,
            versionId: freezed == versionId
                ? _value.versionId
                : versionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            phaseId: freezed == phaseId
                ? _value.phaseId
                : phaseId // ignore: cast_nullable_to_non_nullable
                      as String?,
            excludedPhaseIds: null == excludedPhaseIds
                ? _value.excludedPhaseIds
                : excludedPhaseIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            referenceTags: null == referenceTags
                ? _value.referenceTags
                : referenceTags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            referenceText: freezed == referenceText
                ? _value.referenceText
                : referenceText // ignore: cast_nullable_to_non_nullable
                      as String?,
            positiveText: freezed == positiveText
                ? _value.positiveText
                : positiveText // ignore: cast_nullable_to_non_nullable
                      as String?,
            negativeText: freezed == negativeText
                ? _value.negativeText
                : negativeText // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClarificationChoiceImplCopyWith<$Res>
    implements $ClarificationChoiceCopyWith<$Res> {
  factory _$$ClarificationChoiceImplCopyWith(
    _$ClarificationChoiceImpl value,
    $Res Function(_$ClarificationChoiceImpl) then,
  ) = __$$ClarificationChoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String referenceMode,
    String? versionId,
    String? phaseId,
    List<String> excludedPhaseIds,
    List<String> referenceTags,
    String? referenceText,
    String? positiveText,
    String? negativeText,
  });
}

/// @nodoc
class __$$ClarificationChoiceImplCopyWithImpl<$Res>
    extends _$ClarificationChoiceCopyWithImpl<$Res, _$ClarificationChoiceImpl>
    implements _$$ClarificationChoiceImplCopyWith<$Res> {
  __$$ClarificationChoiceImplCopyWithImpl(
    _$ClarificationChoiceImpl _value,
    $Res Function(_$ClarificationChoiceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClarificationChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceMode = null,
    Object? versionId = freezed,
    Object? phaseId = freezed,
    Object? excludedPhaseIds = null,
    Object? referenceTags = null,
    Object? referenceText = freezed,
    Object? positiveText = freezed,
    Object? negativeText = freezed,
  }) {
    return _then(
      _$ClarificationChoiceImpl(
        referenceMode: null == referenceMode
            ? _value.referenceMode
            : referenceMode // ignore: cast_nullable_to_non_nullable
                  as String,
        versionId: freezed == versionId
            ? _value.versionId
            : versionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        phaseId: freezed == phaseId
            ? _value.phaseId
            : phaseId // ignore: cast_nullable_to_non_nullable
                  as String?,
        excludedPhaseIds: null == excludedPhaseIds
            ? _value._excludedPhaseIds
            : excludedPhaseIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        referenceTags: null == referenceTags
            ? _value._referenceTags
            : referenceTags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        referenceText: freezed == referenceText
            ? _value.referenceText
            : referenceText // ignore: cast_nullable_to_non_nullable
                  as String?,
        positiveText: freezed == positiveText
            ? _value.positiveText
            : positiveText // ignore: cast_nullable_to_non_nullable
                  as String?,
        negativeText: freezed == negativeText
            ? _value.negativeText
            : negativeText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClarificationChoiceImpl implements _ClarificationChoice {
  const _$ClarificationChoiceImpl({
    this.referenceMode = 'NONE',
    this.versionId,
    this.phaseId,
    final List<String> excludedPhaseIds = const [],
    final List<String> referenceTags = const [],
    this.referenceText,
    this.positiveText,
    this.negativeText,
  }) : _excludedPhaseIds = excludedPhaseIds,
       _referenceTags = referenceTags;

  factory _$ClarificationChoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClarificationChoiceImplFromJson(json);

  @override
  @JsonKey()
  final String referenceMode;
  @override
  final String? versionId;
  @override
  final String? phaseId;

  /// Explicitly excluded phase IDs (negative arc exclusion)
  final List<String> _excludedPhaseIds;

  /// Explicitly excluded phase IDs (negative arc exclusion)
  @override
  @JsonKey()
  List<String> get excludedPhaseIds {
    if (_excludedPhaseIds is EqualUnmodifiableListView)
      return _excludedPhaseIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedPhaseIds);
  }

  final List<String> _referenceTags;
  @override
  @JsonKey()
  List<String> get referenceTags {
    if (_referenceTags is EqualUnmodifiableListView) return _referenceTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referenceTags);
  }

  @override
  final String? referenceText;

  /// Positive resonance - what user connects with
  @override
  final String? positiveText;

  /// Negative resonance - what doesn't feel like the user
  @override
  final String? negativeText;

  @override
  String toString() {
    return 'ClarificationChoice(referenceMode: $referenceMode, versionId: $versionId, phaseId: $phaseId, excludedPhaseIds: $excludedPhaseIds, referenceTags: $referenceTags, referenceText: $referenceText, positiveText: $positiveText, negativeText: $negativeText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClarificationChoiceImpl &&
            (identical(other.referenceMode, referenceMode) ||
                other.referenceMode == referenceMode) &&
            (identical(other.versionId, versionId) ||
                other.versionId == versionId) &&
            (identical(other.phaseId, phaseId) || other.phaseId == phaseId) &&
            const DeepCollectionEquality().equals(
              other._excludedPhaseIds,
              _excludedPhaseIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._referenceTags,
              _referenceTags,
            ) &&
            (identical(other.referenceText, referenceText) ||
                other.referenceText == referenceText) &&
            (identical(other.positiveText, positiveText) ||
                other.positiveText == positiveText) &&
            (identical(other.negativeText, negativeText) ||
                other.negativeText == negativeText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    referenceMode,
    versionId,
    phaseId,
    const DeepCollectionEquality().hash(_excludedPhaseIds),
    const DeepCollectionEquality().hash(_referenceTags),
    referenceText,
    positiveText,
    negativeText,
  );

  /// Create a copy of ClarificationChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClarificationChoiceImplCopyWith<_$ClarificationChoiceImpl> get copyWith =>
      __$$ClarificationChoiceImplCopyWithImpl<_$ClarificationChoiceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClarificationChoiceImplToJson(this);
  }
}

abstract class _ClarificationChoice implements ClarificationChoice {
  const factory _ClarificationChoice({
    final String referenceMode,
    final String? versionId,
    final String? phaseId,
    final List<String> excludedPhaseIds,
    final List<String> referenceTags,
    final String? referenceText,
    final String? positiveText,
    final String? negativeText,
  }) = _$ClarificationChoiceImpl;

  factory _ClarificationChoice.fromJson(Map<String, dynamic> json) =
      _$ClarificationChoiceImpl.fromJson;

  @override
  String get referenceMode;
  @override
  String? get versionId;
  @override
  String? get phaseId;

  /// Explicitly excluded phase IDs (negative arc exclusion)
  @override
  List<String> get excludedPhaseIds;
  @override
  List<String> get referenceTags;
  @override
  String? get referenceText;

  /// Positive resonance - what user connects with
  @override
  String? get positiveText;

  /// Negative resonance - what doesn't feel like the user
  @override
  String? get negativeText;

  /// Create a copy of ClarificationChoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClarificationChoiceImplCopyWith<_$ClarificationChoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RerecognizeResponse _$RerecognizeResponseFromJson(Map<String, dynamic> json) {
  return _RerecognizeResponse.fromJson(json);
}

/// @nodoc
mixin _$RerecognizeResponse {
  bool get success => throw _privateConstructorUsedError;
  int get characterIndex => throw _privateConstructorUsedError;
  String? get originalInput => throw _privateConstructorUsedError;
  RerecognizedCharacter? get updatedCharacter =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this RerecognizeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RerecognizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RerecognizeResponseCopyWith<RerecognizeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RerecognizeResponseCopyWith<$Res> {
  factory $RerecognizeResponseCopyWith(
    RerecognizeResponse value,
    $Res Function(RerecognizeResponse) then,
  ) = _$RerecognizeResponseCopyWithImpl<$Res, RerecognizeResponse>;
  @useResult
  $Res call({
    bool success,
    int characterIndex,
    String? originalInput,
    RerecognizedCharacter? updatedCharacter,
    String? message,
    String? error,
  });

  $RerecognizedCharacterCopyWith<$Res>? get updatedCharacter;
}

/// @nodoc
class _$RerecognizeResponseCopyWithImpl<$Res, $Val extends RerecognizeResponse>
    implements $RerecognizeResponseCopyWith<$Res> {
  _$RerecognizeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RerecognizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? characterIndex = null,
    Object? originalInput = freezed,
    Object? updatedCharacter = freezed,
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            characterIndex: null == characterIndex
                ? _value.characterIndex
                : characterIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            originalInput: freezed == originalInput
                ? _value.originalInput
                : originalInput // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedCharacter: freezed == updatedCharacter
                ? _value.updatedCharacter
                : updatedCharacter // ignore: cast_nullable_to_non_nullable
                      as RerecognizedCharacter?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of RerecognizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RerecognizedCharacterCopyWith<$Res>? get updatedCharacter {
    if (_value.updatedCharacter == null) {
      return null;
    }

    return $RerecognizedCharacterCopyWith<$Res>(_value.updatedCharacter!, (
      value,
    ) {
      return _then(_value.copyWith(updatedCharacter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RerecognizeResponseImplCopyWith<$Res>
    implements $RerecognizeResponseCopyWith<$Res> {
  factory _$$RerecognizeResponseImplCopyWith(
    _$RerecognizeResponseImpl value,
    $Res Function(_$RerecognizeResponseImpl) then,
  ) = __$$RerecognizeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    int characterIndex,
    String? originalInput,
    RerecognizedCharacter? updatedCharacter,
    String? message,
    String? error,
  });

  @override
  $RerecognizedCharacterCopyWith<$Res>? get updatedCharacter;
}

/// @nodoc
class __$$RerecognizeResponseImplCopyWithImpl<$Res>
    extends _$RerecognizeResponseCopyWithImpl<$Res, _$RerecognizeResponseImpl>
    implements _$$RerecognizeResponseImplCopyWith<$Res> {
  __$$RerecognizeResponseImplCopyWithImpl(
    _$RerecognizeResponseImpl _value,
    $Res Function(_$RerecognizeResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RerecognizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? characterIndex = null,
    Object? originalInput = freezed,
    Object? updatedCharacter = freezed,
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$RerecognizeResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        characterIndex: null == characterIndex
            ? _value.characterIndex
            : characterIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        originalInput: freezed == originalInput
            ? _value.originalInput
            : originalInput // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedCharacter: freezed == updatedCharacter
            ? _value.updatedCharacter
            : updatedCharacter // ignore: cast_nullable_to_non_nullable
                  as RerecognizedCharacter?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RerecognizeResponseImpl implements _RerecognizeResponse {
  const _$RerecognizeResponseImpl({
    this.success = false,
    this.characterIndex = 0,
    this.originalInput,
    this.updatedCharacter,
    this.message,
    this.error,
  });

  factory _$RerecognizeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RerecognizeResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final int characterIndex;
  @override
  final String? originalInput;
  @override
  final RerecognizedCharacter? updatedCharacter;
  @override
  final String? message;
  @override
  final String? error;

  @override
  String toString() {
    return 'RerecognizeResponse(success: $success, characterIndex: $characterIndex, originalInput: $originalInput, updatedCharacter: $updatedCharacter, message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RerecognizeResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.characterIndex, characterIndex) ||
                other.characterIndex == characterIndex) &&
            (identical(other.originalInput, originalInput) ||
                other.originalInput == originalInput) &&
            (identical(other.updatedCharacter, updatedCharacter) ||
                other.updatedCharacter == updatedCharacter) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    characterIndex,
    originalInput,
    updatedCharacter,
    message,
    error,
  );

  /// Create a copy of RerecognizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RerecognizeResponseImplCopyWith<_$RerecognizeResponseImpl> get copyWith =>
      __$$RerecognizeResponseImplCopyWithImpl<_$RerecognizeResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RerecognizeResponseImplToJson(this);
  }
}

abstract class _RerecognizeResponse implements RerecognizeResponse {
  const factory _RerecognizeResponse({
    final bool success,
    final int characterIndex,
    final String? originalInput,
    final RerecognizedCharacter? updatedCharacter,
    final String? message,
    final String? error,
  }) = _$RerecognizeResponseImpl;

  factory _RerecognizeResponse.fromJson(Map<String, dynamic> json) =
      _$RerecognizeResponseImpl.fromJson;

  @override
  bool get success;
  @override
  int get characterIndex;
  @override
  String? get originalInput;
  @override
  RerecognizedCharacter? get updatedCharacter;
  @override
  String? get message;
  @override
  String? get error;

  /// Create a copy of RerecognizeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RerecognizeResponseImplCopyWith<_$RerecognizeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RerecognizedCharacter _$RerecognizedCharacterFromJson(
  Map<String, dynamic> json,
) {
  return _RerecognizedCharacter.fromJson(json);
}

/// @nodoc
mixin _$RerecognizedCharacter {
  String get input => throw _privateConstructorUsedError;
  String? get characterName => throw _privateConstructorUsedError;
  String? get canonicalId => throw _privateConstructorUsedError;
  String? get franchise => throw _privateConstructorUsedError;
  String? get medium => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  bool get needsClarification => throw _privateConstructorUsedError;
  List<VersionOption> get versionOptions => throw _privateConstructorUsedError;
  List<PhaseOption> get phaseOptions => throw _privateConstructorUsedError;
  bool get wasRerecognized => throw _privateConstructorUsedError;

  /// Serializes this RerecognizedCharacter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RerecognizedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RerecognizedCharacterCopyWith<RerecognizedCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RerecognizedCharacterCopyWith<$Res> {
  factory $RerecognizedCharacterCopyWith(
    RerecognizedCharacter value,
    $Res Function(RerecognizedCharacter) then,
  ) = _$RerecognizedCharacterCopyWithImpl<$Res, RerecognizedCharacter>;
  @useResult
  $Res call({
    String input,
    String? characterName,
    String? canonicalId,
    String? franchise,
    String? medium,
    double confidence,
    bool needsClarification,
    List<VersionOption> versionOptions,
    List<PhaseOption> phaseOptions,
    bool wasRerecognized,
  });
}

/// @nodoc
class _$RerecognizedCharacterCopyWithImpl<
  $Res,
  $Val extends RerecognizedCharacter
>
    implements $RerecognizedCharacterCopyWith<$Res> {
  _$RerecognizedCharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RerecognizedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? characterName = freezed,
    Object? canonicalId = freezed,
    Object? franchise = freezed,
    Object? medium = freezed,
    Object? confidence = null,
    Object? needsClarification = null,
    Object? versionOptions = null,
    Object? phaseOptions = null,
    Object? wasRerecognized = null,
  }) {
    return _then(
      _value.copyWith(
            input: null == input
                ? _value.input
                : input // ignore: cast_nullable_to_non_nullable
                      as String,
            characterName: freezed == characterName
                ? _value.characterName
                : characterName // ignore: cast_nullable_to_non_nullable
                      as String?,
            canonicalId: freezed == canonicalId
                ? _value.canonicalId
                : canonicalId // ignore: cast_nullable_to_non_nullable
                      as String?,
            franchise: freezed == franchise
                ? _value.franchise
                : franchise // ignore: cast_nullable_to_non_nullable
                      as String?,
            medium: freezed == medium
                ? _value.medium
                : medium // ignore: cast_nullable_to_non_nullable
                      as String?,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            needsClarification: null == needsClarification
                ? _value.needsClarification
                : needsClarification // ignore: cast_nullable_to_non_nullable
                      as bool,
            versionOptions: null == versionOptions
                ? _value.versionOptions
                : versionOptions // ignore: cast_nullable_to_non_nullable
                      as List<VersionOption>,
            phaseOptions: null == phaseOptions
                ? _value.phaseOptions
                : phaseOptions // ignore: cast_nullable_to_non_nullable
                      as List<PhaseOption>,
            wasRerecognized: null == wasRerecognized
                ? _value.wasRerecognized
                : wasRerecognized // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RerecognizedCharacterImplCopyWith<$Res>
    implements $RerecognizedCharacterCopyWith<$Res> {
  factory _$$RerecognizedCharacterImplCopyWith(
    _$RerecognizedCharacterImpl value,
    $Res Function(_$RerecognizedCharacterImpl) then,
  ) = __$$RerecognizedCharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String input,
    String? characterName,
    String? canonicalId,
    String? franchise,
    String? medium,
    double confidence,
    bool needsClarification,
    List<VersionOption> versionOptions,
    List<PhaseOption> phaseOptions,
    bool wasRerecognized,
  });
}

/// @nodoc
class __$$RerecognizedCharacterImplCopyWithImpl<$Res>
    extends
        _$RerecognizedCharacterCopyWithImpl<$Res, _$RerecognizedCharacterImpl>
    implements _$$RerecognizedCharacterImplCopyWith<$Res> {
  __$$RerecognizedCharacterImplCopyWithImpl(
    _$RerecognizedCharacterImpl _value,
    $Res Function(_$RerecognizedCharacterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RerecognizedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? characterName = freezed,
    Object? canonicalId = freezed,
    Object? franchise = freezed,
    Object? medium = freezed,
    Object? confidence = null,
    Object? needsClarification = null,
    Object? versionOptions = null,
    Object? phaseOptions = null,
    Object? wasRerecognized = null,
  }) {
    return _then(
      _$RerecognizedCharacterImpl(
        input: null == input
            ? _value.input
            : input // ignore: cast_nullable_to_non_nullable
                  as String,
        characterName: freezed == characterName
            ? _value.characterName
            : characterName // ignore: cast_nullable_to_non_nullable
                  as String?,
        canonicalId: freezed == canonicalId
            ? _value.canonicalId
            : canonicalId // ignore: cast_nullable_to_non_nullable
                  as String?,
        franchise: freezed == franchise
            ? _value.franchise
            : franchise // ignore: cast_nullable_to_non_nullable
                  as String?,
        medium: freezed == medium
            ? _value.medium
            : medium // ignore: cast_nullable_to_non_nullable
                  as String?,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        needsClarification: null == needsClarification
            ? _value.needsClarification
            : needsClarification // ignore: cast_nullable_to_non_nullable
                  as bool,
        versionOptions: null == versionOptions
            ? _value._versionOptions
            : versionOptions // ignore: cast_nullable_to_non_nullable
                  as List<VersionOption>,
        phaseOptions: null == phaseOptions
            ? _value._phaseOptions
            : phaseOptions // ignore: cast_nullable_to_non_nullable
                  as List<PhaseOption>,
        wasRerecognized: null == wasRerecognized
            ? _value.wasRerecognized
            : wasRerecognized // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RerecognizedCharacterImpl implements _RerecognizedCharacter {
  const _$RerecognizedCharacterImpl({
    required this.input,
    this.characterName,
    this.canonicalId,
    this.franchise,
    this.medium,
    this.confidence = 0.0,
    this.needsClarification = false,
    final List<VersionOption> versionOptions = const [],
    final List<PhaseOption> phaseOptions = const [],
    this.wasRerecognized = false,
  }) : _versionOptions = versionOptions,
       _phaseOptions = phaseOptions;

  factory _$RerecognizedCharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$RerecognizedCharacterImplFromJson(json);

  @override
  final String input;
  @override
  final String? characterName;
  @override
  final String? canonicalId;
  @override
  final String? franchise;
  @override
  final String? medium;
  @override
  @JsonKey()
  final double confidence;
  @override
  @JsonKey()
  final bool needsClarification;
  final List<VersionOption> _versionOptions;
  @override
  @JsonKey()
  List<VersionOption> get versionOptions {
    if (_versionOptions is EqualUnmodifiableListView) return _versionOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versionOptions);
  }

  final List<PhaseOption> _phaseOptions;
  @override
  @JsonKey()
  List<PhaseOption> get phaseOptions {
    if (_phaseOptions is EqualUnmodifiableListView) return _phaseOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phaseOptions);
  }

  @override
  @JsonKey()
  final bool wasRerecognized;

  @override
  String toString() {
    return 'RerecognizedCharacter(input: $input, characterName: $characterName, canonicalId: $canonicalId, franchise: $franchise, medium: $medium, confidence: $confidence, needsClarification: $needsClarification, versionOptions: $versionOptions, phaseOptions: $phaseOptions, wasRerecognized: $wasRerecognized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RerecognizedCharacterImpl &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.characterName, characterName) ||
                other.characterName == characterName) &&
            (identical(other.canonicalId, canonicalId) ||
                other.canonicalId == canonicalId) &&
            (identical(other.franchise, franchise) ||
                other.franchise == franchise) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.needsClarification, needsClarification) ||
                other.needsClarification == needsClarification) &&
            const DeepCollectionEquality().equals(
              other._versionOptions,
              _versionOptions,
            ) &&
            const DeepCollectionEquality().equals(
              other._phaseOptions,
              _phaseOptions,
            ) &&
            (identical(other.wasRerecognized, wasRerecognized) ||
                other.wasRerecognized == wasRerecognized));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    input,
    characterName,
    canonicalId,
    franchise,
    medium,
    confidence,
    needsClarification,
    const DeepCollectionEquality().hash(_versionOptions),
    const DeepCollectionEquality().hash(_phaseOptions),
    wasRerecognized,
  );

  /// Create a copy of RerecognizedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RerecognizedCharacterImplCopyWith<_$RerecognizedCharacterImpl>
  get copyWith =>
      __$$RerecognizedCharacterImplCopyWithImpl<_$RerecognizedCharacterImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RerecognizedCharacterImplToJson(this);
  }
}

abstract class _RerecognizedCharacter implements RerecognizedCharacter {
  const factory _RerecognizedCharacter({
    required final String input,
    final String? characterName,
    final String? canonicalId,
    final String? franchise,
    final String? medium,
    final double confidence,
    final bool needsClarification,
    final List<VersionOption> versionOptions,
    final List<PhaseOption> phaseOptions,
    final bool wasRerecognized,
  }) = _$RerecognizedCharacterImpl;

  factory _RerecognizedCharacter.fromJson(Map<String, dynamic> json) =
      _$RerecognizedCharacterImpl.fromJson;

  @override
  String get input;
  @override
  String? get characterName;
  @override
  String? get canonicalId;
  @override
  String? get franchise;
  @override
  String? get medium;
  @override
  double get confidence;
  @override
  bool get needsClarification;
  @override
  List<VersionOption> get versionOptions;
  @override
  List<PhaseOption> get phaseOptions;
  @override
  bool get wasRerecognized;

  /// Create a copy of RerecognizedCharacter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RerecognizedCharacterImplCopyWith<_$RerecognizedCharacterImpl>
  get copyWith => throw _privateConstructorUsedError;
}
