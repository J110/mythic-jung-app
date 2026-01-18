// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'psyche_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StructuralPosition _$StructuralPositionFromJson(Map<String, dynamic> json) {
  return _StructuralPosition.fromJson(json);
}

/// @nodoc
mixin _$StructuralPosition {
  String? get primary => throw _privateConstructorUsedError;
  List<String> get secondary => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get evidenceFlags => throw _privateConstructorUsedError;

  /// Iconic shape for shadow illustration (e.g., "fist", "gun", "cane")
  /// Comes from character recognition AI
  String? get iconicShape => throw _privateConstructorUsedError;

  /// Serializes this StructuralPosition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StructuralPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StructuralPositionCopyWith<StructuralPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructuralPositionCopyWith<$Res> {
  factory $StructuralPositionCopyWith(
    StructuralPosition value,
    $Res Function(StructuralPosition) then,
  ) = _$StructuralPositionCopyWithImpl<$Res, StructuralPosition>;
  @useResult
  $Res call({
    String? primary,
    List<String> secondary,
    double confidence,
    List<String> evidenceFlags,
    String? iconicShape,
  });
}

/// @nodoc
class _$StructuralPositionCopyWithImpl<$Res, $Val extends StructuralPosition>
    implements $StructuralPositionCopyWith<$Res> {
  _$StructuralPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StructuralPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = null,
    Object? confidence = null,
    Object? evidenceFlags = null,
    Object? iconicShape = freezed,
  }) {
    return _then(
      _value.copyWith(
            primary: freezed == primary
                ? _value.primary
                : primary // ignore: cast_nullable_to_non_nullable
                      as String?,
            secondary: null == secondary
                ? _value.secondary
                : secondary // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            evidenceFlags: null == evidenceFlags
                ? _value.evidenceFlags
                : evidenceFlags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            iconicShape: freezed == iconicShape
                ? _value.iconicShape
                : iconicShape // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StructuralPositionImplCopyWith<$Res>
    implements $StructuralPositionCopyWith<$Res> {
  factory _$$StructuralPositionImplCopyWith(
    _$StructuralPositionImpl value,
    $Res Function(_$StructuralPositionImpl) then,
  ) = __$$StructuralPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? primary,
    List<String> secondary,
    double confidence,
    List<String> evidenceFlags,
    String? iconicShape,
  });
}

/// @nodoc
class __$$StructuralPositionImplCopyWithImpl<$Res>
    extends _$StructuralPositionCopyWithImpl<$Res, _$StructuralPositionImpl>
    implements _$$StructuralPositionImplCopyWith<$Res> {
  __$$StructuralPositionImplCopyWithImpl(
    _$StructuralPositionImpl _value,
    $Res Function(_$StructuralPositionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StructuralPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = null,
    Object? confidence = null,
    Object? evidenceFlags = null,
    Object? iconicShape = freezed,
  }) {
    return _then(
      _$StructuralPositionImpl(
        primary: freezed == primary
            ? _value.primary
            : primary // ignore: cast_nullable_to_non_nullable
                  as String?,
        secondary: null == secondary
            ? _value._secondary
            : secondary // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        evidenceFlags: null == evidenceFlags
            ? _value._evidenceFlags
            : evidenceFlags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        iconicShape: freezed == iconicShape
            ? _value.iconicShape
            : iconicShape // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StructuralPositionImpl implements _StructuralPosition {
  const _$StructuralPositionImpl({
    this.primary,
    final List<String> secondary = const [],
    this.confidence = 0.5,
    final List<String> evidenceFlags = const [],
    this.iconicShape,
  }) : _secondary = secondary,
       _evidenceFlags = evidenceFlags;

  factory _$StructuralPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructuralPositionImplFromJson(json);

  @override
  final String? primary;
  final List<String> _secondary;
  @override
  @JsonKey()
  List<String> get secondary {
    if (_secondary is EqualUnmodifiableListView) return _secondary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondary);
  }

  @override
  @JsonKey()
  final double confidence;
  final List<String> _evidenceFlags;
  @override
  @JsonKey()
  List<String> get evidenceFlags {
    if (_evidenceFlags is EqualUnmodifiableListView) return _evidenceFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidenceFlags);
  }

  /// Iconic shape for shadow illustration (e.g., "fist", "gun", "cane")
  /// Comes from character recognition AI
  @override
  final String? iconicShape;

  @override
  String toString() {
    return 'StructuralPosition(primary: $primary, secondary: $secondary, confidence: $confidence, evidenceFlags: $evidenceFlags, iconicShape: $iconicShape)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructuralPositionImpl &&
            (identical(other.primary, primary) || other.primary == primary) &&
            const DeepCollectionEquality().equals(
              other._secondary,
              _secondary,
            ) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._evidenceFlags,
              _evidenceFlags,
            ) &&
            (identical(other.iconicShape, iconicShape) ||
                other.iconicShape == iconicShape));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary,
    const DeepCollectionEquality().hash(_secondary),
    confidence,
    const DeepCollectionEquality().hash(_evidenceFlags),
    iconicShape,
  );

  /// Create a copy of StructuralPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StructuralPositionImplCopyWith<_$StructuralPositionImpl> get copyWith =>
      __$$StructuralPositionImplCopyWithImpl<_$StructuralPositionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StructuralPositionImplToJson(this);
  }
}

abstract class _StructuralPosition implements StructuralPosition {
  const factory _StructuralPosition({
    final String? primary,
    final List<String> secondary,
    final double confidence,
    final List<String> evidenceFlags,
    final String? iconicShape,
  }) = _$StructuralPositionImpl;

  factory _StructuralPosition.fromJson(Map<String, dynamic> json) =
      _$StructuralPositionImpl.fromJson;

  @override
  String? get primary;
  @override
  List<String> get secondary;
  @override
  double get confidence;
  @override
  List<String> get evidenceFlags;

  /// Iconic shape for shadow illustration (e.g., "fist", "gun", "cane")
  /// Comes from character recognition AI
  @override
  String? get iconicShape;

  /// Create a copy of StructuralPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StructuralPositionImplCopyWith<_$StructuralPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SelfDirectionPosition _$SelfDirectionPositionFromJson(
  Map<String, dynamic> json,
) {
  return _SelfDirectionPosition.fromJson(json);
}

/// @nodoc
mixin _$SelfDirectionPosition {
  List<String> get vector => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get evidenceFlags => throw _privateConstructorUsedError;

  /// Serializes this SelfDirectionPosition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelfDirectionPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelfDirectionPositionCopyWith<SelfDirectionPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfDirectionPositionCopyWith<$Res> {
  factory $SelfDirectionPositionCopyWith(
    SelfDirectionPosition value,
    $Res Function(SelfDirectionPosition) then,
  ) = _$SelfDirectionPositionCopyWithImpl<$Res, SelfDirectionPosition>;
  @useResult
  $Res call({
    List<String> vector,
    double confidence,
    List<String> evidenceFlags,
  });
}

/// @nodoc
class _$SelfDirectionPositionCopyWithImpl<
  $Res,
  $Val extends SelfDirectionPosition
>
    implements $SelfDirectionPositionCopyWith<$Res> {
  _$SelfDirectionPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelfDirectionPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vector = null,
    Object? confidence = null,
    Object? evidenceFlags = null,
  }) {
    return _then(
      _value.copyWith(
            vector: null == vector
                ? _value.vector
                : vector // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            evidenceFlags: null == evidenceFlags
                ? _value.evidenceFlags
                : evidenceFlags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SelfDirectionPositionImplCopyWith<$Res>
    implements $SelfDirectionPositionCopyWith<$Res> {
  factory _$$SelfDirectionPositionImplCopyWith(
    _$SelfDirectionPositionImpl value,
    $Res Function(_$SelfDirectionPositionImpl) then,
  ) = __$$SelfDirectionPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> vector,
    double confidence,
    List<String> evidenceFlags,
  });
}

/// @nodoc
class __$$SelfDirectionPositionImplCopyWithImpl<$Res>
    extends
        _$SelfDirectionPositionCopyWithImpl<$Res, _$SelfDirectionPositionImpl>
    implements _$$SelfDirectionPositionImplCopyWith<$Res> {
  __$$SelfDirectionPositionImplCopyWithImpl(
    _$SelfDirectionPositionImpl _value,
    $Res Function(_$SelfDirectionPositionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SelfDirectionPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vector = null,
    Object? confidence = null,
    Object? evidenceFlags = null,
  }) {
    return _then(
      _$SelfDirectionPositionImpl(
        vector: null == vector
            ? _value._vector
            : vector // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        evidenceFlags: null == evidenceFlags
            ? _value._evidenceFlags
            : evidenceFlags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SelfDirectionPositionImpl implements _SelfDirectionPosition {
  const _$SelfDirectionPositionImpl({
    final List<String> vector = const ['integration', 'growth'],
    this.confidence = 0.5,
    final List<String> evidenceFlags = const [],
  }) : _vector = vector,
       _evidenceFlags = evidenceFlags;

  factory _$SelfDirectionPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelfDirectionPositionImplFromJson(json);

  final List<String> _vector;
  @override
  @JsonKey()
  List<String> get vector {
    if (_vector is EqualUnmodifiableListView) return _vector;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vector);
  }

  @override
  @JsonKey()
  final double confidence;
  final List<String> _evidenceFlags;
  @override
  @JsonKey()
  List<String> get evidenceFlags {
    if (_evidenceFlags is EqualUnmodifiableListView) return _evidenceFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidenceFlags);
  }

  @override
  String toString() {
    return 'SelfDirectionPosition(vector: $vector, confidence: $confidence, evidenceFlags: $evidenceFlags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelfDirectionPositionImpl &&
            const DeepCollectionEquality().equals(other._vector, _vector) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._evidenceFlags,
              _evidenceFlags,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_vector),
    confidence,
    const DeepCollectionEquality().hash(_evidenceFlags),
  );

  /// Create a copy of SelfDirectionPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelfDirectionPositionImplCopyWith<_$SelfDirectionPositionImpl>
  get copyWith =>
      __$$SelfDirectionPositionImplCopyWithImpl<_$SelfDirectionPositionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SelfDirectionPositionImplToJson(this);
  }
}

abstract class _SelfDirectionPosition implements SelfDirectionPosition {
  const factory _SelfDirectionPosition({
    final List<String> vector,
    final double confidence,
    final List<String> evidenceFlags,
  }) = _$SelfDirectionPositionImpl;

  factory _SelfDirectionPosition.fromJson(Map<String, dynamic> json) =
      _$SelfDirectionPositionImpl.fromJson;

  @override
  List<String> get vector;
  @override
  double get confidence;
  @override
  List<String> get evidenceFlags;

  /// Create a copy of SelfDirectionPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelfDirectionPositionImplCopyWith<_$SelfDirectionPositionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MotifEntry _$MotifEntryFromJson(Map<String, dynamic> json) {
  return _MotifEntry.fromJson(json);
}

/// @nodoc
mixin _$MotifEntry {
  String get motif => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;

  /// Serializes this MotifEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MotifEntryCopyWith<MotifEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotifEntryCopyWith<$Res> {
  factory $MotifEntryCopyWith(
    MotifEntry value,
    $Res Function(MotifEntry) then,
  ) = _$MotifEntryCopyWithImpl<$Res, MotifEntry>;
  @useResult
  $Res call({String motif, double score});
}

/// @nodoc
class _$MotifEntryCopyWithImpl<$Res, $Val extends MotifEntry>
    implements $MotifEntryCopyWith<$Res> {
  _$MotifEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? motif = null, Object? score = null}) {
    return _then(
      _value.copyWith(
            motif: null == motif
                ? _value.motif
                : motif // ignore: cast_nullable_to_non_nullable
                      as String,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MotifEntryImplCopyWith<$Res>
    implements $MotifEntryCopyWith<$Res> {
  factory _$$MotifEntryImplCopyWith(
    _$MotifEntryImpl value,
    $Res Function(_$MotifEntryImpl) then,
  ) = __$$MotifEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String motif, double score});
}

/// @nodoc
class __$$MotifEntryImplCopyWithImpl<$Res>
    extends _$MotifEntryCopyWithImpl<$Res, _$MotifEntryImpl>
    implements _$$MotifEntryImplCopyWith<$Res> {
  __$$MotifEntryImplCopyWithImpl(
    _$MotifEntryImpl _value,
    $Res Function(_$MotifEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? motif = null, Object? score = null}) {
    return _then(
      _$MotifEntryImpl(
        motif: null == motif
            ? _value.motif
            : motif // ignore: cast_nullable_to_non_nullable
                  as String,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MotifEntryImpl implements _MotifEntry {
  const _$MotifEntryImpl({required this.motif, required this.score});

  factory _$MotifEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotifEntryImplFromJson(json);

  @override
  final String motif;
  @override
  final double score;

  @override
  String toString() {
    return 'MotifEntry(motif: $motif, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotifEntryImpl &&
            (identical(other.motif, motif) || other.motif == motif) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, motif, score);

  /// Create a copy of MotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MotifEntryImplCopyWith<_$MotifEntryImpl> get copyWith =>
      __$$MotifEntryImplCopyWithImpl<_$MotifEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotifEntryImplToJson(this);
  }
}

abstract class _MotifEntry implements MotifEntry {
  const factory _MotifEntry({
    required final String motif,
    required final double score,
  }) = _$MotifEntryImpl;

  factory _MotifEntry.fromJson(Map<String, dynamic> json) =
      _$MotifEntryImpl.fromJson;

  @override
  String get motif;
  @override
  double get score;

  /// Create a copy of MotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MotifEntryImplCopyWith<_$MotifEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UiLabelMapping _$UiLabelMappingFromJson(Map<String, dynamic> json) {
  return _UiLabelMapping.fromJson(json);
}

/// @nodoc
mixin _$UiLabelMapping {
  String get coreSelfRole => throw _privateConstructorUsedError;
  String get socialSelfRole => throw _privateConstructorUsedError;
  String get hiddenSelfRole => throw _privateConstructorUsedError;
  String get innerOppositeRole => throw _privateConstructorUsedError;
  String get directionRole => throw _privateConstructorUsedError;
  String get vitalityRole => throw _privateConstructorUsedError;

  /// Serializes this UiLabelMapping to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UiLabelMapping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UiLabelMappingCopyWith<UiLabelMapping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiLabelMappingCopyWith<$Res> {
  factory $UiLabelMappingCopyWith(
    UiLabelMapping value,
    $Res Function(UiLabelMapping) then,
  ) = _$UiLabelMappingCopyWithImpl<$Res, UiLabelMapping>;
  @useResult
  $Res call({
    String coreSelfRole,
    String socialSelfRole,
    String hiddenSelfRole,
    String innerOppositeRole,
    String directionRole,
    String vitalityRole,
  });
}

/// @nodoc
class _$UiLabelMappingCopyWithImpl<$Res, $Val extends UiLabelMapping>
    implements $UiLabelMappingCopyWith<$Res> {
  _$UiLabelMappingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UiLabelMapping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coreSelfRole = null,
    Object? socialSelfRole = null,
    Object? hiddenSelfRole = null,
    Object? innerOppositeRole = null,
    Object? directionRole = null,
    Object? vitalityRole = null,
  }) {
    return _then(
      _value.copyWith(
            coreSelfRole: null == coreSelfRole
                ? _value.coreSelfRole
                : coreSelfRole // ignore: cast_nullable_to_non_nullable
                      as String,
            socialSelfRole: null == socialSelfRole
                ? _value.socialSelfRole
                : socialSelfRole // ignore: cast_nullable_to_non_nullable
                      as String,
            hiddenSelfRole: null == hiddenSelfRole
                ? _value.hiddenSelfRole
                : hiddenSelfRole // ignore: cast_nullable_to_non_nullable
                      as String,
            innerOppositeRole: null == innerOppositeRole
                ? _value.innerOppositeRole
                : innerOppositeRole // ignore: cast_nullable_to_non_nullable
                      as String,
            directionRole: null == directionRole
                ? _value.directionRole
                : directionRole // ignore: cast_nullable_to_non_nullable
                      as String,
            vitalityRole: null == vitalityRole
                ? _value.vitalityRole
                : vitalityRole // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UiLabelMappingImplCopyWith<$Res>
    implements $UiLabelMappingCopyWith<$Res> {
  factory _$$UiLabelMappingImplCopyWith(
    _$UiLabelMappingImpl value,
    $Res Function(_$UiLabelMappingImpl) then,
  ) = __$$UiLabelMappingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String coreSelfRole,
    String socialSelfRole,
    String hiddenSelfRole,
    String innerOppositeRole,
    String directionRole,
    String vitalityRole,
  });
}

/// @nodoc
class __$$UiLabelMappingImplCopyWithImpl<$Res>
    extends _$UiLabelMappingCopyWithImpl<$Res, _$UiLabelMappingImpl>
    implements _$$UiLabelMappingImplCopyWith<$Res> {
  __$$UiLabelMappingImplCopyWithImpl(
    _$UiLabelMappingImpl _value,
    $Res Function(_$UiLabelMappingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UiLabelMapping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coreSelfRole = null,
    Object? socialSelfRole = null,
    Object? hiddenSelfRole = null,
    Object? innerOppositeRole = null,
    Object? directionRole = null,
    Object? vitalityRole = null,
  }) {
    return _then(
      _$UiLabelMappingImpl(
        coreSelfRole: null == coreSelfRole
            ? _value.coreSelfRole
            : coreSelfRole // ignore: cast_nullable_to_non_nullable
                  as String,
        socialSelfRole: null == socialSelfRole
            ? _value.socialSelfRole
            : socialSelfRole // ignore: cast_nullable_to_non_nullable
                  as String,
        hiddenSelfRole: null == hiddenSelfRole
            ? _value.hiddenSelfRole
            : hiddenSelfRole // ignore: cast_nullable_to_non_nullable
                  as String,
        innerOppositeRole: null == innerOppositeRole
            ? _value.innerOppositeRole
            : innerOppositeRole // ignore: cast_nullable_to_non_nullable
                  as String,
        directionRole: null == directionRole
            ? _value.directionRole
            : directionRole // ignore: cast_nullable_to_non_nullable
                  as String,
        vitalityRole: null == vitalityRole
            ? _value.vitalityRole
            : vitalityRole // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UiLabelMappingImpl implements _UiLabelMapping {
  const _$UiLabelMappingImpl({
    this.coreSelfRole = 'EGO',
    this.socialSelfRole = 'PERSONA',
    this.hiddenSelfRole = 'SHADOW',
    this.innerOppositeRole = 'FEELING_FUNCTION',
    this.directionRole = 'SELF_DIRECTION',
    this.vitalityRole = 'EROS_AXIS',
  });

  factory _$UiLabelMappingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UiLabelMappingImplFromJson(json);

  @override
  @JsonKey()
  final String coreSelfRole;
  @override
  @JsonKey()
  final String socialSelfRole;
  @override
  @JsonKey()
  final String hiddenSelfRole;
  @override
  @JsonKey()
  final String innerOppositeRole;
  @override
  @JsonKey()
  final String directionRole;
  @override
  @JsonKey()
  final String vitalityRole;

  @override
  String toString() {
    return 'UiLabelMapping(coreSelfRole: $coreSelfRole, socialSelfRole: $socialSelfRole, hiddenSelfRole: $hiddenSelfRole, innerOppositeRole: $innerOppositeRole, directionRole: $directionRole, vitalityRole: $vitalityRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiLabelMappingImpl &&
            (identical(other.coreSelfRole, coreSelfRole) ||
                other.coreSelfRole == coreSelfRole) &&
            (identical(other.socialSelfRole, socialSelfRole) ||
                other.socialSelfRole == socialSelfRole) &&
            (identical(other.hiddenSelfRole, hiddenSelfRole) ||
                other.hiddenSelfRole == hiddenSelfRole) &&
            (identical(other.innerOppositeRole, innerOppositeRole) ||
                other.innerOppositeRole == innerOppositeRole) &&
            (identical(other.directionRole, directionRole) ||
                other.directionRole == directionRole) &&
            (identical(other.vitalityRole, vitalityRole) ||
                other.vitalityRole == vitalityRole));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    coreSelfRole,
    socialSelfRole,
    hiddenSelfRole,
    innerOppositeRole,
    directionRole,
    vitalityRole,
  );

  /// Create a copy of UiLabelMapping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UiLabelMappingImplCopyWith<_$UiLabelMappingImpl> get copyWith =>
      __$$UiLabelMappingImplCopyWithImpl<_$UiLabelMappingImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UiLabelMappingImplToJson(this);
  }
}

abstract class _UiLabelMapping implements UiLabelMapping {
  const factory _UiLabelMapping({
    final String coreSelfRole,
    final String socialSelfRole,
    final String hiddenSelfRole,
    final String innerOppositeRole,
    final String directionRole,
    final String vitalityRole,
  }) = _$UiLabelMappingImpl;

  factory _UiLabelMapping.fromJson(Map<String, dynamic> json) =
      _$UiLabelMappingImpl.fromJson;

  @override
  String get coreSelfRole;
  @override
  String get socialSelfRole;
  @override
  String get hiddenSelfRole;
  @override
  String get innerOppositeRole;
  @override
  String get directionRole;
  @override
  String get vitalityRole;

  /// Create a copy of UiLabelMapping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UiLabelMappingImplCopyWith<_$UiLabelMappingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StabilityAnalysis _$StabilityAnalysisFromJson(Map<String, dynamic> json) {
  return _StabilityAnalysis.fromJson(json);
}

/// @nodoc
mixin _$StabilityAnalysis {
  ProfileType get profileType => throw _privateConstructorUsedError;
  String? get dominantCharacterId => throw _privateConstructorUsedError;
  List<ShiftSummary> get shiftSummary => throw _privateConstructorUsedError;

  /// Serializes this StabilityAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StabilityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StabilityAnalysisCopyWith<StabilityAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StabilityAnalysisCopyWith<$Res> {
  factory $StabilityAnalysisCopyWith(
    StabilityAnalysis value,
    $Res Function(StabilityAnalysis) then,
  ) = _$StabilityAnalysisCopyWithImpl<$Res, StabilityAnalysis>;
  @useResult
  $Res call({
    ProfileType profileType,
    String? dominantCharacterId,
    List<ShiftSummary> shiftSummary,
  });
}

/// @nodoc
class _$StabilityAnalysisCopyWithImpl<$Res, $Val extends StabilityAnalysis>
    implements $StabilityAnalysisCopyWith<$Res> {
  _$StabilityAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StabilityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileType = null,
    Object? dominantCharacterId = freezed,
    Object? shiftSummary = null,
  }) {
    return _then(
      _value.copyWith(
            profileType: null == profileType
                ? _value.profileType
                : profileType // ignore: cast_nullable_to_non_nullable
                      as ProfileType,
            dominantCharacterId: freezed == dominantCharacterId
                ? _value.dominantCharacterId
                : dominantCharacterId // ignore: cast_nullable_to_non_nullable
                      as String?,
            shiftSummary: null == shiftSummary
                ? _value.shiftSummary
                : shiftSummary // ignore: cast_nullable_to_non_nullable
                      as List<ShiftSummary>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StabilityAnalysisImplCopyWith<$Res>
    implements $StabilityAnalysisCopyWith<$Res> {
  factory _$$StabilityAnalysisImplCopyWith(
    _$StabilityAnalysisImpl value,
    $Res Function(_$StabilityAnalysisImpl) then,
  ) = __$$StabilityAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ProfileType profileType,
    String? dominantCharacterId,
    List<ShiftSummary> shiftSummary,
  });
}

/// @nodoc
class __$$StabilityAnalysisImplCopyWithImpl<$Res>
    extends _$StabilityAnalysisCopyWithImpl<$Res, _$StabilityAnalysisImpl>
    implements _$$StabilityAnalysisImplCopyWith<$Res> {
  __$$StabilityAnalysisImplCopyWithImpl(
    _$StabilityAnalysisImpl _value,
    $Res Function(_$StabilityAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StabilityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileType = null,
    Object? dominantCharacterId = freezed,
    Object? shiftSummary = null,
  }) {
    return _then(
      _$StabilityAnalysisImpl(
        profileType: null == profileType
            ? _value.profileType
            : profileType // ignore: cast_nullable_to_non_nullable
                  as ProfileType,
        dominantCharacterId: freezed == dominantCharacterId
            ? _value.dominantCharacterId
            : dominantCharacterId // ignore: cast_nullable_to_non_nullable
                  as String?,
        shiftSummary: null == shiftSummary
            ? _value._shiftSummary
            : shiftSummary // ignore: cast_nullable_to_non_nullable
                  as List<ShiftSummary>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StabilityAnalysisImpl implements _StabilityAnalysis {
  const _$StabilityAnalysisImpl({
    this.profileType = ProfileType.distributed,
    this.dominantCharacterId,
    final List<ShiftSummary> shiftSummary = const [],
  }) : _shiftSummary = shiftSummary;

  factory _$StabilityAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$StabilityAnalysisImplFromJson(json);

  @override
  @JsonKey()
  final ProfileType profileType;
  @override
  final String? dominantCharacterId;
  final List<ShiftSummary> _shiftSummary;
  @override
  @JsonKey()
  List<ShiftSummary> get shiftSummary {
    if (_shiftSummary is EqualUnmodifiableListView) return _shiftSummary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shiftSummary);
  }

  @override
  String toString() {
    return 'StabilityAnalysis(profileType: $profileType, dominantCharacterId: $dominantCharacterId, shiftSummary: $shiftSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StabilityAnalysisImpl &&
            (identical(other.profileType, profileType) ||
                other.profileType == profileType) &&
            (identical(other.dominantCharacterId, dominantCharacterId) ||
                other.dominantCharacterId == dominantCharacterId) &&
            const DeepCollectionEquality().equals(
              other._shiftSummary,
              _shiftSummary,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    profileType,
    dominantCharacterId,
    const DeepCollectionEquality().hash(_shiftSummary),
  );

  /// Create a copy of StabilityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StabilityAnalysisImplCopyWith<_$StabilityAnalysisImpl> get copyWith =>
      __$$StabilityAnalysisImplCopyWithImpl<_$StabilityAnalysisImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StabilityAnalysisImplToJson(this);
  }
}

abstract class _StabilityAnalysis implements StabilityAnalysis {
  const factory _StabilityAnalysis({
    final ProfileType profileType,
    final String? dominantCharacterId,
    final List<ShiftSummary> shiftSummary,
  }) = _$StabilityAnalysisImpl;

  factory _StabilityAnalysis.fromJson(Map<String, dynamic> json) =
      _$StabilityAnalysisImpl.fromJson;

  @override
  ProfileType get profileType;
  @override
  String? get dominantCharacterId;
  @override
  List<ShiftSummary> get shiftSummary;

  /// Create a copy of StabilityAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StabilityAnalysisImplCopyWith<_$StabilityAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftSummary _$ShiftSummaryFromJson(Map<String, dynamic> json) {
  return _ShiftSummary.fromJson(json);
}

/// @nodoc
mixin _$ShiftSummary {
  String get role => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  List<String> get reasonFlags => throw _privateConstructorUsedError;

  /// Serializes this ShiftSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftSummaryCopyWith<ShiftSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftSummaryCopyWith<$Res> {
  factory $ShiftSummaryCopyWith(
    ShiftSummary value,
    $Res Function(ShiftSummary) then,
  ) = _$ShiftSummaryCopyWithImpl<$Res, ShiftSummary>;
  @useResult
  $Res call({String role, String from, String to, List<String> reasonFlags});
}

/// @nodoc
class _$ShiftSummaryCopyWithImpl<$Res, $Val extends ShiftSummary>
    implements $ShiftSummaryCopyWith<$Res> {
  _$ShiftSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? from = null,
    Object? to = null,
    Object? reasonFlags = null,
  }) {
    return _then(
      _value.copyWith(
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            from: null == from
                ? _value.from
                : from // ignore: cast_nullable_to_non_nullable
                      as String,
            to: null == to
                ? _value.to
                : to // ignore: cast_nullable_to_non_nullable
                      as String,
            reasonFlags: null == reasonFlags
                ? _value.reasonFlags
                : reasonFlags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShiftSummaryImplCopyWith<$Res>
    implements $ShiftSummaryCopyWith<$Res> {
  factory _$$ShiftSummaryImplCopyWith(
    _$ShiftSummaryImpl value,
    $Res Function(_$ShiftSummaryImpl) then,
  ) = __$$ShiftSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String from, String to, List<String> reasonFlags});
}

/// @nodoc
class __$$ShiftSummaryImplCopyWithImpl<$Res>
    extends _$ShiftSummaryCopyWithImpl<$Res, _$ShiftSummaryImpl>
    implements _$$ShiftSummaryImplCopyWith<$Res> {
  __$$ShiftSummaryImplCopyWithImpl(
    _$ShiftSummaryImpl _value,
    $Res Function(_$ShiftSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? from = null,
    Object? to = null,
    Object? reasonFlags = null,
  }) {
    return _then(
      _$ShiftSummaryImpl(
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        from: null == from
            ? _value.from
            : from // ignore: cast_nullable_to_non_nullable
                  as String,
        to: null == to
            ? _value.to
            : to // ignore: cast_nullable_to_non_nullable
                  as String,
        reasonFlags: null == reasonFlags
            ? _value._reasonFlags
            : reasonFlags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftSummaryImpl implements _ShiftSummary {
  const _$ShiftSummaryImpl({
    required this.role,
    required this.from,
    required this.to,
    final List<String> reasonFlags = const [],
  }) : _reasonFlags = reasonFlags;

  factory _$ShiftSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftSummaryImplFromJson(json);

  @override
  final String role;
  @override
  final String from;
  @override
  final String to;
  final List<String> _reasonFlags;
  @override
  @JsonKey()
  List<String> get reasonFlags {
    if (_reasonFlags is EqualUnmodifiableListView) return _reasonFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasonFlags);
  }

  @override
  String toString() {
    return 'ShiftSummary(role: $role, from: $from, to: $to, reasonFlags: $reasonFlags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftSummaryImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(
              other._reasonFlags,
              _reasonFlags,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    role,
    from,
    to,
    const DeepCollectionEquality().hash(_reasonFlags),
  );

  /// Create a copy of ShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftSummaryImplCopyWith<_$ShiftSummaryImpl> get copyWith =>
      __$$ShiftSummaryImplCopyWithImpl<_$ShiftSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftSummaryImplToJson(this);
  }
}

abstract class _ShiftSummary implements ShiftSummary {
  const factory _ShiftSummary({
    required final String role,
    required final String from,
    required final String to,
    final List<String> reasonFlags,
  }) = _$ShiftSummaryImpl;

  factory _ShiftSummary.fromJson(Map<String, dynamic> json) =
      _$ShiftSummaryImpl.fromJson;

  @override
  String get role;
  @override
  String get from;
  @override
  String get to;
  @override
  List<String> get reasonFlags;

  /// Create a copy of ShiftSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftSummaryImplCopyWith<_$ShiftSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InputHashes _$InputHashesFromJson(Map<String, dynamic> json) {
  return _InputHashes.fromJson(json);
}

/// @nodoc
mixin _$InputHashes {
  String? get lockedPacketsHash => throw _privateConstructorUsedError;
  String? get resonanceHash => throw _privateConstructorUsedError;
  String? get assessmentHash => throw _privateConstructorUsedError;
  String? get toneHash => throw _privateConstructorUsedError; // REL-specific
  String? get meLockedPacketsHash => throw _privateConstructorUsedError;
  String? get partnerLockedPacketsHash => throw _privateConstructorUsedError;
  String? get partnerResonanceHash => throw _privateConstructorUsedError;
  String? get relationshipSettingsHash => throw _privateConstructorUsedError;

  /// Serializes this InputHashes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InputHashes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputHashesCopyWith<InputHashes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputHashesCopyWith<$Res> {
  factory $InputHashesCopyWith(
    InputHashes value,
    $Res Function(InputHashes) then,
  ) = _$InputHashesCopyWithImpl<$Res, InputHashes>;
  @useResult
  $Res call({
    String? lockedPacketsHash,
    String? resonanceHash,
    String? assessmentHash,
    String? toneHash,
    String? meLockedPacketsHash,
    String? partnerLockedPacketsHash,
    String? partnerResonanceHash,
    String? relationshipSettingsHash,
  });
}

/// @nodoc
class _$InputHashesCopyWithImpl<$Res, $Val extends InputHashes>
    implements $InputHashesCopyWith<$Res> {
  _$InputHashesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputHashes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lockedPacketsHash = freezed,
    Object? resonanceHash = freezed,
    Object? assessmentHash = freezed,
    Object? toneHash = freezed,
    Object? meLockedPacketsHash = freezed,
    Object? partnerLockedPacketsHash = freezed,
    Object? partnerResonanceHash = freezed,
    Object? relationshipSettingsHash = freezed,
  }) {
    return _then(
      _value.copyWith(
            lockedPacketsHash: freezed == lockedPacketsHash
                ? _value.lockedPacketsHash
                : lockedPacketsHash // ignore: cast_nullable_to_non_nullable
                      as String?,
            resonanceHash: freezed == resonanceHash
                ? _value.resonanceHash
                : resonanceHash // ignore: cast_nullable_to_non_nullable
                      as String?,
            assessmentHash: freezed == assessmentHash
                ? _value.assessmentHash
                : assessmentHash // ignore: cast_nullable_to_non_nullable
                      as String?,
            toneHash: freezed == toneHash
                ? _value.toneHash
                : toneHash // ignore: cast_nullable_to_non_nullable
                      as String?,
            meLockedPacketsHash: freezed == meLockedPacketsHash
                ? _value.meLockedPacketsHash
                : meLockedPacketsHash // ignore: cast_nullable_to_non_nullable
                      as String?,
            partnerLockedPacketsHash: freezed == partnerLockedPacketsHash
                ? _value.partnerLockedPacketsHash
                : partnerLockedPacketsHash // ignore: cast_nullable_to_non_nullable
                      as String?,
            partnerResonanceHash: freezed == partnerResonanceHash
                ? _value.partnerResonanceHash
                : partnerResonanceHash // ignore: cast_nullable_to_non_nullable
                      as String?,
            relationshipSettingsHash: freezed == relationshipSettingsHash
                ? _value.relationshipSettingsHash
                : relationshipSettingsHash // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InputHashesImplCopyWith<$Res>
    implements $InputHashesCopyWith<$Res> {
  factory _$$InputHashesImplCopyWith(
    _$InputHashesImpl value,
    $Res Function(_$InputHashesImpl) then,
  ) = __$$InputHashesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? lockedPacketsHash,
    String? resonanceHash,
    String? assessmentHash,
    String? toneHash,
    String? meLockedPacketsHash,
    String? partnerLockedPacketsHash,
    String? partnerResonanceHash,
    String? relationshipSettingsHash,
  });
}

/// @nodoc
class __$$InputHashesImplCopyWithImpl<$Res>
    extends _$InputHashesCopyWithImpl<$Res, _$InputHashesImpl>
    implements _$$InputHashesImplCopyWith<$Res> {
  __$$InputHashesImplCopyWithImpl(
    _$InputHashesImpl _value,
    $Res Function(_$InputHashesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InputHashes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lockedPacketsHash = freezed,
    Object? resonanceHash = freezed,
    Object? assessmentHash = freezed,
    Object? toneHash = freezed,
    Object? meLockedPacketsHash = freezed,
    Object? partnerLockedPacketsHash = freezed,
    Object? partnerResonanceHash = freezed,
    Object? relationshipSettingsHash = freezed,
  }) {
    return _then(
      _$InputHashesImpl(
        lockedPacketsHash: freezed == lockedPacketsHash
            ? _value.lockedPacketsHash
            : lockedPacketsHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        resonanceHash: freezed == resonanceHash
            ? _value.resonanceHash
            : resonanceHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        assessmentHash: freezed == assessmentHash
            ? _value.assessmentHash
            : assessmentHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        toneHash: freezed == toneHash
            ? _value.toneHash
            : toneHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        meLockedPacketsHash: freezed == meLockedPacketsHash
            ? _value.meLockedPacketsHash
            : meLockedPacketsHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        partnerLockedPacketsHash: freezed == partnerLockedPacketsHash
            ? _value.partnerLockedPacketsHash
            : partnerLockedPacketsHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        partnerResonanceHash: freezed == partnerResonanceHash
            ? _value.partnerResonanceHash
            : partnerResonanceHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        relationshipSettingsHash: freezed == relationshipSettingsHash
            ? _value.relationshipSettingsHash
            : relationshipSettingsHash // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InputHashesImpl implements _InputHashes {
  const _$InputHashesImpl({
    this.lockedPacketsHash,
    this.resonanceHash,
    this.assessmentHash,
    this.toneHash,
    this.meLockedPacketsHash,
    this.partnerLockedPacketsHash,
    this.partnerResonanceHash,
    this.relationshipSettingsHash,
  });

  factory _$InputHashesImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputHashesImplFromJson(json);

  @override
  final String? lockedPacketsHash;
  @override
  final String? resonanceHash;
  @override
  final String? assessmentHash;
  @override
  final String? toneHash;
  // REL-specific
  @override
  final String? meLockedPacketsHash;
  @override
  final String? partnerLockedPacketsHash;
  @override
  final String? partnerResonanceHash;
  @override
  final String? relationshipSettingsHash;

  @override
  String toString() {
    return 'InputHashes(lockedPacketsHash: $lockedPacketsHash, resonanceHash: $resonanceHash, assessmentHash: $assessmentHash, toneHash: $toneHash, meLockedPacketsHash: $meLockedPacketsHash, partnerLockedPacketsHash: $partnerLockedPacketsHash, partnerResonanceHash: $partnerResonanceHash, relationshipSettingsHash: $relationshipSettingsHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputHashesImpl &&
            (identical(other.lockedPacketsHash, lockedPacketsHash) ||
                other.lockedPacketsHash == lockedPacketsHash) &&
            (identical(other.resonanceHash, resonanceHash) ||
                other.resonanceHash == resonanceHash) &&
            (identical(other.assessmentHash, assessmentHash) ||
                other.assessmentHash == assessmentHash) &&
            (identical(other.toneHash, toneHash) ||
                other.toneHash == toneHash) &&
            (identical(other.meLockedPacketsHash, meLockedPacketsHash) ||
                other.meLockedPacketsHash == meLockedPacketsHash) &&
            (identical(
                  other.partnerLockedPacketsHash,
                  partnerLockedPacketsHash,
                ) ||
                other.partnerLockedPacketsHash == partnerLockedPacketsHash) &&
            (identical(other.partnerResonanceHash, partnerResonanceHash) ||
                other.partnerResonanceHash == partnerResonanceHash) &&
            (identical(
                  other.relationshipSettingsHash,
                  relationshipSettingsHash,
                ) ||
                other.relationshipSettingsHash == relationshipSettingsHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lockedPacketsHash,
    resonanceHash,
    assessmentHash,
    toneHash,
    meLockedPacketsHash,
    partnerLockedPacketsHash,
    partnerResonanceHash,
    relationshipSettingsHash,
  );

  /// Create a copy of InputHashes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputHashesImplCopyWith<_$InputHashesImpl> get copyWith =>
      __$$InputHashesImplCopyWithImpl<_$InputHashesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InputHashesImplToJson(this);
  }
}

abstract class _InputHashes implements InputHashes {
  const factory _InputHashes({
    final String? lockedPacketsHash,
    final String? resonanceHash,
    final String? assessmentHash,
    final String? toneHash,
    final String? meLockedPacketsHash,
    final String? partnerLockedPacketsHash,
    final String? partnerResonanceHash,
    final String? relationshipSettingsHash,
  }) = _$InputHashesImpl;

  factory _InputHashes.fromJson(Map<String, dynamic> json) =
      _$InputHashesImpl.fromJson;

  @override
  String? get lockedPacketsHash;
  @override
  String? get resonanceHash;
  @override
  String? get assessmentHash;
  @override
  String? get toneHash; // REL-specific
  @override
  String? get meLockedPacketsHash;
  @override
  String? get partnerLockedPacketsHash;
  @override
  String? get partnerResonanceHash;
  @override
  String? get relationshipSettingsHash;

  /// Create a copy of InputHashes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputHashesImplCopyWith<_$InputHashesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EngineVersions _$EngineVersionsFromJson(Map<String, dynamic> json) {
  return _EngineVersions.fromJson(json);
}

/// @nodoc
mixin _$EngineVersions {
  String? get recognition => throw _privateConstructorUsedError;
  String? get discovery => throw _privateConstructorUsedError;
  String? get resonance => throw _privateConstructorUsedError;
  String? get synthesis => throw _privateConstructorUsedError;
  String? get constellation => throw _privateConstructorUsedError;
  String? get examples => throw _privateConstructorUsedError;
  String? get narrative => throw _privateConstructorUsedError;

  /// Serializes this EngineVersions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EngineVersions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EngineVersionsCopyWith<EngineVersions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EngineVersionsCopyWith<$Res> {
  factory $EngineVersionsCopyWith(
    EngineVersions value,
    $Res Function(EngineVersions) then,
  ) = _$EngineVersionsCopyWithImpl<$Res, EngineVersions>;
  @useResult
  $Res call({
    String? recognition,
    String? discovery,
    String? resonance,
    String? synthesis,
    String? constellation,
    String? examples,
    String? narrative,
  });
}

/// @nodoc
class _$EngineVersionsCopyWithImpl<$Res, $Val extends EngineVersions>
    implements $EngineVersionsCopyWith<$Res> {
  _$EngineVersionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EngineVersions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recognition = freezed,
    Object? discovery = freezed,
    Object? resonance = freezed,
    Object? synthesis = freezed,
    Object? constellation = freezed,
    Object? examples = freezed,
    Object? narrative = freezed,
  }) {
    return _then(
      _value.copyWith(
            recognition: freezed == recognition
                ? _value.recognition
                : recognition // ignore: cast_nullable_to_non_nullable
                      as String?,
            discovery: freezed == discovery
                ? _value.discovery
                : discovery // ignore: cast_nullable_to_non_nullable
                      as String?,
            resonance: freezed == resonance
                ? _value.resonance
                : resonance // ignore: cast_nullable_to_non_nullable
                      as String?,
            synthesis: freezed == synthesis
                ? _value.synthesis
                : synthesis // ignore: cast_nullable_to_non_nullable
                      as String?,
            constellation: freezed == constellation
                ? _value.constellation
                : constellation // ignore: cast_nullable_to_non_nullable
                      as String?,
            examples: freezed == examples
                ? _value.examples
                : examples // ignore: cast_nullable_to_non_nullable
                      as String?,
            narrative: freezed == narrative
                ? _value.narrative
                : narrative // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EngineVersionsImplCopyWith<$Res>
    implements $EngineVersionsCopyWith<$Res> {
  factory _$$EngineVersionsImplCopyWith(
    _$EngineVersionsImpl value,
    $Res Function(_$EngineVersionsImpl) then,
  ) = __$$EngineVersionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? recognition,
    String? discovery,
    String? resonance,
    String? synthesis,
    String? constellation,
    String? examples,
    String? narrative,
  });
}

/// @nodoc
class __$$EngineVersionsImplCopyWithImpl<$Res>
    extends _$EngineVersionsCopyWithImpl<$Res, _$EngineVersionsImpl>
    implements _$$EngineVersionsImplCopyWith<$Res> {
  __$$EngineVersionsImplCopyWithImpl(
    _$EngineVersionsImpl _value,
    $Res Function(_$EngineVersionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EngineVersions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recognition = freezed,
    Object? discovery = freezed,
    Object? resonance = freezed,
    Object? synthesis = freezed,
    Object? constellation = freezed,
    Object? examples = freezed,
    Object? narrative = freezed,
  }) {
    return _then(
      _$EngineVersionsImpl(
        recognition: freezed == recognition
            ? _value.recognition
            : recognition // ignore: cast_nullable_to_non_nullable
                  as String?,
        discovery: freezed == discovery
            ? _value.discovery
            : discovery // ignore: cast_nullable_to_non_nullable
                  as String?,
        resonance: freezed == resonance
            ? _value.resonance
            : resonance // ignore: cast_nullable_to_non_nullable
                  as String?,
        synthesis: freezed == synthesis
            ? _value.synthesis
            : synthesis // ignore: cast_nullable_to_non_nullable
                  as String?,
        constellation: freezed == constellation
            ? _value.constellation
            : constellation // ignore: cast_nullable_to_non_nullable
                  as String?,
        examples: freezed == examples
            ? _value.examples
            : examples // ignore: cast_nullable_to_non_nullable
                  as String?,
        narrative: freezed == narrative
            ? _value.narrative
            : narrative // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EngineVersionsImpl implements _EngineVersions {
  const _$EngineVersionsImpl({
    this.recognition,
    this.discovery,
    this.resonance,
    this.synthesis,
    this.constellation,
    this.examples,
    this.narrative,
  });

  factory _$EngineVersionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EngineVersionsImplFromJson(json);

  @override
  final String? recognition;
  @override
  final String? discovery;
  @override
  final String? resonance;
  @override
  final String? synthesis;
  @override
  final String? constellation;
  @override
  final String? examples;
  @override
  final String? narrative;

  @override
  String toString() {
    return 'EngineVersions(recognition: $recognition, discovery: $discovery, resonance: $resonance, synthesis: $synthesis, constellation: $constellation, examples: $examples, narrative: $narrative)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EngineVersionsImpl &&
            (identical(other.recognition, recognition) ||
                other.recognition == recognition) &&
            (identical(other.discovery, discovery) ||
                other.discovery == discovery) &&
            (identical(other.resonance, resonance) ||
                other.resonance == resonance) &&
            (identical(other.synthesis, synthesis) ||
                other.synthesis == synthesis) &&
            (identical(other.constellation, constellation) ||
                other.constellation == constellation) &&
            (identical(other.examples, examples) ||
                other.examples == examples) &&
            (identical(other.narrative, narrative) ||
                other.narrative == narrative));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    recognition,
    discovery,
    resonance,
    synthesis,
    constellation,
    examples,
    narrative,
  );

  /// Create a copy of EngineVersions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EngineVersionsImplCopyWith<_$EngineVersionsImpl> get copyWith =>
      __$$EngineVersionsImplCopyWithImpl<_$EngineVersionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EngineVersionsImplToJson(this);
  }
}

abstract class _EngineVersions implements EngineVersions {
  const factory _EngineVersions({
    final String? recognition,
    final String? discovery,
    final String? resonance,
    final String? synthesis,
    final String? constellation,
    final String? examples,
    final String? narrative,
  }) = _$EngineVersionsImpl;

  factory _EngineVersions.fromJson(Map<String, dynamic> json) =
      _$EngineVersionsImpl.fromJson;

  @override
  String? get recognition;
  @override
  String? get discovery;
  @override
  String? get resonance;
  @override
  String? get synthesis;
  @override
  String? get constellation;
  @override
  String? get examples;
  @override
  String? get narrative;

  /// Create a copy of EngineVersions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EngineVersionsImplCopyWith<_$EngineVersionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StructuralPositions _$StructuralPositionsFromJson(Map<String, dynamic> json) {
  return _StructuralPositions.fromJson(json);
}

/// @nodoc
mixin _$StructuralPositions {
  @JsonKey(name: 'EGO')
  StructuralPosition? get ego => throw _privateConstructorUsedError;
  @JsonKey(name: 'PERSONA')
  StructuralPosition? get persona => throw _privateConstructorUsedError;
  @JsonKey(name: 'SHADOW')
  StructuralPosition? get shadow => throw _privateConstructorUsedError;
  @JsonKey(name: 'FEELING_FUNCTION')
  StructuralPosition? get feelingFunction => throw _privateConstructorUsedError;
  @JsonKey(name: 'EROS_AXIS')
  StructuralPosition? get erosAxis => throw _privateConstructorUsedError;
  @JsonKey(name: 'SELF_DIRECTION')
  SelfDirectionPosition? get selfDirection =>
      throw _privateConstructorUsedError;

  /// Serializes this StructuralPositions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StructuralPositionsCopyWith<StructuralPositions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructuralPositionsCopyWith<$Res> {
  factory $StructuralPositionsCopyWith(
    StructuralPositions value,
    $Res Function(StructuralPositions) then,
  ) = _$StructuralPositionsCopyWithImpl<$Res, StructuralPositions>;
  @useResult
  $Res call({
    @JsonKey(name: 'EGO') StructuralPosition? ego,
    @JsonKey(name: 'PERSONA') StructuralPosition? persona,
    @JsonKey(name: 'SHADOW') StructuralPosition? shadow,
    @JsonKey(name: 'FEELING_FUNCTION') StructuralPosition? feelingFunction,
    @JsonKey(name: 'EROS_AXIS') StructuralPosition? erosAxis,
    @JsonKey(name: 'SELF_DIRECTION') SelfDirectionPosition? selfDirection,
  });

  $StructuralPositionCopyWith<$Res>? get ego;
  $StructuralPositionCopyWith<$Res>? get persona;
  $StructuralPositionCopyWith<$Res>? get shadow;
  $StructuralPositionCopyWith<$Res>? get feelingFunction;
  $StructuralPositionCopyWith<$Res>? get erosAxis;
  $SelfDirectionPositionCopyWith<$Res>? get selfDirection;
}

/// @nodoc
class _$StructuralPositionsCopyWithImpl<$Res, $Val extends StructuralPositions>
    implements $StructuralPositionsCopyWith<$Res> {
  _$StructuralPositionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ego = freezed,
    Object? persona = freezed,
    Object? shadow = freezed,
    Object? feelingFunction = freezed,
    Object? erosAxis = freezed,
    Object? selfDirection = freezed,
  }) {
    return _then(
      _value.copyWith(
            ego: freezed == ego
                ? _value.ego
                : ego // ignore: cast_nullable_to_non_nullable
                      as StructuralPosition?,
            persona: freezed == persona
                ? _value.persona
                : persona // ignore: cast_nullable_to_non_nullable
                      as StructuralPosition?,
            shadow: freezed == shadow
                ? _value.shadow
                : shadow // ignore: cast_nullable_to_non_nullable
                      as StructuralPosition?,
            feelingFunction: freezed == feelingFunction
                ? _value.feelingFunction
                : feelingFunction // ignore: cast_nullable_to_non_nullable
                      as StructuralPosition?,
            erosAxis: freezed == erosAxis
                ? _value.erosAxis
                : erosAxis // ignore: cast_nullable_to_non_nullable
                      as StructuralPosition?,
            selfDirection: freezed == selfDirection
                ? _value.selfDirection
                : selfDirection // ignore: cast_nullable_to_non_nullable
                      as SelfDirectionPosition?,
          )
          as $Val,
    );
  }

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralPositionCopyWith<$Res>? get ego {
    if (_value.ego == null) {
      return null;
    }

    return $StructuralPositionCopyWith<$Res>(_value.ego!, (value) {
      return _then(_value.copyWith(ego: value) as $Val);
    });
  }

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralPositionCopyWith<$Res>? get persona {
    if (_value.persona == null) {
      return null;
    }

    return $StructuralPositionCopyWith<$Res>(_value.persona!, (value) {
      return _then(_value.copyWith(persona: value) as $Val);
    });
  }

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralPositionCopyWith<$Res>? get shadow {
    if (_value.shadow == null) {
      return null;
    }

    return $StructuralPositionCopyWith<$Res>(_value.shadow!, (value) {
      return _then(_value.copyWith(shadow: value) as $Val);
    });
  }

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralPositionCopyWith<$Res>? get feelingFunction {
    if (_value.feelingFunction == null) {
      return null;
    }

    return $StructuralPositionCopyWith<$Res>(_value.feelingFunction!, (value) {
      return _then(_value.copyWith(feelingFunction: value) as $Val);
    });
  }

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralPositionCopyWith<$Res>? get erosAxis {
    if (_value.erosAxis == null) {
      return null;
    }

    return $StructuralPositionCopyWith<$Res>(_value.erosAxis!, (value) {
      return _then(_value.copyWith(erosAxis: value) as $Val);
    });
  }

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelfDirectionPositionCopyWith<$Res>? get selfDirection {
    if (_value.selfDirection == null) {
      return null;
    }

    return $SelfDirectionPositionCopyWith<$Res>(_value.selfDirection!, (value) {
      return _then(_value.copyWith(selfDirection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StructuralPositionsImplCopyWith<$Res>
    implements $StructuralPositionsCopyWith<$Res> {
  factory _$$StructuralPositionsImplCopyWith(
    _$StructuralPositionsImpl value,
    $Res Function(_$StructuralPositionsImpl) then,
  ) = __$$StructuralPositionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'EGO') StructuralPosition? ego,
    @JsonKey(name: 'PERSONA') StructuralPosition? persona,
    @JsonKey(name: 'SHADOW') StructuralPosition? shadow,
    @JsonKey(name: 'FEELING_FUNCTION') StructuralPosition? feelingFunction,
    @JsonKey(name: 'EROS_AXIS') StructuralPosition? erosAxis,
    @JsonKey(name: 'SELF_DIRECTION') SelfDirectionPosition? selfDirection,
  });

  @override
  $StructuralPositionCopyWith<$Res>? get ego;
  @override
  $StructuralPositionCopyWith<$Res>? get persona;
  @override
  $StructuralPositionCopyWith<$Res>? get shadow;
  @override
  $StructuralPositionCopyWith<$Res>? get feelingFunction;
  @override
  $StructuralPositionCopyWith<$Res>? get erosAxis;
  @override
  $SelfDirectionPositionCopyWith<$Res>? get selfDirection;
}

/// @nodoc
class __$$StructuralPositionsImplCopyWithImpl<$Res>
    extends _$StructuralPositionsCopyWithImpl<$Res, _$StructuralPositionsImpl>
    implements _$$StructuralPositionsImplCopyWith<$Res> {
  __$$StructuralPositionsImplCopyWithImpl(
    _$StructuralPositionsImpl _value,
    $Res Function(_$StructuralPositionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ego = freezed,
    Object? persona = freezed,
    Object? shadow = freezed,
    Object? feelingFunction = freezed,
    Object? erosAxis = freezed,
    Object? selfDirection = freezed,
  }) {
    return _then(
      _$StructuralPositionsImpl(
        ego: freezed == ego
            ? _value.ego
            : ego // ignore: cast_nullable_to_non_nullable
                  as StructuralPosition?,
        persona: freezed == persona
            ? _value.persona
            : persona // ignore: cast_nullable_to_non_nullable
                  as StructuralPosition?,
        shadow: freezed == shadow
            ? _value.shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as StructuralPosition?,
        feelingFunction: freezed == feelingFunction
            ? _value.feelingFunction
            : feelingFunction // ignore: cast_nullable_to_non_nullable
                  as StructuralPosition?,
        erosAxis: freezed == erosAxis
            ? _value.erosAxis
            : erosAxis // ignore: cast_nullable_to_non_nullable
                  as StructuralPosition?,
        selfDirection: freezed == selfDirection
            ? _value.selfDirection
            : selfDirection // ignore: cast_nullable_to_non_nullable
                  as SelfDirectionPosition?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StructuralPositionsImpl implements _StructuralPositions {
  const _$StructuralPositionsImpl({
    @JsonKey(name: 'EGO') this.ego,
    @JsonKey(name: 'PERSONA') this.persona,
    @JsonKey(name: 'SHADOW') this.shadow,
    @JsonKey(name: 'FEELING_FUNCTION') this.feelingFunction,
    @JsonKey(name: 'EROS_AXIS') this.erosAxis,
    @JsonKey(name: 'SELF_DIRECTION') this.selfDirection,
  });

  factory _$StructuralPositionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructuralPositionsImplFromJson(json);

  @override
  @JsonKey(name: 'EGO')
  final StructuralPosition? ego;
  @override
  @JsonKey(name: 'PERSONA')
  final StructuralPosition? persona;
  @override
  @JsonKey(name: 'SHADOW')
  final StructuralPosition? shadow;
  @override
  @JsonKey(name: 'FEELING_FUNCTION')
  final StructuralPosition? feelingFunction;
  @override
  @JsonKey(name: 'EROS_AXIS')
  final StructuralPosition? erosAxis;
  @override
  @JsonKey(name: 'SELF_DIRECTION')
  final SelfDirectionPosition? selfDirection;

  @override
  String toString() {
    return 'StructuralPositions(ego: $ego, persona: $persona, shadow: $shadow, feelingFunction: $feelingFunction, erosAxis: $erosAxis, selfDirection: $selfDirection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructuralPositionsImpl &&
            (identical(other.ego, ego) || other.ego == ego) &&
            (identical(other.persona, persona) || other.persona == persona) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.feelingFunction, feelingFunction) ||
                other.feelingFunction == feelingFunction) &&
            (identical(other.erosAxis, erosAxis) ||
                other.erosAxis == erosAxis) &&
            (identical(other.selfDirection, selfDirection) ||
                other.selfDirection == selfDirection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    ego,
    persona,
    shadow,
    feelingFunction,
    erosAxis,
    selfDirection,
  );

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StructuralPositionsImplCopyWith<_$StructuralPositionsImpl> get copyWith =>
      __$$StructuralPositionsImplCopyWithImpl<_$StructuralPositionsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StructuralPositionsImplToJson(this);
  }
}

abstract class _StructuralPositions implements StructuralPositions {
  const factory _StructuralPositions({
    @JsonKey(name: 'EGO') final StructuralPosition? ego,
    @JsonKey(name: 'PERSONA') final StructuralPosition? persona,
    @JsonKey(name: 'SHADOW') final StructuralPosition? shadow,
    @JsonKey(name: 'FEELING_FUNCTION')
    final StructuralPosition? feelingFunction,
    @JsonKey(name: 'EROS_AXIS') final StructuralPosition? erosAxis,
    @JsonKey(name: 'SELF_DIRECTION') final SelfDirectionPosition? selfDirection,
  }) = _$StructuralPositionsImpl;

  factory _StructuralPositions.fromJson(Map<String, dynamic> json) =
      _$StructuralPositionsImpl.fromJson;

  @override
  @JsonKey(name: 'EGO')
  StructuralPosition? get ego;
  @override
  @JsonKey(name: 'PERSONA')
  StructuralPosition? get persona;
  @override
  @JsonKey(name: 'SHADOW')
  StructuralPosition? get shadow;
  @override
  @JsonKey(name: 'FEELING_FUNCTION')
  StructuralPosition? get feelingFunction;
  @override
  @JsonKey(name: 'EROS_AXIS')
  StructuralPosition? get erosAxis;
  @override
  @JsonKey(name: 'SELF_DIRECTION')
  SelfDirectionPosition? get selfDirection;

  /// Create a copy of StructuralPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StructuralPositionsImplCopyWith<_$StructuralPositionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelationshipConstellationData _$RelationshipConstellationDataFromJson(
  Map<String, dynamic> json,
) {
  return _RelationshipConstellationData.fromJson(json);
}

/// @nodoc
mixin _$RelationshipConstellationData {
  List<SharedMotifEntry> get shared => throw _privateConstructorUsedError;
  List<ComplementaryMotifEntry> get complementary =>
      throw _privateConstructorUsedError;
  List<TensionEntry> get tensions => throw _privateConstructorUsedError;
  FieldSummary? get field => throw _privateConstructorUsedError;

  /// Serializes this RelationshipConstellationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipConstellationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipConstellationDataCopyWith<RelationshipConstellationData>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipConstellationDataCopyWith<$Res> {
  factory $RelationshipConstellationDataCopyWith(
    RelationshipConstellationData value,
    $Res Function(RelationshipConstellationData) then,
  ) =
      _$RelationshipConstellationDataCopyWithImpl<
        $Res,
        RelationshipConstellationData
      >;
  @useResult
  $Res call({
    List<SharedMotifEntry> shared,
    List<ComplementaryMotifEntry> complementary,
    List<TensionEntry> tensions,
    FieldSummary? field,
  });

  $FieldSummaryCopyWith<$Res>? get field;
}

/// @nodoc
class _$RelationshipConstellationDataCopyWithImpl<
  $Res,
  $Val extends RelationshipConstellationData
>
    implements $RelationshipConstellationDataCopyWith<$Res> {
  _$RelationshipConstellationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipConstellationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shared = null,
    Object? complementary = null,
    Object? tensions = null,
    Object? field = freezed,
  }) {
    return _then(
      _value.copyWith(
            shared: null == shared
                ? _value.shared
                : shared // ignore: cast_nullable_to_non_nullable
                      as List<SharedMotifEntry>,
            complementary: null == complementary
                ? _value.complementary
                : complementary // ignore: cast_nullable_to_non_nullable
                      as List<ComplementaryMotifEntry>,
            tensions: null == tensions
                ? _value.tensions
                : tensions // ignore: cast_nullable_to_non_nullable
                      as List<TensionEntry>,
            field: freezed == field
                ? _value.field
                : field // ignore: cast_nullable_to_non_nullable
                      as FieldSummary?,
          )
          as $Val,
    );
  }

  /// Create a copy of RelationshipConstellationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FieldSummaryCopyWith<$Res>? get field {
    if (_value.field == null) {
      return null;
    }

    return $FieldSummaryCopyWith<$Res>(_value.field!, (value) {
      return _then(_value.copyWith(field: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RelationshipConstellationDataImplCopyWith<$Res>
    implements $RelationshipConstellationDataCopyWith<$Res> {
  factory _$$RelationshipConstellationDataImplCopyWith(
    _$RelationshipConstellationDataImpl value,
    $Res Function(_$RelationshipConstellationDataImpl) then,
  ) = __$$RelationshipConstellationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<SharedMotifEntry> shared,
    List<ComplementaryMotifEntry> complementary,
    List<TensionEntry> tensions,
    FieldSummary? field,
  });

  @override
  $FieldSummaryCopyWith<$Res>? get field;
}

/// @nodoc
class __$$RelationshipConstellationDataImplCopyWithImpl<$Res>
    extends
        _$RelationshipConstellationDataCopyWithImpl<
          $Res,
          _$RelationshipConstellationDataImpl
        >
    implements _$$RelationshipConstellationDataImplCopyWith<$Res> {
  __$$RelationshipConstellationDataImplCopyWithImpl(
    _$RelationshipConstellationDataImpl _value,
    $Res Function(_$RelationshipConstellationDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipConstellationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shared = null,
    Object? complementary = null,
    Object? tensions = null,
    Object? field = freezed,
  }) {
    return _then(
      _$RelationshipConstellationDataImpl(
        shared: null == shared
            ? _value._shared
            : shared // ignore: cast_nullable_to_non_nullable
                  as List<SharedMotifEntry>,
        complementary: null == complementary
            ? _value._complementary
            : complementary // ignore: cast_nullable_to_non_nullable
                  as List<ComplementaryMotifEntry>,
        tensions: null == tensions
            ? _value._tensions
            : tensions // ignore: cast_nullable_to_non_nullable
                  as List<TensionEntry>,
        field: freezed == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as FieldSummary?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipConstellationDataImpl
    implements _RelationshipConstellationData {
  const _$RelationshipConstellationDataImpl({
    final List<SharedMotifEntry> shared = const [],
    final List<ComplementaryMotifEntry> complementary = const [],
    final List<TensionEntry> tensions = const [],
    this.field,
  }) : _shared = shared,
       _complementary = complementary,
       _tensions = tensions;

  factory _$RelationshipConstellationDataImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RelationshipConstellationDataImplFromJson(json);

  final List<SharedMotifEntry> _shared;
  @override
  @JsonKey()
  List<SharedMotifEntry> get shared {
    if (_shared is EqualUnmodifiableListView) return _shared;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shared);
  }

  final List<ComplementaryMotifEntry> _complementary;
  @override
  @JsonKey()
  List<ComplementaryMotifEntry> get complementary {
    if (_complementary is EqualUnmodifiableListView) return _complementary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_complementary);
  }

  final List<TensionEntry> _tensions;
  @override
  @JsonKey()
  List<TensionEntry> get tensions {
    if (_tensions is EqualUnmodifiableListView) return _tensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tensions);
  }

  @override
  final FieldSummary? field;

  @override
  String toString() {
    return 'RelationshipConstellationData(shared: $shared, complementary: $complementary, tensions: $tensions, field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipConstellationDataImpl &&
            const DeepCollectionEquality().equals(other._shared, _shared) &&
            const DeepCollectionEquality().equals(
              other._complementary,
              _complementary,
            ) &&
            const DeepCollectionEquality().equals(other._tensions, _tensions) &&
            (identical(other.field, field) || other.field == field));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_shared),
    const DeepCollectionEquality().hash(_complementary),
    const DeepCollectionEquality().hash(_tensions),
    field,
  );

  /// Create a copy of RelationshipConstellationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipConstellationDataImplCopyWith<
    _$RelationshipConstellationDataImpl
  >
  get copyWith =>
      __$$RelationshipConstellationDataImplCopyWithImpl<
        _$RelationshipConstellationDataImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipConstellationDataImplToJson(this);
  }
}

abstract class _RelationshipConstellationData
    implements RelationshipConstellationData {
  const factory _RelationshipConstellationData({
    final List<SharedMotifEntry> shared,
    final List<ComplementaryMotifEntry> complementary,
    final List<TensionEntry> tensions,
    final FieldSummary? field,
  }) = _$RelationshipConstellationDataImpl;

  factory _RelationshipConstellationData.fromJson(Map<String, dynamic> json) =
      _$RelationshipConstellationDataImpl.fromJson;

  @override
  List<SharedMotifEntry> get shared;
  @override
  List<ComplementaryMotifEntry> get complementary;
  @override
  List<TensionEntry> get tensions;
  @override
  FieldSummary? get field;

  /// Create a copy of RelationshipConstellationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipConstellationDataImplCopyWith<
    _$RelationshipConstellationDataImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

SharedMotifEntry _$SharedMotifEntryFromJson(Map<String, dynamic> json) {
  return _SharedMotifEntry.fromJson(json);
}

/// @nodoc
mixin _$SharedMotifEntry {
  String get motif => throw _privateConstructorUsedError;
  double get meScore => throw _privateConstructorUsedError;
  double get partnerScore => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this SharedMotifEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SharedMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SharedMotifEntryCopyWith<SharedMotifEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedMotifEntryCopyWith<$Res> {
  factory $SharedMotifEntryCopyWith(
    SharedMotifEntry value,
    $Res Function(SharedMotifEntry) then,
  ) = _$SharedMotifEntryCopyWithImpl<$Res, SharedMotifEntry>;
  @useResult
  $Res call({
    String motif,
    double meScore,
    double partnerScore,
    String? label,
    String? description,
  });
}

/// @nodoc
class _$SharedMotifEntryCopyWithImpl<$Res, $Val extends SharedMotifEntry>
    implements $SharedMotifEntryCopyWith<$Res> {
  _$SharedMotifEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SharedMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motif = null,
    Object? meScore = null,
    Object? partnerScore = null,
    Object? label = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            motif: null == motif
                ? _value.motif
                : motif // ignore: cast_nullable_to_non_nullable
                      as String,
            meScore: null == meScore
                ? _value.meScore
                : meScore // ignore: cast_nullable_to_non_nullable
                      as double,
            partnerScore: null == partnerScore
                ? _value.partnerScore
                : partnerScore // ignore: cast_nullable_to_non_nullable
                      as double,
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SharedMotifEntryImplCopyWith<$Res>
    implements $SharedMotifEntryCopyWith<$Res> {
  factory _$$SharedMotifEntryImplCopyWith(
    _$SharedMotifEntryImpl value,
    $Res Function(_$SharedMotifEntryImpl) then,
  ) = __$$SharedMotifEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String motif,
    double meScore,
    double partnerScore,
    String? label,
    String? description,
  });
}

/// @nodoc
class __$$SharedMotifEntryImplCopyWithImpl<$Res>
    extends _$SharedMotifEntryCopyWithImpl<$Res, _$SharedMotifEntryImpl>
    implements _$$SharedMotifEntryImplCopyWith<$Res> {
  __$$SharedMotifEntryImplCopyWithImpl(
    _$SharedMotifEntryImpl _value,
    $Res Function(_$SharedMotifEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SharedMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motif = null,
    Object? meScore = null,
    Object? partnerScore = null,
    Object? label = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$SharedMotifEntryImpl(
        motif: null == motif
            ? _value.motif
            : motif // ignore: cast_nullable_to_non_nullable
                  as String,
        meScore: null == meScore
            ? _value.meScore
            : meScore // ignore: cast_nullable_to_non_nullable
                  as double,
        partnerScore: null == partnerScore
            ? _value.partnerScore
            : partnerScore // ignore: cast_nullable_to_non_nullable
                  as double,
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SharedMotifEntryImpl implements _SharedMotifEntry {
  const _$SharedMotifEntryImpl({
    required this.motif,
    required this.meScore,
    required this.partnerScore,
    this.label,
    this.description,
  });

  factory _$SharedMotifEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharedMotifEntryImplFromJson(json);

  @override
  final String motif;
  @override
  final double meScore;
  @override
  final double partnerScore;
  @override
  final String? label;
  @override
  final String? description;

  @override
  String toString() {
    return 'SharedMotifEntry(motif: $motif, meScore: $meScore, partnerScore: $partnerScore, label: $label, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedMotifEntryImpl &&
            (identical(other.motif, motif) || other.motif == motif) &&
            (identical(other.meScore, meScore) || other.meScore == meScore) &&
            (identical(other.partnerScore, partnerScore) ||
                other.partnerScore == partnerScore) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    motif,
    meScore,
    partnerScore,
    label,
    description,
  );

  /// Create a copy of SharedMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedMotifEntryImplCopyWith<_$SharedMotifEntryImpl> get copyWith =>
      __$$SharedMotifEntryImplCopyWithImpl<_$SharedMotifEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SharedMotifEntryImplToJson(this);
  }
}

abstract class _SharedMotifEntry implements SharedMotifEntry {
  const factory _SharedMotifEntry({
    required final String motif,
    required final double meScore,
    required final double partnerScore,
    final String? label,
    final String? description,
  }) = _$SharedMotifEntryImpl;

  factory _SharedMotifEntry.fromJson(Map<String, dynamic> json) =
      _$SharedMotifEntryImpl.fromJson;

  @override
  String get motif;
  @override
  double get meScore;
  @override
  double get partnerScore;
  @override
  String? get label;
  @override
  String? get description;

  /// Create a copy of SharedMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SharedMotifEntryImplCopyWith<_$SharedMotifEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ComplementaryMotifEntry _$ComplementaryMotifEntryFromJson(
  Map<String, dynamic> json,
) {
  return _ComplementaryMotifEntry.fromJson(json);
}

/// @nodoc
mixin _$ComplementaryMotifEntry {
  String get motif => throw _privateConstructorUsedError;
  String get highSide =>
      throw _privateConstructorUsedError; // 'me' or 'partner'
  double get delta => throw _privateConstructorUsedError;
  double? get meScore => throw _privateConstructorUsedError;
  double? get partnerScore => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this ComplementaryMotifEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComplementaryMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComplementaryMotifEntryCopyWith<ComplementaryMotifEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplementaryMotifEntryCopyWith<$Res> {
  factory $ComplementaryMotifEntryCopyWith(
    ComplementaryMotifEntry value,
    $Res Function(ComplementaryMotifEntry) then,
  ) = _$ComplementaryMotifEntryCopyWithImpl<$Res, ComplementaryMotifEntry>;
  @useResult
  $Res call({
    String motif,
    String highSide,
    double delta,
    double? meScore,
    double? partnerScore,
    String? label,
    String? description,
  });
}

/// @nodoc
class _$ComplementaryMotifEntryCopyWithImpl<
  $Res,
  $Val extends ComplementaryMotifEntry
>
    implements $ComplementaryMotifEntryCopyWith<$Res> {
  _$ComplementaryMotifEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComplementaryMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motif = null,
    Object? highSide = null,
    Object? delta = null,
    Object? meScore = freezed,
    Object? partnerScore = freezed,
    Object? label = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            motif: null == motif
                ? _value.motif
                : motif // ignore: cast_nullable_to_non_nullable
                      as String,
            highSide: null == highSide
                ? _value.highSide
                : highSide // ignore: cast_nullable_to_non_nullable
                      as String,
            delta: null == delta
                ? _value.delta
                : delta // ignore: cast_nullable_to_non_nullable
                      as double,
            meScore: freezed == meScore
                ? _value.meScore
                : meScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            partnerScore: freezed == partnerScore
                ? _value.partnerScore
                : partnerScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ComplementaryMotifEntryImplCopyWith<$Res>
    implements $ComplementaryMotifEntryCopyWith<$Res> {
  factory _$$ComplementaryMotifEntryImplCopyWith(
    _$ComplementaryMotifEntryImpl value,
    $Res Function(_$ComplementaryMotifEntryImpl) then,
  ) = __$$ComplementaryMotifEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String motif,
    String highSide,
    double delta,
    double? meScore,
    double? partnerScore,
    String? label,
    String? description,
  });
}

/// @nodoc
class __$$ComplementaryMotifEntryImplCopyWithImpl<$Res>
    extends
        _$ComplementaryMotifEntryCopyWithImpl<
          $Res,
          _$ComplementaryMotifEntryImpl
        >
    implements _$$ComplementaryMotifEntryImplCopyWith<$Res> {
  __$$ComplementaryMotifEntryImplCopyWithImpl(
    _$ComplementaryMotifEntryImpl _value,
    $Res Function(_$ComplementaryMotifEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ComplementaryMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motif = null,
    Object? highSide = null,
    Object? delta = null,
    Object? meScore = freezed,
    Object? partnerScore = freezed,
    Object? label = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$ComplementaryMotifEntryImpl(
        motif: null == motif
            ? _value.motif
            : motif // ignore: cast_nullable_to_non_nullable
                  as String,
        highSide: null == highSide
            ? _value.highSide
            : highSide // ignore: cast_nullable_to_non_nullable
                  as String,
        delta: null == delta
            ? _value.delta
            : delta // ignore: cast_nullable_to_non_nullable
                  as double,
        meScore: freezed == meScore
            ? _value.meScore
            : meScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        partnerScore: freezed == partnerScore
            ? _value.partnerScore
            : partnerScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ComplementaryMotifEntryImpl implements _ComplementaryMotifEntry {
  const _$ComplementaryMotifEntryImpl({
    required this.motif,
    required this.highSide,
    required this.delta,
    this.meScore,
    this.partnerScore,
    this.label,
    this.description,
  });

  factory _$ComplementaryMotifEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplementaryMotifEntryImplFromJson(json);

  @override
  final String motif;
  @override
  final String highSide;
  // 'me' or 'partner'
  @override
  final double delta;
  @override
  final double? meScore;
  @override
  final double? partnerScore;
  @override
  final String? label;
  @override
  final String? description;

  @override
  String toString() {
    return 'ComplementaryMotifEntry(motif: $motif, highSide: $highSide, delta: $delta, meScore: $meScore, partnerScore: $partnerScore, label: $label, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplementaryMotifEntryImpl &&
            (identical(other.motif, motif) || other.motif == motif) &&
            (identical(other.highSide, highSide) ||
                other.highSide == highSide) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.meScore, meScore) || other.meScore == meScore) &&
            (identical(other.partnerScore, partnerScore) ||
                other.partnerScore == partnerScore) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    motif,
    highSide,
    delta,
    meScore,
    partnerScore,
    label,
    description,
  );

  /// Create a copy of ComplementaryMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplementaryMotifEntryImplCopyWith<_$ComplementaryMotifEntryImpl>
  get copyWith =>
      __$$ComplementaryMotifEntryImplCopyWithImpl<
        _$ComplementaryMotifEntryImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplementaryMotifEntryImplToJson(this);
  }
}

abstract class _ComplementaryMotifEntry implements ComplementaryMotifEntry {
  const factory _ComplementaryMotifEntry({
    required final String motif,
    required final String highSide,
    required final double delta,
    final double? meScore,
    final double? partnerScore,
    final String? label,
    final String? description,
  }) = _$ComplementaryMotifEntryImpl;

  factory _ComplementaryMotifEntry.fromJson(Map<String, dynamic> json) =
      _$ComplementaryMotifEntryImpl.fromJson;

  @override
  String get motif;
  @override
  String get highSide; // 'me' or 'partner'
  @override
  double get delta;
  @override
  double? get meScore;
  @override
  double? get partnerScore;
  @override
  String? get label;
  @override
  String? get description;

  /// Create a copy of ComplementaryMotifEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComplementaryMotifEntryImplCopyWith<_$ComplementaryMotifEntryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TensionEntry _$TensionEntryFromJson(Map<String, dynamic> json) {
  return _TensionEntry.fromJson(json);
}

/// @nodoc
mixin _$TensionEntry {
  List<String> get pair => throw _privateConstructorUsedError;
  String get direction =>
      throw _privateConstructorUsedError; // 'me_vs_partner' or 'partner_vs_me'
  String? get theme => throw _privateConstructorUsedError;
  String? get themeLabel => throw _privateConstructorUsedError;
  double get strength => throw _privateConstructorUsedError;
  List<String?> get labels => throw _privateConstructorUsedError;

  /// Serializes this TensionEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TensionEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TensionEntryCopyWith<TensionEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TensionEntryCopyWith<$Res> {
  factory $TensionEntryCopyWith(
    TensionEntry value,
    $Res Function(TensionEntry) then,
  ) = _$TensionEntryCopyWithImpl<$Res, TensionEntry>;
  @useResult
  $Res call({
    List<String> pair,
    String direction,
    String? theme,
    String? themeLabel,
    double strength,
    List<String?> labels,
  });
}

/// @nodoc
class _$TensionEntryCopyWithImpl<$Res, $Val extends TensionEntry>
    implements $TensionEntryCopyWith<$Res> {
  _$TensionEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TensionEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pair = null,
    Object? direction = null,
    Object? theme = freezed,
    Object? themeLabel = freezed,
    Object? strength = null,
    Object? labels = null,
  }) {
    return _then(
      _value.copyWith(
            pair: null == pair
                ? _value.pair
                : pair // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as String,
            theme: freezed == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as String?,
            themeLabel: freezed == themeLabel
                ? _value.themeLabel
                : themeLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            strength: null == strength
                ? _value.strength
                : strength // ignore: cast_nullable_to_non_nullable
                      as double,
            labels: null == labels
                ? _value.labels
                : labels // ignore: cast_nullable_to_non_nullable
                      as List<String?>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TensionEntryImplCopyWith<$Res>
    implements $TensionEntryCopyWith<$Res> {
  factory _$$TensionEntryImplCopyWith(
    _$TensionEntryImpl value,
    $Res Function(_$TensionEntryImpl) then,
  ) = __$$TensionEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> pair,
    String direction,
    String? theme,
    String? themeLabel,
    double strength,
    List<String?> labels,
  });
}

/// @nodoc
class __$$TensionEntryImplCopyWithImpl<$Res>
    extends _$TensionEntryCopyWithImpl<$Res, _$TensionEntryImpl>
    implements _$$TensionEntryImplCopyWith<$Res> {
  __$$TensionEntryImplCopyWithImpl(
    _$TensionEntryImpl _value,
    $Res Function(_$TensionEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TensionEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pair = null,
    Object? direction = null,
    Object? theme = freezed,
    Object? themeLabel = freezed,
    Object? strength = null,
    Object? labels = null,
  }) {
    return _then(
      _$TensionEntryImpl(
        pair: null == pair
            ? _value._pair
            : pair // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as String,
        theme: freezed == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as String?,
        themeLabel: freezed == themeLabel
            ? _value.themeLabel
            : themeLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        strength: null == strength
            ? _value.strength
            : strength // ignore: cast_nullable_to_non_nullable
                  as double,
        labels: null == labels
            ? _value._labels
            : labels // ignore: cast_nullable_to_non_nullable
                  as List<String?>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TensionEntryImpl implements _TensionEntry {
  const _$TensionEntryImpl({
    required final List<String> pair,
    required this.direction,
    this.theme,
    this.themeLabel,
    required this.strength,
    final List<String?> labels = const [],
  }) : _pair = pair,
       _labels = labels;

  factory _$TensionEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TensionEntryImplFromJson(json);

  final List<String> _pair;
  @override
  List<String> get pair {
    if (_pair is EqualUnmodifiableListView) return _pair;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pair);
  }

  @override
  final String direction;
  // 'me_vs_partner' or 'partner_vs_me'
  @override
  final String? theme;
  @override
  final String? themeLabel;
  @override
  final double strength;
  final List<String?> _labels;
  @override
  @JsonKey()
  List<String?> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  String toString() {
    return 'TensionEntry(pair: $pair, direction: $direction, theme: $theme, themeLabel: $themeLabel, strength: $strength, labels: $labels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TensionEntryImpl &&
            const DeepCollectionEquality().equals(other._pair, _pair) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.themeLabel, themeLabel) ||
                other.themeLabel == themeLabel) &&
            (identical(other.strength, strength) ||
                other.strength == strength) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_pair),
    direction,
    theme,
    themeLabel,
    strength,
    const DeepCollectionEquality().hash(_labels),
  );

  /// Create a copy of TensionEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TensionEntryImplCopyWith<_$TensionEntryImpl> get copyWith =>
      __$$TensionEntryImplCopyWithImpl<_$TensionEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TensionEntryImplToJson(this);
  }
}

abstract class _TensionEntry implements TensionEntry {
  const factory _TensionEntry({
    required final List<String> pair,
    required final String direction,
    final String? theme,
    final String? themeLabel,
    required final double strength,
    final List<String?> labels,
  }) = _$TensionEntryImpl;

  factory _TensionEntry.fromJson(Map<String, dynamic> json) =
      _$TensionEntryImpl.fromJson;

  @override
  List<String> get pair;
  @override
  String get direction; // 'me_vs_partner' or 'partner_vs_me'
  @override
  String? get theme;
  @override
  String? get themeLabel;
  @override
  double get strength;
  @override
  List<String?> get labels;

  /// Create a copy of TensionEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TensionEntryImplCopyWith<_$TensionEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FieldSummary _$FieldSummaryFromJson(Map<String, dynamic> json) {
  return _FieldSummary.fromJson(json);
}

/// @nodoc
mixin _$FieldSummary {
  String get label => throw _privateConstructorUsedError;
  List<String> get primaryThemes => throw _privateConstructorUsedError;
  List<String> get riskLoops => throw _privateConstructorUsedError;

  /// Serializes this FieldSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FieldSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldSummaryCopyWith<FieldSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldSummaryCopyWith<$Res> {
  factory $FieldSummaryCopyWith(
    FieldSummary value,
    $Res Function(FieldSummary) then,
  ) = _$FieldSummaryCopyWithImpl<$Res, FieldSummary>;
  @useResult
  $Res call({String label, List<String> primaryThemes, List<String> riskLoops});
}

/// @nodoc
class _$FieldSummaryCopyWithImpl<$Res, $Val extends FieldSummary>
    implements $FieldSummaryCopyWith<$Res> {
  _$FieldSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FieldSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? primaryThemes = null,
    Object? riskLoops = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            primaryThemes: null == primaryThemes
                ? _value.primaryThemes
                : primaryThemes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            riskLoops: null == riskLoops
                ? _value.riskLoops
                : riskLoops // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FieldSummaryImplCopyWith<$Res>
    implements $FieldSummaryCopyWith<$Res> {
  factory _$$FieldSummaryImplCopyWith(
    _$FieldSummaryImpl value,
    $Res Function(_$FieldSummaryImpl) then,
  ) = __$$FieldSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, List<String> primaryThemes, List<String> riskLoops});
}

/// @nodoc
class __$$FieldSummaryImplCopyWithImpl<$Res>
    extends _$FieldSummaryCopyWithImpl<$Res, _$FieldSummaryImpl>
    implements _$$FieldSummaryImplCopyWith<$Res> {
  __$$FieldSummaryImplCopyWithImpl(
    _$FieldSummaryImpl _value,
    $Res Function(_$FieldSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FieldSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? primaryThemes = null,
    Object? riskLoops = null,
  }) {
    return _then(
      _$FieldSummaryImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        primaryThemes: null == primaryThemes
            ? _value._primaryThemes
            : primaryThemes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        riskLoops: null == riskLoops
            ? _value._riskLoops
            : riskLoops // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldSummaryImpl implements _FieldSummary {
  const _$FieldSummaryImpl({
    required this.label,
    final List<String> primaryThemes = const [],
    final List<String> riskLoops = const [],
  }) : _primaryThemes = primaryThemes,
       _riskLoops = riskLoops;

  factory _$FieldSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldSummaryImplFromJson(json);

  @override
  final String label;
  final List<String> _primaryThemes;
  @override
  @JsonKey()
  List<String> get primaryThemes {
    if (_primaryThemes is EqualUnmodifiableListView) return _primaryThemes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_primaryThemes);
  }

  final List<String> _riskLoops;
  @override
  @JsonKey()
  List<String> get riskLoops {
    if (_riskLoops is EqualUnmodifiableListView) return _riskLoops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_riskLoops);
  }

  @override
  String toString() {
    return 'FieldSummary(label: $label, primaryThemes: $primaryThemes, riskLoops: $riskLoops)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldSummaryImpl &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(
              other._primaryThemes,
              _primaryThemes,
            ) &&
            const DeepCollectionEquality().equals(
              other._riskLoops,
              _riskLoops,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    label,
    const DeepCollectionEquality().hash(_primaryThemes),
    const DeepCollectionEquality().hash(_riskLoops),
  );

  /// Create a copy of FieldSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldSummaryImplCopyWith<_$FieldSummaryImpl> get copyWith =>
      __$$FieldSummaryImplCopyWithImpl<_$FieldSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldSummaryImplToJson(this);
  }
}

abstract class _FieldSummary implements FieldSummary {
  const factory _FieldSummary({
    required final String label,
    final List<String> primaryThemes,
    final List<String> riskLoops,
  }) = _$FieldSummaryImpl;

  factory _FieldSummary.fromJson(Map<String, dynamic> json) =
      _$FieldSummaryImpl.fromJson;

  @override
  String get label;
  @override
  List<String> get primaryThemes;
  @override
  List<String> get riskLoops;

  /// Create a copy of FieldSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldSummaryImplCopyWith<_$FieldSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MeSummary _$MeSummaryFromJson(Map<String, dynamic> json) {
  return _MeSummary.fromJson(json);
}

/// @nodoc
mixin _$MeSummary {
  String? get runId => throw _privateConstructorUsedError;
  List<MotifEntry> get motifDistribution => throw _privateConstructorUsedError;

  /// Serializes this MeSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeSummaryCopyWith<MeSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeSummaryCopyWith<$Res> {
  factory $MeSummaryCopyWith(MeSummary value, $Res Function(MeSummary) then) =
      _$MeSummaryCopyWithImpl<$Res, MeSummary>;
  @useResult
  $Res call({String? runId, List<MotifEntry> motifDistribution});
}

/// @nodoc
class _$MeSummaryCopyWithImpl<$Res, $Val extends MeSummary>
    implements $MeSummaryCopyWith<$Res> {
  _$MeSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? runId = freezed, Object? motifDistribution = null}) {
    return _then(
      _value.copyWith(
            runId: freezed == runId
                ? _value.runId
                : runId // ignore: cast_nullable_to_non_nullable
                      as String?,
            motifDistribution: null == motifDistribution
                ? _value.motifDistribution
                : motifDistribution // ignore: cast_nullable_to_non_nullable
                      as List<MotifEntry>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MeSummaryImplCopyWith<$Res>
    implements $MeSummaryCopyWith<$Res> {
  factory _$$MeSummaryImplCopyWith(
    _$MeSummaryImpl value,
    $Res Function(_$MeSummaryImpl) then,
  ) = __$$MeSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? runId, List<MotifEntry> motifDistribution});
}

/// @nodoc
class __$$MeSummaryImplCopyWithImpl<$Res>
    extends _$MeSummaryCopyWithImpl<$Res, _$MeSummaryImpl>
    implements _$$MeSummaryImplCopyWith<$Res> {
  __$$MeSummaryImplCopyWithImpl(
    _$MeSummaryImpl _value,
    $Res Function(_$MeSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MeSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? runId = freezed, Object? motifDistribution = null}) {
    return _then(
      _$MeSummaryImpl(
        runId: freezed == runId
            ? _value.runId
            : runId // ignore: cast_nullable_to_non_nullable
                  as String?,
        motifDistribution: null == motifDistribution
            ? _value._motifDistribution
            : motifDistribution // ignore: cast_nullable_to_non_nullable
                  as List<MotifEntry>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MeSummaryImpl implements _MeSummary {
  const _$MeSummaryImpl({
    this.runId,
    final List<MotifEntry> motifDistribution = const [],
  }) : _motifDistribution = motifDistribution;

  factory _$MeSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeSummaryImplFromJson(json);

  @override
  final String? runId;
  final List<MotifEntry> _motifDistribution;
  @override
  @JsonKey()
  List<MotifEntry> get motifDistribution {
    if (_motifDistribution is EqualUnmodifiableListView)
      return _motifDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_motifDistribution);
  }

  @override
  String toString() {
    return 'MeSummary(runId: $runId, motifDistribution: $motifDistribution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeSummaryImpl &&
            (identical(other.runId, runId) || other.runId == runId) &&
            const DeepCollectionEquality().equals(
              other._motifDistribution,
              _motifDistribution,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    runId,
    const DeepCollectionEquality().hash(_motifDistribution),
  );

  /// Create a copy of MeSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeSummaryImplCopyWith<_$MeSummaryImpl> get copyWith =>
      __$$MeSummaryImplCopyWithImpl<_$MeSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeSummaryImplToJson(this);
  }
}

abstract class _MeSummary implements MeSummary {
  const factory _MeSummary({
    final String? runId,
    final List<MotifEntry> motifDistribution,
  }) = _$MeSummaryImpl;

  factory _MeSummary.fromJson(Map<String, dynamic> json) =
      _$MeSummaryImpl.fromJson;

  @override
  String? get runId;
  @override
  List<MotifEntry> get motifDistribution;

  /// Create a copy of MeSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeSummaryImplCopyWith<_$MeSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PsycheModel _$PsycheModelFromJson(Map<String, dynamic> json) {
  return _PsycheModel.fromJson(json);
}

/// @nodoc
mixin _$PsycheModel {
  String get runId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError; // 'ME' or 'REL'
  String get createdAt => throw _privateConstructorUsedError;
  InputHashes? get inputHashes => throw _privateConstructorUsedError;
  EngineVersions? get engineVersions =>
      throw _privateConstructorUsedError; // ME context: Structural positions (authoritative source)
  StructuralPositions? get structuralPositions =>
      throw _privateConstructorUsedError; // ME context: Motif data
  List<MotifEntry> get motifDistribution => throw _privateConstructorUsedError;
  List<MotifEntry> get shadowMotifs =>
      throw _privateConstructorUsedError; // UI mapping
  UiLabelMapping? get uiLabelMapping =>
      throw _privateConstructorUsedError; // Stability analysis
  StabilityAnalysis? get stability =>
      throw _privateConstructorUsedError; // Quality flags
  List<String> get qualityFlags =>
      throw _privateConstructorUsedError; // REL context: Partner structural positions
  @JsonKey(name: 'partnerStructuralPositions')
  StructuralPositions? get partnerStructuralPositions =>
      throw _privateConstructorUsedError; // REL context: Partner motif data
  List<MotifEntry> get partnerMotifDistribution =>
      throw _privateConstructorUsedError;
  List<MotifEntry> get partnerShadowMotifs =>
      throw _privateConstructorUsedError; // REL context: Partner UI mapping
  @JsonKey(name: 'partnerUiLabelMapping')
  UiLabelMapping? get partnerUiLabelMapping =>
      throw _privateConstructorUsedError; // REL context: Relationship constellation
  RelationshipConstellationData? get relationshipConstellation =>
      throw _privateConstructorUsedError; // REL context: Me summary for comparison
  MeSummary? get meSummary => throw _privateConstructorUsedError;

  /// Serializes this PsycheModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PsycheModelCopyWith<PsycheModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PsycheModelCopyWith<$Res> {
  factory $PsycheModelCopyWith(
    PsycheModel value,
    $Res Function(PsycheModel) then,
  ) = _$PsycheModelCopyWithImpl<$Res, PsycheModel>;
  @useResult
  $Res call({
    String runId,
    String userId,
    String context,
    String createdAt,
    InputHashes? inputHashes,
    EngineVersions? engineVersions,
    StructuralPositions? structuralPositions,
    List<MotifEntry> motifDistribution,
    List<MotifEntry> shadowMotifs,
    UiLabelMapping? uiLabelMapping,
    StabilityAnalysis? stability,
    List<String> qualityFlags,
    @JsonKey(name: 'partnerStructuralPositions')
    StructuralPositions? partnerStructuralPositions,
    List<MotifEntry> partnerMotifDistribution,
    List<MotifEntry> partnerShadowMotifs,
    @JsonKey(name: 'partnerUiLabelMapping')
    UiLabelMapping? partnerUiLabelMapping,
    RelationshipConstellationData? relationshipConstellation,
    MeSummary? meSummary,
  });

  $InputHashesCopyWith<$Res>? get inputHashes;
  $EngineVersionsCopyWith<$Res>? get engineVersions;
  $StructuralPositionsCopyWith<$Res>? get structuralPositions;
  $UiLabelMappingCopyWith<$Res>? get uiLabelMapping;
  $StabilityAnalysisCopyWith<$Res>? get stability;
  $StructuralPositionsCopyWith<$Res>? get partnerStructuralPositions;
  $UiLabelMappingCopyWith<$Res>? get partnerUiLabelMapping;
  $RelationshipConstellationDataCopyWith<$Res>? get relationshipConstellation;
  $MeSummaryCopyWith<$Res>? get meSummary;
}

/// @nodoc
class _$PsycheModelCopyWithImpl<$Res, $Val extends PsycheModel>
    implements $PsycheModelCopyWith<$Res> {
  _$PsycheModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? userId = null,
    Object? context = null,
    Object? createdAt = null,
    Object? inputHashes = freezed,
    Object? engineVersions = freezed,
    Object? structuralPositions = freezed,
    Object? motifDistribution = null,
    Object? shadowMotifs = null,
    Object? uiLabelMapping = freezed,
    Object? stability = freezed,
    Object? qualityFlags = null,
    Object? partnerStructuralPositions = freezed,
    Object? partnerMotifDistribution = null,
    Object? partnerShadowMotifs = null,
    Object? partnerUiLabelMapping = freezed,
    Object? relationshipConstellation = freezed,
    Object? meSummary = freezed,
  }) {
    return _then(
      _value.copyWith(
            runId: null == runId
                ? _value.runId
                : runId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            context: null == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            inputHashes: freezed == inputHashes
                ? _value.inputHashes
                : inputHashes // ignore: cast_nullable_to_non_nullable
                      as InputHashes?,
            engineVersions: freezed == engineVersions
                ? _value.engineVersions
                : engineVersions // ignore: cast_nullable_to_non_nullable
                      as EngineVersions?,
            structuralPositions: freezed == structuralPositions
                ? _value.structuralPositions
                : structuralPositions // ignore: cast_nullable_to_non_nullable
                      as StructuralPositions?,
            motifDistribution: null == motifDistribution
                ? _value.motifDistribution
                : motifDistribution // ignore: cast_nullable_to_non_nullable
                      as List<MotifEntry>,
            shadowMotifs: null == shadowMotifs
                ? _value.shadowMotifs
                : shadowMotifs // ignore: cast_nullable_to_non_nullable
                      as List<MotifEntry>,
            uiLabelMapping: freezed == uiLabelMapping
                ? _value.uiLabelMapping
                : uiLabelMapping // ignore: cast_nullable_to_non_nullable
                      as UiLabelMapping?,
            stability: freezed == stability
                ? _value.stability
                : stability // ignore: cast_nullable_to_non_nullable
                      as StabilityAnalysis?,
            qualityFlags: null == qualityFlags
                ? _value.qualityFlags
                : qualityFlags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            partnerStructuralPositions: freezed == partnerStructuralPositions
                ? _value.partnerStructuralPositions
                : partnerStructuralPositions // ignore: cast_nullable_to_non_nullable
                      as StructuralPositions?,
            partnerMotifDistribution: null == partnerMotifDistribution
                ? _value.partnerMotifDistribution
                : partnerMotifDistribution // ignore: cast_nullable_to_non_nullable
                      as List<MotifEntry>,
            partnerShadowMotifs: null == partnerShadowMotifs
                ? _value.partnerShadowMotifs
                : partnerShadowMotifs // ignore: cast_nullable_to_non_nullable
                      as List<MotifEntry>,
            partnerUiLabelMapping: freezed == partnerUiLabelMapping
                ? _value.partnerUiLabelMapping
                : partnerUiLabelMapping // ignore: cast_nullable_to_non_nullable
                      as UiLabelMapping?,
            relationshipConstellation: freezed == relationshipConstellation
                ? _value.relationshipConstellation
                : relationshipConstellation // ignore: cast_nullable_to_non_nullable
                      as RelationshipConstellationData?,
            meSummary: freezed == meSummary
                ? _value.meSummary
                : meSummary // ignore: cast_nullable_to_non_nullable
                      as MeSummary?,
          )
          as $Val,
    );
  }

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputHashesCopyWith<$Res>? get inputHashes {
    if (_value.inputHashes == null) {
      return null;
    }

    return $InputHashesCopyWith<$Res>(_value.inputHashes!, (value) {
      return _then(_value.copyWith(inputHashes: value) as $Val);
    });
  }

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EngineVersionsCopyWith<$Res>? get engineVersions {
    if (_value.engineVersions == null) {
      return null;
    }

    return $EngineVersionsCopyWith<$Res>(_value.engineVersions!, (value) {
      return _then(_value.copyWith(engineVersions: value) as $Val);
    });
  }

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralPositionsCopyWith<$Res>? get structuralPositions {
    if (_value.structuralPositions == null) {
      return null;
    }

    return $StructuralPositionsCopyWith<$Res>(_value.structuralPositions!, (
      value,
    ) {
      return _then(_value.copyWith(structuralPositions: value) as $Val);
    });
  }

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiLabelMappingCopyWith<$Res>? get uiLabelMapping {
    if (_value.uiLabelMapping == null) {
      return null;
    }

    return $UiLabelMappingCopyWith<$Res>(_value.uiLabelMapping!, (value) {
      return _then(_value.copyWith(uiLabelMapping: value) as $Val);
    });
  }

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StabilityAnalysisCopyWith<$Res>? get stability {
    if (_value.stability == null) {
      return null;
    }

    return $StabilityAnalysisCopyWith<$Res>(_value.stability!, (value) {
      return _then(_value.copyWith(stability: value) as $Val);
    });
  }

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralPositionsCopyWith<$Res>? get partnerStructuralPositions {
    if (_value.partnerStructuralPositions == null) {
      return null;
    }

    return $StructuralPositionsCopyWith<$Res>(
      _value.partnerStructuralPositions!,
      (value) {
        return _then(
          _value.copyWith(partnerStructuralPositions: value) as $Val,
        );
      },
    );
  }

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiLabelMappingCopyWith<$Res>? get partnerUiLabelMapping {
    if (_value.partnerUiLabelMapping == null) {
      return null;
    }

    return $UiLabelMappingCopyWith<$Res>(_value.partnerUiLabelMapping!, (
      value,
    ) {
      return _then(_value.copyWith(partnerUiLabelMapping: value) as $Val);
    });
  }

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipConstellationDataCopyWith<$Res>? get relationshipConstellation {
    if (_value.relationshipConstellation == null) {
      return null;
    }

    return $RelationshipConstellationDataCopyWith<$Res>(
      _value.relationshipConstellation!,
      (value) {
        return _then(_value.copyWith(relationshipConstellation: value) as $Val);
      },
    );
  }

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MeSummaryCopyWith<$Res>? get meSummary {
    if (_value.meSummary == null) {
      return null;
    }

    return $MeSummaryCopyWith<$Res>(_value.meSummary!, (value) {
      return _then(_value.copyWith(meSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PsycheModelImplCopyWith<$Res>
    implements $PsycheModelCopyWith<$Res> {
  factory _$$PsycheModelImplCopyWith(
    _$PsycheModelImpl value,
    $Res Function(_$PsycheModelImpl) then,
  ) = __$$PsycheModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String runId,
    String userId,
    String context,
    String createdAt,
    InputHashes? inputHashes,
    EngineVersions? engineVersions,
    StructuralPositions? structuralPositions,
    List<MotifEntry> motifDistribution,
    List<MotifEntry> shadowMotifs,
    UiLabelMapping? uiLabelMapping,
    StabilityAnalysis? stability,
    List<String> qualityFlags,
    @JsonKey(name: 'partnerStructuralPositions')
    StructuralPositions? partnerStructuralPositions,
    List<MotifEntry> partnerMotifDistribution,
    List<MotifEntry> partnerShadowMotifs,
    @JsonKey(name: 'partnerUiLabelMapping')
    UiLabelMapping? partnerUiLabelMapping,
    RelationshipConstellationData? relationshipConstellation,
    MeSummary? meSummary,
  });

  @override
  $InputHashesCopyWith<$Res>? get inputHashes;
  @override
  $EngineVersionsCopyWith<$Res>? get engineVersions;
  @override
  $StructuralPositionsCopyWith<$Res>? get structuralPositions;
  @override
  $UiLabelMappingCopyWith<$Res>? get uiLabelMapping;
  @override
  $StabilityAnalysisCopyWith<$Res>? get stability;
  @override
  $StructuralPositionsCopyWith<$Res>? get partnerStructuralPositions;
  @override
  $UiLabelMappingCopyWith<$Res>? get partnerUiLabelMapping;
  @override
  $RelationshipConstellationDataCopyWith<$Res>? get relationshipConstellation;
  @override
  $MeSummaryCopyWith<$Res>? get meSummary;
}

/// @nodoc
class __$$PsycheModelImplCopyWithImpl<$Res>
    extends _$PsycheModelCopyWithImpl<$Res, _$PsycheModelImpl>
    implements _$$PsycheModelImplCopyWith<$Res> {
  __$$PsycheModelImplCopyWithImpl(
    _$PsycheModelImpl _value,
    $Res Function(_$PsycheModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? userId = null,
    Object? context = null,
    Object? createdAt = null,
    Object? inputHashes = freezed,
    Object? engineVersions = freezed,
    Object? structuralPositions = freezed,
    Object? motifDistribution = null,
    Object? shadowMotifs = null,
    Object? uiLabelMapping = freezed,
    Object? stability = freezed,
    Object? qualityFlags = null,
    Object? partnerStructuralPositions = freezed,
    Object? partnerMotifDistribution = null,
    Object? partnerShadowMotifs = null,
    Object? partnerUiLabelMapping = freezed,
    Object? relationshipConstellation = freezed,
    Object? meSummary = freezed,
  }) {
    return _then(
      _$PsycheModelImpl(
        runId: null == runId
            ? _value.runId
            : runId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        context: null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        inputHashes: freezed == inputHashes
            ? _value.inputHashes
            : inputHashes // ignore: cast_nullable_to_non_nullable
                  as InputHashes?,
        engineVersions: freezed == engineVersions
            ? _value.engineVersions
            : engineVersions // ignore: cast_nullable_to_non_nullable
                  as EngineVersions?,
        structuralPositions: freezed == structuralPositions
            ? _value.structuralPositions
            : structuralPositions // ignore: cast_nullable_to_non_nullable
                  as StructuralPositions?,
        motifDistribution: null == motifDistribution
            ? _value._motifDistribution
            : motifDistribution // ignore: cast_nullable_to_non_nullable
                  as List<MotifEntry>,
        shadowMotifs: null == shadowMotifs
            ? _value._shadowMotifs
            : shadowMotifs // ignore: cast_nullable_to_non_nullable
                  as List<MotifEntry>,
        uiLabelMapping: freezed == uiLabelMapping
            ? _value.uiLabelMapping
            : uiLabelMapping // ignore: cast_nullable_to_non_nullable
                  as UiLabelMapping?,
        stability: freezed == stability
            ? _value.stability
            : stability // ignore: cast_nullable_to_non_nullable
                  as StabilityAnalysis?,
        qualityFlags: null == qualityFlags
            ? _value._qualityFlags
            : qualityFlags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        partnerStructuralPositions: freezed == partnerStructuralPositions
            ? _value.partnerStructuralPositions
            : partnerStructuralPositions // ignore: cast_nullable_to_non_nullable
                  as StructuralPositions?,
        partnerMotifDistribution: null == partnerMotifDistribution
            ? _value._partnerMotifDistribution
            : partnerMotifDistribution // ignore: cast_nullable_to_non_nullable
                  as List<MotifEntry>,
        partnerShadowMotifs: null == partnerShadowMotifs
            ? _value._partnerShadowMotifs
            : partnerShadowMotifs // ignore: cast_nullable_to_non_nullable
                  as List<MotifEntry>,
        partnerUiLabelMapping: freezed == partnerUiLabelMapping
            ? _value.partnerUiLabelMapping
            : partnerUiLabelMapping // ignore: cast_nullable_to_non_nullable
                  as UiLabelMapping?,
        relationshipConstellation: freezed == relationshipConstellation
            ? _value.relationshipConstellation
            : relationshipConstellation // ignore: cast_nullable_to_non_nullable
                  as RelationshipConstellationData?,
        meSummary: freezed == meSummary
            ? _value.meSummary
            : meSummary // ignore: cast_nullable_to_non_nullable
                  as MeSummary?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PsycheModelImpl implements _PsycheModel {
  const _$PsycheModelImpl({
    required this.runId,
    required this.userId,
    required this.context,
    required this.createdAt,
    this.inputHashes,
    this.engineVersions,
    this.structuralPositions,
    final List<MotifEntry> motifDistribution = const [],
    final List<MotifEntry> shadowMotifs = const [],
    this.uiLabelMapping,
    this.stability,
    final List<String> qualityFlags = const [],
    @JsonKey(name: 'partnerStructuralPositions')
    this.partnerStructuralPositions,
    final List<MotifEntry> partnerMotifDistribution = const [],
    final List<MotifEntry> partnerShadowMotifs = const [],
    @JsonKey(name: 'partnerUiLabelMapping') this.partnerUiLabelMapping,
    this.relationshipConstellation,
    this.meSummary,
  }) : _motifDistribution = motifDistribution,
       _shadowMotifs = shadowMotifs,
       _qualityFlags = qualityFlags,
       _partnerMotifDistribution = partnerMotifDistribution,
       _partnerShadowMotifs = partnerShadowMotifs;

  factory _$PsycheModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PsycheModelImplFromJson(json);

  @override
  final String runId;
  @override
  final String userId;
  @override
  final String context;
  // 'ME' or 'REL'
  @override
  final String createdAt;
  @override
  final InputHashes? inputHashes;
  @override
  final EngineVersions? engineVersions;
  // ME context: Structural positions (authoritative source)
  @override
  final StructuralPositions? structuralPositions;
  // ME context: Motif data
  final List<MotifEntry> _motifDistribution;
  // ME context: Motif data
  @override
  @JsonKey()
  List<MotifEntry> get motifDistribution {
    if (_motifDistribution is EqualUnmodifiableListView)
      return _motifDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_motifDistribution);
  }

  final List<MotifEntry> _shadowMotifs;
  @override
  @JsonKey()
  List<MotifEntry> get shadowMotifs {
    if (_shadowMotifs is EqualUnmodifiableListView) return _shadowMotifs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shadowMotifs);
  }

  // UI mapping
  @override
  final UiLabelMapping? uiLabelMapping;
  // Stability analysis
  @override
  final StabilityAnalysis? stability;
  // Quality flags
  final List<String> _qualityFlags;
  // Quality flags
  @override
  @JsonKey()
  List<String> get qualityFlags {
    if (_qualityFlags is EqualUnmodifiableListView) return _qualityFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qualityFlags);
  }

  // REL context: Partner structural positions
  @override
  @JsonKey(name: 'partnerStructuralPositions')
  final StructuralPositions? partnerStructuralPositions;
  // REL context: Partner motif data
  final List<MotifEntry> _partnerMotifDistribution;
  // REL context: Partner motif data
  @override
  @JsonKey()
  List<MotifEntry> get partnerMotifDistribution {
    if (_partnerMotifDistribution is EqualUnmodifiableListView)
      return _partnerMotifDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partnerMotifDistribution);
  }

  final List<MotifEntry> _partnerShadowMotifs;
  @override
  @JsonKey()
  List<MotifEntry> get partnerShadowMotifs {
    if (_partnerShadowMotifs is EqualUnmodifiableListView)
      return _partnerShadowMotifs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partnerShadowMotifs);
  }

  // REL context: Partner UI mapping
  @override
  @JsonKey(name: 'partnerUiLabelMapping')
  final UiLabelMapping? partnerUiLabelMapping;
  // REL context: Relationship constellation
  @override
  final RelationshipConstellationData? relationshipConstellation;
  // REL context: Me summary for comparison
  @override
  final MeSummary? meSummary;

  @override
  String toString() {
    return 'PsycheModel(runId: $runId, userId: $userId, context: $context, createdAt: $createdAt, inputHashes: $inputHashes, engineVersions: $engineVersions, structuralPositions: $structuralPositions, motifDistribution: $motifDistribution, shadowMotifs: $shadowMotifs, uiLabelMapping: $uiLabelMapping, stability: $stability, qualityFlags: $qualityFlags, partnerStructuralPositions: $partnerStructuralPositions, partnerMotifDistribution: $partnerMotifDistribution, partnerShadowMotifs: $partnerShadowMotifs, partnerUiLabelMapping: $partnerUiLabelMapping, relationshipConstellation: $relationshipConstellation, meSummary: $meSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PsycheModelImpl &&
            (identical(other.runId, runId) || other.runId == runId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.inputHashes, inputHashes) ||
                other.inputHashes == inputHashes) &&
            (identical(other.engineVersions, engineVersions) ||
                other.engineVersions == engineVersions) &&
            (identical(other.structuralPositions, structuralPositions) ||
                other.structuralPositions == structuralPositions) &&
            const DeepCollectionEquality().equals(
              other._motifDistribution,
              _motifDistribution,
            ) &&
            const DeepCollectionEquality().equals(
              other._shadowMotifs,
              _shadowMotifs,
            ) &&
            (identical(other.uiLabelMapping, uiLabelMapping) ||
                other.uiLabelMapping == uiLabelMapping) &&
            (identical(other.stability, stability) ||
                other.stability == stability) &&
            const DeepCollectionEquality().equals(
              other._qualityFlags,
              _qualityFlags,
            ) &&
            (identical(
                  other.partnerStructuralPositions,
                  partnerStructuralPositions,
                ) ||
                other.partnerStructuralPositions ==
                    partnerStructuralPositions) &&
            const DeepCollectionEquality().equals(
              other._partnerMotifDistribution,
              _partnerMotifDistribution,
            ) &&
            const DeepCollectionEquality().equals(
              other._partnerShadowMotifs,
              _partnerShadowMotifs,
            ) &&
            (identical(other.partnerUiLabelMapping, partnerUiLabelMapping) ||
                other.partnerUiLabelMapping == partnerUiLabelMapping) &&
            (identical(
                  other.relationshipConstellation,
                  relationshipConstellation,
                ) ||
                other.relationshipConstellation == relationshipConstellation) &&
            (identical(other.meSummary, meSummary) ||
                other.meSummary == meSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    runId,
    userId,
    context,
    createdAt,
    inputHashes,
    engineVersions,
    structuralPositions,
    const DeepCollectionEquality().hash(_motifDistribution),
    const DeepCollectionEquality().hash(_shadowMotifs),
    uiLabelMapping,
    stability,
    const DeepCollectionEquality().hash(_qualityFlags),
    partnerStructuralPositions,
    const DeepCollectionEquality().hash(_partnerMotifDistribution),
    const DeepCollectionEquality().hash(_partnerShadowMotifs),
    partnerUiLabelMapping,
    relationshipConstellation,
    meSummary,
  );

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PsycheModelImplCopyWith<_$PsycheModelImpl> get copyWith =>
      __$$PsycheModelImplCopyWithImpl<_$PsycheModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PsycheModelImplToJson(this);
  }
}

abstract class _PsycheModel implements PsycheModel {
  const factory _PsycheModel({
    required final String runId,
    required final String userId,
    required final String context,
    required final String createdAt,
    final InputHashes? inputHashes,
    final EngineVersions? engineVersions,
    final StructuralPositions? structuralPositions,
    final List<MotifEntry> motifDistribution,
    final List<MotifEntry> shadowMotifs,
    final UiLabelMapping? uiLabelMapping,
    final StabilityAnalysis? stability,
    final List<String> qualityFlags,
    @JsonKey(name: 'partnerStructuralPositions')
    final StructuralPositions? partnerStructuralPositions,
    final List<MotifEntry> partnerMotifDistribution,
    final List<MotifEntry> partnerShadowMotifs,
    @JsonKey(name: 'partnerUiLabelMapping')
    final UiLabelMapping? partnerUiLabelMapping,
    final RelationshipConstellationData? relationshipConstellation,
    final MeSummary? meSummary,
  }) = _$PsycheModelImpl;

  factory _PsycheModel.fromJson(Map<String, dynamic> json) =
      _$PsycheModelImpl.fromJson;

  @override
  String get runId;
  @override
  String get userId;
  @override
  String get context; // 'ME' or 'REL'
  @override
  String get createdAt;
  @override
  InputHashes? get inputHashes;
  @override
  EngineVersions? get engineVersions; // ME context: Structural positions (authoritative source)
  @override
  StructuralPositions? get structuralPositions; // ME context: Motif data
  @override
  List<MotifEntry> get motifDistribution;
  @override
  List<MotifEntry> get shadowMotifs; // UI mapping
  @override
  UiLabelMapping? get uiLabelMapping; // Stability analysis
  @override
  StabilityAnalysis? get stability; // Quality flags
  @override
  List<String> get qualityFlags; // REL context: Partner structural positions
  @override
  @JsonKey(name: 'partnerStructuralPositions')
  StructuralPositions? get partnerStructuralPositions; // REL context: Partner motif data
  @override
  List<MotifEntry> get partnerMotifDistribution;
  @override
  List<MotifEntry> get partnerShadowMotifs; // REL context: Partner UI mapping
  @override
  @JsonKey(name: 'partnerUiLabelMapping')
  UiLabelMapping? get partnerUiLabelMapping; // REL context: Relationship constellation
  @override
  RelationshipConstellationData? get relationshipConstellation; // REL context: Me summary for comparison
  @override
  MeSummary? get meSummary;

  /// Create a copy of PsycheModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PsycheModelImplCopyWith<_$PsycheModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RunGenerateResponse _$RunGenerateResponseFromJson(Map<String, dynamic> json) {
  return _RunGenerateResponse.fromJson(json);
}

/// @nodoc
mixin _$RunGenerateResponse {
  String get runId => throw _privateConstructorUsedError;
  bool get cached => throw _privateConstructorUsedError;

  /// Serializes this RunGenerateResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RunGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RunGenerateResponseCopyWith<RunGenerateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunGenerateResponseCopyWith<$Res> {
  factory $RunGenerateResponseCopyWith(
    RunGenerateResponse value,
    $Res Function(RunGenerateResponse) then,
  ) = _$RunGenerateResponseCopyWithImpl<$Res, RunGenerateResponse>;
  @useResult
  $Res call({String runId, bool cached});
}

/// @nodoc
class _$RunGenerateResponseCopyWithImpl<$Res, $Val extends RunGenerateResponse>
    implements $RunGenerateResponseCopyWith<$Res> {
  _$RunGenerateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? runId = null, Object? cached = null}) {
    return _then(
      _value.copyWith(
            runId: null == runId
                ? _value.runId
                : runId // ignore: cast_nullable_to_non_nullable
                      as String,
            cached: null == cached
                ? _value.cached
                : cached // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RunGenerateResponseImplCopyWith<$Res>
    implements $RunGenerateResponseCopyWith<$Res> {
  factory _$$RunGenerateResponseImplCopyWith(
    _$RunGenerateResponseImpl value,
    $Res Function(_$RunGenerateResponseImpl) then,
  ) = __$$RunGenerateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String runId, bool cached});
}

/// @nodoc
class __$$RunGenerateResponseImplCopyWithImpl<$Res>
    extends _$RunGenerateResponseCopyWithImpl<$Res, _$RunGenerateResponseImpl>
    implements _$$RunGenerateResponseImplCopyWith<$Res> {
  __$$RunGenerateResponseImplCopyWithImpl(
    _$RunGenerateResponseImpl _value,
    $Res Function(_$RunGenerateResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? runId = null, Object? cached = null}) {
    return _then(
      _$RunGenerateResponseImpl(
        runId: null == runId
            ? _value.runId
            : runId // ignore: cast_nullable_to_non_nullable
                  as String,
        cached: null == cached
            ? _value.cached
            : cached // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RunGenerateResponseImpl implements _RunGenerateResponse {
  const _$RunGenerateResponseImpl({required this.runId, this.cached = false});

  factory _$RunGenerateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunGenerateResponseImplFromJson(json);

  @override
  final String runId;
  @override
  @JsonKey()
  final bool cached;

  @override
  String toString() {
    return 'RunGenerateResponse(runId: $runId, cached: $cached)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunGenerateResponseImpl &&
            (identical(other.runId, runId) || other.runId == runId) &&
            (identical(other.cached, cached) || other.cached == cached));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, runId, cached);

  /// Create a copy of RunGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunGenerateResponseImplCopyWith<_$RunGenerateResponseImpl> get copyWith =>
      __$$RunGenerateResponseImplCopyWithImpl<_$RunGenerateResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RunGenerateResponseImplToJson(this);
  }
}

abstract class _RunGenerateResponse implements RunGenerateResponse {
  const factory _RunGenerateResponse({
    required final String runId,
    final bool cached,
  }) = _$RunGenerateResponseImpl;

  factory _RunGenerateResponse.fromJson(Map<String, dynamic> json) =
      _$RunGenerateResponseImpl.fromJson;

  @override
  String get runId;
  @override
  bool get cached;

  /// Create a copy of RunGenerateResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunGenerateResponseImplCopyWith<_$RunGenerateResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RunLatestResponse _$RunLatestResponseFromJson(Map<String, dynamic> json) {
  return _RunLatestResponse.fromJson(json);
}

/// @nodoc
mixin _$RunLatestResponse {
  String get runId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get context => throw _privateConstructorUsedError;

  /// Serializes this RunLatestResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RunLatestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RunLatestResponseCopyWith<RunLatestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunLatestResponseCopyWith<$Res> {
  factory $RunLatestResponseCopyWith(
    RunLatestResponse value,
    $Res Function(RunLatestResponse) then,
  ) = _$RunLatestResponseCopyWithImpl<$Res, RunLatestResponse>;
  @useResult
  $Res call({String runId, String? createdAt, String? context});
}

/// @nodoc
class _$RunLatestResponseCopyWithImpl<$Res, $Val extends RunLatestResponse>
    implements $RunLatestResponseCopyWith<$Res> {
  _$RunLatestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunLatestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? createdAt = freezed,
    Object? context = freezed,
  }) {
    return _then(
      _value.copyWith(
            runId: null == runId
                ? _value.runId
                : runId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            context: freezed == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RunLatestResponseImplCopyWith<$Res>
    implements $RunLatestResponseCopyWith<$Res> {
  factory _$$RunLatestResponseImplCopyWith(
    _$RunLatestResponseImpl value,
    $Res Function(_$RunLatestResponseImpl) then,
  ) = __$$RunLatestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String runId, String? createdAt, String? context});
}

/// @nodoc
class __$$RunLatestResponseImplCopyWithImpl<$Res>
    extends _$RunLatestResponseCopyWithImpl<$Res, _$RunLatestResponseImpl>
    implements _$$RunLatestResponseImplCopyWith<$Res> {
  __$$RunLatestResponseImplCopyWithImpl(
    _$RunLatestResponseImpl _value,
    $Res Function(_$RunLatestResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunLatestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runId = null,
    Object? createdAt = freezed,
    Object? context = freezed,
  }) {
    return _then(
      _$RunLatestResponseImpl(
        runId: null == runId
            ? _value.runId
            : runId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        context: freezed == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RunLatestResponseImpl implements _RunLatestResponse {
  const _$RunLatestResponseImpl({
    required this.runId,
    this.createdAt,
    this.context,
  });

  factory _$RunLatestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunLatestResponseImplFromJson(json);

  @override
  final String runId;
  @override
  final String? createdAt;
  @override
  final String? context;

  @override
  String toString() {
    return 'RunLatestResponse(runId: $runId, createdAt: $createdAt, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunLatestResponseImpl &&
            (identical(other.runId, runId) || other.runId == runId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.context, context) || other.context == context));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, runId, createdAt, context);

  /// Create a copy of RunLatestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunLatestResponseImplCopyWith<_$RunLatestResponseImpl> get copyWith =>
      __$$RunLatestResponseImplCopyWithImpl<_$RunLatestResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RunLatestResponseImplToJson(this);
  }
}

abstract class _RunLatestResponse implements RunLatestResponse {
  const factory _RunLatestResponse({
    required final String runId,
    final String? createdAt,
    final String? context,
  }) = _$RunLatestResponseImpl;

  factory _RunLatestResponse.fromJson(Map<String, dynamic> json) =
      _$RunLatestResponseImpl.fromJson;

  @override
  String get runId;
  @override
  String? get createdAt;
  @override
  String? get context;

  /// Create a copy of RunLatestResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunLatestResponseImplCopyWith<_$RunLatestResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
