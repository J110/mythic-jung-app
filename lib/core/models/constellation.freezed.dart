// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'constellation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StructuralAssignment _$StructuralAssignmentFromJson(Map<String, dynamic> json) {
  return _StructuralAssignment.fromJson(json);
}

/// @nodoc
mixin _$StructuralAssignment {
  String? get primary => throw _privateConstructorUsedError;
  List<String> get secondary => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this StructuralAssignment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StructuralAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StructuralAssignmentCopyWith<StructuralAssignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructuralAssignmentCopyWith<$Res> {
  factory $StructuralAssignmentCopyWith(
    StructuralAssignment value,
    $Res Function(StructuralAssignment) then,
  ) = _$StructuralAssignmentCopyWithImpl<$Res, StructuralAssignment>;
  @useResult
  $Res call({String? primary, List<String> secondary, double confidence});
}

/// @nodoc
class _$StructuralAssignmentCopyWithImpl<
  $Res,
  $Val extends StructuralAssignment
>
    implements $StructuralAssignmentCopyWith<$Res> {
  _$StructuralAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StructuralAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = null,
    Object? confidence = null,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StructuralAssignmentImplCopyWith<$Res>
    implements $StructuralAssignmentCopyWith<$Res> {
  factory _$$StructuralAssignmentImplCopyWith(
    _$StructuralAssignmentImpl value,
    $Res Function(_$StructuralAssignmentImpl) then,
  ) = __$$StructuralAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? primary, List<String> secondary, double confidence});
}

/// @nodoc
class __$$StructuralAssignmentImplCopyWithImpl<$Res>
    extends _$StructuralAssignmentCopyWithImpl<$Res, _$StructuralAssignmentImpl>
    implements _$$StructuralAssignmentImplCopyWith<$Res> {
  __$$StructuralAssignmentImplCopyWithImpl(
    _$StructuralAssignmentImpl _value,
    $Res Function(_$StructuralAssignmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StructuralAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primary = freezed,
    Object? secondary = null,
    Object? confidence = null,
  }) {
    return _then(
      _$StructuralAssignmentImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StructuralAssignmentImpl implements _StructuralAssignment {
  const _$StructuralAssignmentImpl({
    this.primary,
    final List<String> secondary = const [],
    this.confidence = 0.5,
  }) : _secondary = secondary;

  factory _$StructuralAssignmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructuralAssignmentImplFromJson(json);

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

  @override
  String toString() {
    return 'StructuralAssignment(primary: $primary, secondary: $secondary, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructuralAssignmentImpl &&
            (identical(other.primary, primary) || other.primary == primary) &&
            const DeepCollectionEquality().equals(
              other._secondary,
              _secondary,
            ) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    primary,
    const DeepCollectionEquality().hash(_secondary),
    confidence,
  );

  /// Create a copy of StructuralAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StructuralAssignmentImplCopyWith<_$StructuralAssignmentImpl>
  get copyWith =>
      __$$StructuralAssignmentImplCopyWithImpl<_$StructuralAssignmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StructuralAssignmentImplToJson(this);
  }
}

abstract class _StructuralAssignment implements StructuralAssignment {
  const factory _StructuralAssignment({
    final String? primary,
    final List<String> secondary,
    final double confidence,
  }) = _$StructuralAssignmentImpl;

  factory _StructuralAssignment.fromJson(Map<String, dynamic> json) =
      _$StructuralAssignmentImpl.fromJson;

  @override
  String? get primary;
  @override
  List<String> get secondary;
  @override
  double get confidence;

  /// Create a copy of StructuralAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StructuralAssignmentImplCopyWith<_$StructuralAssignmentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SelfDirectionAssignment _$SelfDirectionAssignmentFromJson(
  Map<String, dynamic> json,
) {
  return _SelfDirectionAssignment.fromJson(json);
}

/// @nodoc
mixin _$SelfDirectionAssignment {
  List<String> get vector => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this SelfDirectionAssignment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelfDirectionAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelfDirectionAssignmentCopyWith<SelfDirectionAssignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfDirectionAssignmentCopyWith<$Res> {
  factory $SelfDirectionAssignmentCopyWith(
    SelfDirectionAssignment value,
    $Res Function(SelfDirectionAssignment) then,
  ) = _$SelfDirectionAssignmentCopyWithImpl<$Res, SelfDirectionAssignment>;
  @useResult
  $Res call({List<String> vector, double confidence});
}

/// @nodoc
class _$SelfDirectionAssignmentCopyWithImpl<
  $Res,
  $Val extends SelfDirectionAssignment
>
    implements $SelfDirectionAssignmentCopyWith<$Res> {
  _$SelfDirectionAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelfDirectionAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? vector = null, Object? confidence = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SelfDirectionAssignmentImplCopyWith<$Res>
    implements $SelfDirectionAssignmentCopyWith<$Res> {
  factory _$$SelfDirectionAssignmentImplCopyWith(
    _$SelfDirectionAssignmentImpl value,
    $Res Function(_$SelfDirectionAssignmentImpl) then,
  ) = __$$SelfDirectionAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> vector, double confidence});
}

/// @nodoc
class __$$SelfDirectionAssignmentImplCopyWithImpl<$Res>
    extends
        _$SelfDirectionAssignmentCopyWithImpl<
          $Res,
          _$SelfDirectionAssignmentImpl
        >
    implements _$$SelfDirectionAssignmentImplCopyWith<$Res> {
  __$$SelfDirectionAssignmentImplCopyWithImpl(
    _$SelfDirectionAssignmentImpl _value,
    $Res Function(_$SelfDirectionAssignmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SelfDirectionAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? vector = null, Object? confidence = null}) {
    return _then(
      _$SelfDirectionAssignmentImpl(
        vector: null == vector
            ? _value._vector
            : vector // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SelfDirectionAssignmentImpl implements _SelfDirectionAssignment {
  const _$SelfDirectionAssignmentImpl({
    final List<String> vector = const [],
    this.confidence = 0.5,
  }) : _vector = vector;

  factory _$SelfDirectionAssignmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelfDirectionAssignmentImplFromJson(json);

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

  @override
  String toString() {
    return 'SelfDirectionAssignment(vector: $vector, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelfDirectionAssignmentImpl &&
            const DeepCollectionEquality().equals(other._vector, _vector) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_vector),
    confidence,
  );

  /// Create a copy of SelfDirectionAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelfDirectionAssignmentImplCopyWith<_$SelfDirectionAssignmentImpl>
  get copyWith =>
      __$$SelfDirectionAssignmentImplCopyWithImpl<
        _$SelfDirectionAssignmentImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelfDirectionAssignmentImplToJson(this);
  }
}

abstract class _SelfDirectionAssignment implements SelfDirectionAssignment {
  const factory _SelfDirectionAssignment({
    final List<String> vector,
    final double confidence,
  }) = _$SelfDirectionAssignmentImpl;

  factory _SelfDirectionAssignment.fromJson(Map<String, dynamic> json) =
      _$SelfDirectionAssignmentImpl.fromJson;

  @override
  List<String> get vector;
  @override
  double get confidence;

  /// Create a copy of SelfDirectionAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelfDirectionAssignmentImplCopyWith<_$SelfDirectionAssignmentImpl>
  get copyWith => throw _privateConstructorUsedError;
}

StructuralArchetypes _$StructuralArchetypesFromJson(Map<String, dynamic> json) {
  return _StructuralArchetypes.fromJson(json);
}

/// @nodoc
mixin _$StructuralArchetypes {
  @JsonKey(name: 'EGO')
  StructuralAssignment? get ego => throw _privateConstructorUsedError;
  @JsonKey(name: 'PERSONA')
  StructuralAssignment? get persona => throw _privateConstructorUsedError;
  @JsonKey(name: 'SHADOW')
  StructuralAssignment? get shadow => throw _privateConstructorUsedError;
  @JsonKey(name: 'ANIMA_ANIMUS')
  StructuralAssignment? get animaAnimus => throw _privateConstructorUsedError;
  @JsonKey(name: 'SELF_DIRECTION')
  SelfDirectionAssignment? get selfDirection =>
      throw _privateConstructorUsedError;

  /// Serializes this StructuralArchetypes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StructuralArchetypesCopyWith<StructuralArchetypes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructuralArchetypesCopyWith<$Res> {
  factory $StructuralArchetypesCopyWith(
    StructuralArchetypes value,
    $Res Function(StructuralArchetypes) then,
  ) = _$StructuralArchetypesCopyWithImpl<$Res, StructuralArchetypes>;
  @useResult
  $Res call({
    @JsonKey(name: 'EGO') StructuralAssignment? ego,
    @JsonKey(name: 'PERSONA') StructuralAssignment? persona,
    @JsonKey(name: 'SHADOW') StructuralAssignment? shadow,
    @JsonKey(name: 'ANIMA_ANIMUS') StructuralAssignment? animaAnimus,
    @JsonKey(name: 'SELF_DIRECTION') SelfDirectionAssignment? selfDirection,
  });

  $StructuralAssignmentCopyWith<$Res>? get ego;
  $StructuralAssignmentCopyWith<$Res>? get persona;
  $StructuralAssignmentCopyWith<$Res>? get shadow;
  $StructuralAssignmentCopyWith<$Res>? get animaAnimus;
  $SelfDirectionAssignmentCopyWith<$Res>? get selfDirection;
}

/// @nodoc
class _$StructuralArchetypesCopyWithImpl<
  $Res,
  $Val extends StructuralArchetypes
>
    implements $StructuralArchetypesCopyWith<$Res> {
  _$StructuralArchetypesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ego = freezed,
    Object? persona = freezed,
    Object? shadow = freezed,
    Object? animaAnimus = freezed,
    Object? selfDirection = freezed,
  }) {
    return _then(
      _value.copyWith(
            ego: freezed == ego
                ? _value.ego
                : ego // ignore: cast_nullable_to_non_nullable
                      as StructuralAssignment?,
            persona: freezed == persona
                ? _value.persona
                : persona // ignore: cast_nullable_to_non_nullable
                      as StructuralAssignment?,
            shadow: freezed == shadow
                ? _value.shadow
                : shadow // ignore: cast_nullable_to_non_nullable
                      as StructuralAssignment?,
            animaAnimus: freezed == animaAnimus
                ? _value.animaAnimus
                : animaAnimus // ignore: cast_nullable_to_non_nullable
                      as StructuralAssignment?,
            selfDirection: freezed == selfDirection
                ? _value.selfDirection
                : selfDirection // ignore: cast_nullable_to_non_nullable
                      as SelfDirectionAssignment?,
          )
          as $Val,
    );
  }

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralAssignmentCopyWith<$Res>? get ego {
    if (_value.ego == null) {
      return null;
    }

    return $StructuralAssignmentCopyWith<$Res>(_value.ego!, (value) {
      return _then(_value.copyWith(ego: value) as $Val);
    });
  }

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralAssignmentCopyWith<$Res>? get persona {
    if (_value.persona == null) {
      return null;
    }

    return $StructuralAssignmentCopyWith<$Res>(_value.persona!, (value) {
      return _then(_value.copyWith(persona: value) as $Val);
    });
  }

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralAssignmentCopyWith<$Res>? get shadow {
    if (_value.shadow == null) {
      return null;
    }

    return $StructuralAssignmentCopyWith<$Res>(_value.shadow!, (value) {
      return _then(_value.copyWith(shadow: value) as $Val);
    });
  }

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralAssignmentCopyWith<$Res>? get animaAnimus {
    if (_value.animaAnimus == null) {
      return null;
    }

    return $StructuralAssignmentCopyWith<$Res>(_value.animaAnimus!, (value) {
      return _then(_value.copyWith(animaAnimus: value) as $Val);
    });
  }

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SelfDirectionAssignmentCopyWith<$Res>? get selfDirection {
    if (_value.selfDirection == null) {
      return null;
    }

    return $SelfDirectionAssignmentCopyWith<$Res>(_value.selfDirection!, (
      value,
    ) {
      return _then(_value.copyWith(selfDirection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StructuralArchetypesImplCopyWith<$Res>
    implements $StructuralArchetypesCopyWith<$Res> {
  factory _$$StructuralArchetypesImplCopyWith(
    _$StructuralArchetypesImpl value,
    $Res Function(_$StructuralArchetypesImpl) then,
  ) = __$$StructuralArchetypesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'EGO') StructuralAssignment? ego,
    @JsonKey(name: 'PERSONA') StructuralAssignment? persona,
    @JsonKey(name: 'SHADOW') StructuralAssignment? shadow,
    @JsonKey(name: 'ANIMA_ANIMUS') StructuralAssignment? animaAnimus,
    @JsonKey(name: 'SELF_DIRECTION') SelfDirectionAssignment? selfDirection,
  });

  @override
  $StructuralAssignmentCopyWith<$Res>? get ego;
  @override
  $StructuralAssignmentCopyWith<$Res>? get persona;
  @override
  $StructuralAssignmentCopyWith<$Res>? get shadow;
  @override
  $StructuralAssignmentCopyWith<$Res>? get animaAnimus;
  @override
  $SelfDirectionAssignmentCopyWith<$Res>? get selfDirection;
}

/// @nodoc
class __$$StructuralArchetypesImplCopyWithImpl<$Res>
    extends _$StructuralArchetypesCopyWithImpl<$Res, _$StructuralArchetypesImpl>
    implements _$$StructuralArchetypesImplCopyWith<$Res> {
  __$$StructuralArchetypesImplCopyWithImpl(
    _$StructuralArchetypesImpl _value,
    $Res Function(_$StructuralArchetypesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ego = freezed,
    Object? persona = freezed,
    Object? shadow = freezed,
    Object? animaAnimus = freezed,
    Object? selfDirection = freezed,
  }) {
    return _then(
      _$StructuralArchetypesImpl(
        ego: freezed == ego
            ? _value.ego
            : ego // ignore: cast_nullable_to_non_nullable
                  as StructuralAssignment?,
        persona: freezed == persona
            ? _value.persona
            : persona // ignore: cast_nullable_to_non_nullable
                  as StructuralAssignment?,
        shadow: freezed == shadow
            ? _value.shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as StructuralAssignment?,
        animaAnimus: freezed == animaAnimus
            ? _value.animaAnimus
            : animaAnimus // ignore: cast_nullable_to_non_nullable
                  as StructuralAssignment?,
        selfDirection: freezed == selfDirection
            ? _value.selfDirection
            : selfDirection // ignore: cast_nullable_to_non_nullable
                  as SelfDirectionAssignment?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StructuralArchetypesImpl implements _StructuralArchetypes {
  const _$StructuralArchetypesImpl({
    @JsonKey(name: 'EGO') this.ego,
    @JsonKey(name: 'PERSONA') this.persona,
    @JsonKey(name: 'SHADOW') this.shadow,
    @JsonKey(name: 'ANIMA_ANIMUS') this.animaAnimus,
    @JsonKey(name: 'SELF_DIRECTION') this.selfDirection,
  });

  factory _$StructuralArchetypesImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructuralArchetypesImplFromJson(json);

  @override
  @JsonKey(name: 'EGO')
  final StructuralAssignment? ego;
  @override
  @JsonKey(name: 'PERSONA')
  final StructuralAssignment? persona;
  @override
  @JsonKey(name: 'SHADOW')
  final StructuralAssignment? shadow;
  @override
  @JsonKey(name: 'ANIMA_ANIMUS')
  final StructuralAssignment? animaAnimus;
  @override
  @JsonKey(name: 'SELF_DIRECTION')
  final SelfDirectionAssignment? selfDirection;

  @override
  String toString() {
    return 'StructuralArchetypes(ego: $ego, persona: $persona, shadow: $shadow, animaAnimus: $animaAnimus, selfDirection: $selfDirection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructuralArchetypesImpl &&
            (identical(other.ego, ego) || other.ego == ego) &&
            (identical(other.persona, persona) || other.persona == persona) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.animaAnimus, animaAnimus) ||
                other.animaAnimus == animaAnimus) &&
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
    animaAnimus,
    selfDirection,
  );

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StructuralArchetypesImplCopyWith<_$StructuralArchetypesImpl>
  get copyWith =>
      __$$StructuralArchetypesImplCopyWithImpl<_$StructuralArchetypesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StructuralArchetypesImplToJson(this);
  }
}

abstract class _StructuralArchetypes implements StructuralArchetypes {
  const factory _StructuralArchetypes({
    @JsonKey(name: 'EGO') final StructuralAssignment? ego,
    @JsonKey(name: 'PERSONA') final StructuralAssignment? persona,
    @JsonKey(name: 'SHADOW') final StructuralAssignment? shadow,
    @JsonKey(name: 'ANIMA_ANIMUS') final StructuralAssignment? animaAnimus,
    @JsonKey(name: 'SELF_DIRECTION')
    final SelfDirectionAssignment? selfDirection,
  }) = _$StructuralArchetypesImpl;

  factory _StructuralArchetypes.fromJson(Map<String, dynamic> json) =
      _$StructuralArchetypesImpl.fromJson;

  @override
  @JsonKey(name: 'EGO')
  StructuralAssignment? get ego;
  @override
  @JsonKey(name: 'PERSONA')
  StructuralAssignment? get persona;
  @override
  @JsonKey(name: 'SHADOW')
  StructuralAssignment? get shadow;
  @override
  @JsonKey(name: 'ANIMA_ANIMUS')
  StructuralAssignment? get animaAnimus;
  @override
  @JsonKey(name: 'SELF_DIRECTION')
  SelfDirectionAssignment? get selfDirection;

  /// Create a copy of StructuralArchetypes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StructuralArchetypesImplCopyWith<_$StructuralArchetypesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MotifScore _$MotifScoreFromJson(Map<String, dynamic> json) {
  return _MotifScore.fromJson(json);
}

/// @nodoc
mixin _$MotifScore {
  String get motif => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;

  /// Serializes this MotifScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MotifScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MotifScoreCopyWith<MotifScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotifScoreCopyWith<$Res> {
  factory $MotifScoreCopyWith(
    MotifScore value,
    $Res Function(MotifScore) then,
  ) = _$MotifScoreCopyWithImpl<$Res, MotifScore>;
  @useResult
  $Res call({String motif, double score});
}

/// @nodoc
class _$MotifScoreCopyWithImpl<$Res, $Val extends MotifScore>
    implements $MotifScoreCopyWith<$Res> {
  _$MotifScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MotifScore
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
abstract class _$$MotifScoreImplCopyWith<$Res>
    implements $MotifScoreCopyWith<$Res> {
  factory _$$MotifScoreImplCopyWith(
    _$MotifScoreImpl value,
    $Res Function(_$MotifScoreImpl) then,
  ) = __$$MotifScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String motif, double score});
}

/// @nodoc
class __$$MotifScoreImplCopyWithImpl<$Res>
    extends _$MotifScoreCopyWithImpl<$Res, _$MotifScoreImpl>
    implements _$$MotifScoreImplCopyWith<$Res> {
  __$$MotifScoreImplCopyWithImpl(
    _$MotifScoreImpl _value,
    $Res Function(_$MotifScoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MotifScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? motif = null, Object? score = null}) {
    return _then(
      _$MotifScoreImpl(
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
class _$MotifScoreImpl implements _MotifScore {
  const _$MotifScoreImpl({required this.motif, this.score = 0.0});

  factory _$MotifScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotifScoreImplFromJson(json);

  @override
  final String motif;
  @override
  @JsonKey()
  final double score;

  @override
  String toString() {
    return 'MotifScore(motif: $motif, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotifScoreImpl &&
            (identical(other.motif, motif) || other.motif == motif) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, motif, score);

  /// Create a copy of MotifScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MotifScoreImplCopyWith<_$MotifScoreImpl> get copyWith =>
      __$$MotifScoreImplCopyWithImpl<_$MotifScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotifScoreImplToJson(this);
  }
}

abstract class _MotifScore implements MotifScore {
  const factory _MotifScore({required final String motif, final double score}) =
      _$MotifScoreImpl;

  factory _MotifScore.fromJson(Map<String, dynamic> json) =
      _$MotifScoreImpl.fromJson;

  @override
  String get motif;
  @override
  double get score;

  /// Create a copy of MotifScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MotifScoreImplCopyWith<_$MotifScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MotifDistribution _$MotifDistributionFromJson(Map<String, dynamic> json) {
  return _MotifDistribution.fromJson(json);
}

/// @nodoc
mixin _$MotifDistribution {
  List<MotifScore> get top => throw _privateConstructorUsedError;
  List<MotifScore> get shadow => throw _privateConstructorUsedError;
  List<MotifScore> get distribution => throw _privateConstructorUsedError;

  /// Serializes this MotifDistribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MotifDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MotifDistributionCopyWith<MotifDistribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotifDistributionCopyWith<$Res> {
  factory $MotifDistributionCopyWith(
    MotifDistribution value,
    $Res Function(MotifDistribution) then,
  ) = _$MotifDistributionCopyWithImpl<$Res, MotifDistribution>;
  @useResult
  $Res call({
    List<MotifScore> top,
    List<MotifScore> shadow,
    List<MotifScore> distribution,
  });
}

/// @nodoc
class _$MotifDistributionCopyWithImpl<$Res, $Val extends MotifDistribution>
    implements $MotifDistributionCopyWith<$Res> {
  _$MotifDistributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MotifDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? shadow = null,
    Object? distribution = null,
  }) {
    return _then(
      _value.copyWith(
            top: null == top
                ? _value.top
                : top // ignore: cast_nullable_to_non_nullable
                      as List<MotifScore>,
            shadow: null == shadow
                ? _value.shadow
                : shadow // ignore: cast_nullable_to_non_nullable
                      as List<MotifScore>,
            distribution: null == distribution
                ? _value.distribution
                : distribution // ignore: cast_nullable_to_non_nullable
                      as List<MotifScore>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MotifDistributionImplCopyWith<$Res>
    implements $MotifDistributionCopyWith<$Res> {
  factory _$$MotifDistributionImplCopyWith(
    _$MotifDistributionImpl value,
    $Res Function(_$MotifDistributionImpl) then,
  ) = __$$MotifDistributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<MotifScore> top,
    List<MotifScore> shadow,
    List<MotifScore> distribution,
  });
}

/// @nodoc
class __$$MotifDistributionImplCopyWithImpl<$Res>
    extends _$MotifDistributionCopyWithImpl<$Res, _$MotifDistributionImpl>
    implements _$$MotifDistributionImplCopyWith<$Res> {
  __$$MotifDistributionImplCopyWithImpl(
    _$MotifDistributionImpl _value,
    $Res Function(_$MotifDistributionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MotifDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? shadow = null,
    Object? distribution = null,
  }) {
    return _then(
      _$MotifDistributionImpl(
        top: null == top
            ? _value._top
            : top // ignore: cast_nullable_to_non_nullable
                  as List<MotifScore>,
        shadow: null == shadow
            ? _value._shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as List<MotifScore>,
        distribution: null == distribution
            ? _value._distribution
            : distribution // ignore: cast_nullable_to_non_nullable
                  as List<MotifScore>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MotifDistributionImpl implements _MotifDistribution {
  const _$MotifDistributionImpl({
    final List<MotifScore> top = const [],
    final List<MotifScore> shadow = const [],
    final List<MotifScore> distribution = const [],
  }) : _top = top,
       _shadow = shadow,
       _distribution = distribution;

  factory _$MotifDistributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotifDistributionImplFromJson(json);

  final List<MotifScore> _top;
  @override
  @JsonKey()
  List<MotifScore> get top {
    if (_top is EqualUnmodifiableListView) return _top;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top);
  }

  final List<MotifScore> _shadow;
  @override
  @JsonKey()
  List<MotifScore> get shadow {
    if (_shadow is EqualUnmodifiableListView) return _shadow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shadow);
  }

  final List<MotifScore> _distribution;
  @override
  @JsonKey()
  List<MotifScore> get distribution {
    if (_distribution is EqualUnmodifiableListView) return _distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_distribution);
  }

  @override
  String toString() {
    return 'MotifDistribution(top: $top, shadow: $shadow, distribution: $distribution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotifDistributionImpl &&
            const DeepCollectionEquality().equals(other._top, _top) &&
            const DeepCollectionEquality().equals(other._shadow, _shadow) &&
            const DeepCollectionEquality().equals(
              other._distribution,
              _distribution,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_top),
    const DeepCollectionEquality().hash(_shadow),
    const DeepCollectionEquality().hash(_distribution),
  );

  /// Create a copy of MotifDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MotifDistributionImplCopyWith<_$MotifDistributionImpl> get copyWith =>
      __$$MotifDistributionImplCopyWithImpl<_$MotifDistributionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MotifDistributionImplToJson(this);
  }
}

abstract class _MotifDistribution implements MotifDistribution {
  const factory _MotifDistribution({
    final List<MotifScore> top,
    final List<MotifScore> shadow,
    final List<MotifScore> distribution,
  }) = _$MotifDistributionImpl;

  factory _MotifDistribution.fromJson(Map<String, dynamic> json) =
      _$MotifDistributionImpl.fromJson;

  @override
  List<MotifScore> get top;
  @override
  List<MotifScore> get shadow;
  @override
  List<MotifScore> get distribution;

  /// Create a copy of MotifDistribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MotifDistributionImplCopyWith<_$MotifDistributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Constellation _$ConstellationFromJson(Map<String, dynamic> json) {
  return _Constellation.fromJson(json);
}

/// @nodoc
mixin _$Constellation {
  StructuralArchetypes? get structural => throw _privateConstructorUsedError;
  MotifDistribution? get motifs => throw _privateConstructorUsedError;
  ConstellationMeta? get meta => throw _privateConstructorUsedError;

  /// Serializes this Constellation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Constellation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConstellationCopyWith<Constellation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConstellationCopyWith<$Res> {
  factory $ConstellationCopyWith(
    Constellation value,
    $Res Function(Constellation) then,
  ) = _$ConstellationCopyWithImpl<$Res, Constellation>;
  @useResult
  $Res call({
    StructuralArchetypes? structural,
    MotifDistribution? motifs,
    ConstellationMeta? meta,
  });

  $StructuralArchetypesCopyWith<$Res>? get structural;
  $MotifDistributionCopyWith<$Res>? get motifs;
  $ConstellationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ConstellationCopyWithImpl<$Res, $Val extends Constellation>
    implements $ConstellationCopyWith<$Res> {
  _$ConstellationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Constellation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? structural = freezed,
    Object? motifs = freezed,
    Object? meta = freezed,
  }) {
    return _then(
      _value.copyWith(
            structural: freezed == structural
                ? _value.structural
                : structural // ignore: cast_nullable_to_non_nullable
                      as StructuralArchetypes?,
            motifs: freezed == motifs
                ? _value.motifs
                : motifs // ignore: cast_nullable_to_non_nullable
                      as MotifDistribution?,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as ConstellationMeta?,
          )
          as $Val,
    );
  }

  /// Create a copy of Constellation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuralArchetypesCopyWith<$Res>? get structural {
    if (_value.structural == null) {
      return null;
    }

    return $StructuralArchetypesCopyWith<$Res>(_value.structural!, (value) {
      return _then(_value.copyWith(structural: value) as $Val);
    });
  }

  /// Create a copy of Constellation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MotifDistributionCopyWith<$Res>? get motifs {
    if (_value.motifs == null) {
      return null;
    }

    return $MotifDistributionCopyWith<$Res>(_value.motifs!, (value) {
      return _then(_value.copyWith(motifs: value) as $Val);
    });
  }

  /// Create a copy of Constellation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConstellationMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ConstellationMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConstellationImplCopyWith<$Res>
    implements $ConstellationCopyWith<$Res> {
  factory _$$ConstellationImplCopyWith(
    _$ConstellationImpl value,
    $Res Function(_$ConstellationImpl) then,
  ) = __$$ConstellationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    StructuralArchetypes? structural,
    MotifDistribution? motifs,
    ConstellationMeta? meta,
  });

  @override
  $StructuralArchetypesCopyWith<$Res>? get structural;
  @override
  $MotifDistributionCopyWith<$Res>? get motifs;
  @override
  $ConstellationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$ConstellationImplCopyWithImpl<$Res>
    extends _$ConstellationCopyWithImpl<$Res, _$ConstellationImpl>
    implements _$$ConstellationImplCopyWith<$Res> {
  __$$ConstellationImplCopyWithImpl(
    _$ConstellationImpl _value,
    $Res Function(_$ConstellationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Constellation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? structural = freezed,
    Object? motifs = freezed,
    Object? meta = freezed,
  }) {
    return _then(
      _$ConstellationImpl(
        structural: freezed == structural
            ? _value.structural
            : structural // ignore: cast_nullable_to_non_nullable
                  as StructuralArchetypes?,
        motifs: freezed == motifs
            ? _value.motifs
            : motifs // ignore: cast_nullable_to_non_nullable
                  as MotifDistribution?,
        meta: freezed == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as ConstellationMeta?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConstellationImpl implements _Constellation {
  const _$ConstellationImpl({this.structural, this.motifs, this.meta});

  factory _$ConstellationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConstellationImplFromJson(json);

  @override
  final StructuralArchetypes? structural;
  @override
  final MotifDistribution? motifs;
  @override
  final ConstellationMeta? meta;

  @override
  String toString() {
    return 'Constellation(structural: $structural, motifs: $motifs, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConstellationImpl &&
            (identical(other.structural, structural) ||
                other.structural == structural) &&
            (identical(other.motifs, motifs) || other.motifs == motifs) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, structural, motifs, meta);

  /// Create a copy of Constellation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConstellationImplCopyWith<_$ConstellationImpl> get copyWith =>
      __$$ConstellationImplCopyWithImpl<_$ConstellationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConstellationImplToJson(this);
  }
}

abstract class _Constellation implements Constellation {
  const factory _Constellation({
    final StructuralArchetypes? structural,
    final MotifDistribution? motifs,
    final ConstellationMeta? meta,
  }) = _$ConstellationImpl;

  factory _Constellation.fromJson(Map<String, dynamic> json) =
      _$ConstellationImpl.fromJson;

  @override
  StructuralArchetypes? get structural;
  @override
  MotifDistribution? get motifs;
  @override
  ConstellationMeta? get meta;

  /// Create a copy of Constellation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConstellationImplCopyWith<_$ConstellationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConstellationMeta _$ConstellationMetaFromJson(Map<String, dynamic> json) {
  return _ConstellationMeta.fromJson(json);
}

/// @nodoc
mixin _$ConstellationMeta {
  String? get taxonomyVersion => throw _privateConstructorUsedError;
  String? get computedAt => throw _privateConstructorUsedError;

  /// Serializes this ConstellationMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConstellationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConstellationMetaCopyWith<ConstellationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConstellationMetaCopyWith<$Res> {
  factory $ConstellationMetaCopyWith(
    ConstellationMeta value,
    $Res Function(ConstellationMeta) then,
  ) = _$ConstellationMetaCopyWithImpl<$Res, ConstellationMeta>;
  @useResult
  $Res call({String? taxonomyVersion, String? computedAt});
}

/// @nodoc
class _$ConstellationMetaCopyWithImpl<$Res, $Val extends ConstellationMeta>
    implements $ConstellationMetaCopyWith<$Res> {
  _$ConstellationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConstellationMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taxonomyVersion = freezed, Object? computedAt = freezed}) {
    return _then(
      _value.copyWith(
            taxonomyVersion: freezed == taxonomyVersion
                ? _value.taxonomyVersion
                : taxonomyVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            computedAt: freezed == computedAt
                ? _value.computedAt
                : computedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConstellationMetaImplCopyWith<$Res>
    implements $ConstellationMetaCopyWith<$Res> {
  factory _$$ConstellationMetaImplCopyWith(
    _$ConstellationMetaImpl value,
    $Res Function(_$ConstellationMetaImpl) then,
  ) = __$$ConstellationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? taxonomyVersion, String? computedAt});
}

/// @nodoc
class __$$ConstellationMetaImplCopyWithImpl<$Res>
    extends _$ConstellationMetaCopyWithImpl<$Res, _$ConstellationMetaImpl>
    implements _$$ConstellationMetaImplCopyWith<$Res> {
  __$$ConstellationMetaImplCopyWithImpl(
    _$ConstellationMetaImpl _value,
    $Res Function(_$ConstellationMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConstellationMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? taxonomyVersion = freezed, Object? computedAt = freezed}) {
    return _then(
      _$ConstellationMetaImpl(
        taxonomyVersion: freezed == taxonomyVersion
            ? _value.taxonomyVersion
            : taxonomyVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        computedAt: freezed == computedAt
            ? _value.computedAt
            : computedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConstellationMetaImpl implements _ConstellationMeta {
  const _$ConstellationMetaImpl({this.taxonomyVersion, this.computedAt});

  factory _$ConstellationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConstellationMetaImplFromJson(json);

  @override
  final String? taxonomyVersion;
  @override
  final String? computedAt;

  @override
  String toString() {
    return 'ConstellationMeta(taxonomyVersion: $taxonomyVersion, computedAt: $computedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConstellationMetaImpl &&
            (identical(other.taxonomyVersion, taxonomyVersion) ||
                other.taxonomyVersion == taxonomyVersion) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taxonomyVersion, computedAt);

  /// Create a copy of ConstellationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConstellationMetaImplCopyWith<_$ConstellationMetaImpl> get copyWith =>
      __$$ConstellationMetaImplCopyWithImpl<_$ConstellationMetaImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConstellationMetaImplToJson(this);
  }
}

abstract class _ConstellationMeta implements ConstellationMeta {
  const factory _ConstellationMeta({
    final String? taxonomyVersion,
    final String? computedAt,
  }) = _$ConstellationMetaImpl;

  factory _ConstellationMeta.fromJson(Map<String, dynamic> json) =
      _$ConstellationMetaImpl.fromJson;

  @override
  String? get taxonomyVersion;
  @override
  String? get computedAt;

  /// Create a copy of ConstellationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConstellationMetaImplCopyWith<_$ConstellationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SharedMotif _$SharedMotifFromJson(Map<String, dynamic> json) {
  return _SharedMotif.fromJson(json);
}

/// @nodoc
mixin _$SharedMotif {
  String get motif => throw _privateConstructorUsedError;
  double get meScore => throw _privateConstructorUsedError;
  double get partnerScore => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this SharedMotif to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SharedMotif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SharedMotifCopyWith<SharedMotif> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedMotifCopyWith<$Res> {
  factory $SharedMotifCopyWith(
    SharedMotif value,
    $Res Function(SharedMotif) then,
  ) = _$SharedMotifCopyWithImpl<$Res, SharedMotif>;
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
class _$SharedMotifCopyWithImpl<$Res, $Val extends SharedMotif>
    implements $SharedMotifCopyWith<$Res> {
  _$SharedMotifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SharedMotif
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
abstract class _$$SharedMotifImplCopyWith<$Res>
    implements $SharedMotifCopyWith<$Res> {
  factory _$$SharedMotifImplCopyWith(
    _$SharedMotifImpl value,
    $Res Function(_$SharedMotifImpl) then,
  ) = __$$SharedMotifImplCopyWithImpl<$Res>;
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
class __$$SharedMotifImplCopyWithImpl<$Res>
    extends _$SharedMotifCopyWithImpl<$Res, _$SharedMotifImpl>
    implements _$$SharedMotifImplCopyWith<$Res> {
  __$$SharedMotifImplCopyWithImpl(
    _$SharedMotifImpl _value,
    $Res Function(_$SharedMotifImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SharedMotif
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
      _$SharedMotifImpl(
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
class _$SharedMotifImpl implements _SharedMotif {
  const _$SharedMotifImpl({
    required this.motif,
    this.meScore = 0.0,
    this.partnerScore = 0.0,
    this.label,
    this.description,
  });

  factory _$SharedMotifImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharedMotifImplFromJson(json);

  @override
  final String motif;
  @override
  @JsonKey()
  final double meScore;
  @override
  @JsonKey()
  final double partnerScore;
  @override
  final String? label;
  @override
  final String? description;

  @override
  String toString() {
    return 'SharedMotif(motif: $motif, meScore: $meScore, partnerScore: $partnerScore, label: $label, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedMotifImpl &&
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

  /// Create a copy of SharedMotif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedMotifImplCopyWith<_$SharedMotifImpl> get copyWith =>
      __$$SharedMotifImplCopyWithImpl<_$SharedMotifImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SharedMotifImplToJson(this);
  }
}

abstract class _SharedMotif implements SharedMotif {
  const factory _SharedMotif({
    required final String motif,
    final double meScore,
    final double partnerScore,
    final String? label,
    final String? description,
  }) = _$SharedMotifImpl;

  factory _SharedMotif.fromJson(Map<String, dynamic> json) =
      _$SharedMotifImpl.fromJson;

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

  /// Create a copy of SharedMotif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SharedMotifImplCopyWith<_$SharedMotifImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ComplementaryMotif _$ComplementaryMotifFromJson(Map<String, dynamic> json) {
  return _ComplementaryMotif.fromJson(json);
}

/// @nodoc
mixin _$ComplementaryMotif {
  String get motif => throw _privateConstructorUsedError;
  String get highSide =>
      throw _privateConstructorUsedError; // 'me' or 'partner'
  double get delta => throw _privateConstructorUsedError;
  double get meScore => throw _privateConstructorUsedError;
  double get partnerScore => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this ComplementaryMotif to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComplementaryMotif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComplementaryMotifCopyWith<ComplementaryMotif> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplementaryMotifCopyWith<$Res> {
  factory $ComplementaryMotifCopyWith(
    ComplementaryMotif value,
    $Res Function(ComplementaryMotif) then,
  ) = _$ComplementaryMotifCopyWithImpl<$Res, ComplementaryMotif>;
  @useResult
  $Res call({
    String motif,
    String highSide,
    double delta,
    double meScore,
    double partnerScore,
    String? label,
    String? description,
  });
}

/// @nodoc
class _$ComplementaryMotifCopyWithImpl<$Res, $Val extends ComplementaryMotif>
    implements $ComplementaryMotifCopyWith<$Res> {
  _$ComplementaryMotifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComplementaryMotif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motif = null,
    Object? highSide = null,
    Object? delta = null,
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
            highSide: null == highSide
                ? _value.highSide
                : highSide // ignore: cast_nullable_to_non_nullable
                      as String,
            delta: null == delta
                ? _value.delta
                : delta // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$ComplementaryMotifImplCopyWith<$Res>
    implements $ComplementaryMotifCopyWith<$Res> {
  factory _$$ComplementaryMotifImplCopyWith(
    _$ComplementaryMotifImpl value,
    $Res Function(_$ComplementaryMotifImpl) then,
  ) = __$$ComplementaryMotifImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String motif,
    String highSide,
    double delta,
    double meScore,
    double partnerScore,
    String? label,
    String? description,
  });
}

/// @nodoc
class __$$ComplementaryMotifImplCopyWithImpl<$Res>
    extends _$ComplementaryMotifCopyWithImpl<$Res, _$ComplementaryMotifImpl>
    implements _$$ComplementaryMotifImplCopyWith<$Res> {
  __$$ComplementaryMotifImplCopyWithImpl(
    _$ComplementaryMotifImpl _value,
    $Res Function(_$ComplementaryMotifImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ComplementaryMotif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? motif = null,
    Object? highSide = null,
    Object? delta = null,
    Object? meScore = null,
    Object? partnerScore = null,
    Object? label = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$ComplementaryMotifImpl(
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
class _$ComplementaryMotifImpl implements _ComplementaryMotif {
  const _$ComplementaryMotifImpl({
    required this.motif,
    this.highSide = 'me',
    this.delta = 0.0,
    this.meScore = 0.0,
    this.partnerScore = 0.0,
    this.label,
    this.description,
  });

  factory _$ComplementaryMotifImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplementaryMotifImplFromJson(json);

  @override
  final String motif;
  @override
  @JsonKey()
  final String highSide;
  // 'me' or 'partner'
  @override
  @JsonKey()
  final double delta;
  @override
  @JsonKey()
  final double meScore;
  @override
  @JsonKey()
  final double partnerScore;
  @override
  final String? label;
  @override
  final String? description;

  @override
  String toString() {
    return 'ComplementaryMotif(motif: $motif, highSide: $highSide, delta: $delta, meScore: $meScore, partnerScore: $partnerScore, label: $label, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplementaryMotifImpl &&
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

  /// Create a copy of ComplementaryMotif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplementaryMotifImplCopyWith<_$ComplementaryMotifImpl> get copyWith =>
      __$$ComplementaryMotifImplCopyWithImpl<_$ComplementaryMotifImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplementaryMotifImplToJson(this);
  }
}

abstract class _ComplementaryMotif implements ComplementaryMotif {
  const factory _ComplementaryMotif({
    required final String motif,
    final String highSide,
    final double delta,
    final double meScore,
    final double partnerScore,
    final String? label,
    final String? description,
  }) = _$ComplementaryMotifImpl;

  factory _ComplementaryMotif.fromJson(Map<String, dynamic> json) =
      _$ComplementaryMotifImpl.fromJson;

  @override
  String get motif;
  @override
  String get highSide; // 'me' or 'partner'
  @override
  double get delta;
  @override
  double get meScore;
  @override
  double get partnerScore;
  @override
  String? get label;
  @override
  String? get description;

  /// Create a copy of ComplementaryMotif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComplementaryMotifImplCopyWith<_$ComplementaryMotifImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TensionPair _$TensionPairFromJson(Map<String, dynamic> json) {
  return _TensionPair.fromJson(json);
}

/// @nodoc
mixin _$TensionPair {
  List<String> get pair => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;
  String? get themeLabel => throw _privateConstructorUsedError;
  double get strength => throw _privateConstructorUsedError;
  List<String> get labels => throw _privateConstructorUsedError;
  bool get boostedByField => throw _privateConstructorUsedError;

  /// Serializes this TensionPair to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TensionPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TensionPairCopyWith<TensionPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TensionPairCopyWith<$Res> {
  factory $TensionPairCopyWith(
    TensionPair value,
    $Res Function(TensionPair) then,
  ) = _$TensionPairCopyWithImpl<$Res, TensionPair>;
  @useResult
  $Res call({
    List<String> pair,
    String direction,
    String? theme,
    String? themeLabel,
    double strength,
    List<String> labels,
    bool boostedByField,
  });
}

/// @nodoc
class _$TensionPairCopyWithImpl<$Res, $Val extends TensionPair>
    implements $TensionPairCopyWith<$Res> {
  _$TensionPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TensionPair
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
    Object? boostedByField = null,
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
                      as List<String>,
            boostedByField: null == boostedByField
                ? _value.boostedByField
                : boostedByField // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TensionPairImplCopyWith<$Res>
    implements $TensionPairCopyWith<$Res> {
  factory _$$TensionPairImplCopyWith(
    _$TensionPairImpl value,
    $Res Function(_$TensionPairImpl) then,
  ) = __$$TensionPairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> pair,
    String direction,
    String? theme,
    String? themeLabel,
    double strength,
    List<String> labels,
    bool boostedByField,
  });
}

/// @nodoc
class __$$TensionPairImplCopyWithImpl<$Res>
    extends _$TensionPairCopyWithImpl<$Res, _$TensionPairImpl>
    implements _$$TensionPairImplCopyWith<$Res> {
  __$$TensionPairImplCopyWithImpl(
    _$TensionPairImpl _value,
    $Res Function(_$TensionPairImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TensionPair
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
    Object? boostedByField = null,
  }) {
    return _then(
      _$TensionPairImpl(
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
                  as List<String>,
        boostedByField: null == boostedByField
            ? _value.boostedByField
            : boostedByField // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TensionPairImpl implements _TensionPair {
  const _$TensionPairImpl({
    final List<String> pair = const [],
    this.direction = 'me_vs_partner',
    this.theme,
    this.themeLabel,
    this.strength = 0.0,
    final List<String> labels = const [],
    this.boostedByField = false,
  }) : _pair = pair,
       _labels = labels;

  factory _$TensionPairImpl.fromJson(Map<String, dynamic> json) =>
      _$$TensionPairImplFromJson(json);

  final List<String> _pair;
  @override
  @JsonKey()
  List<String> get pair {
    if (_pair is EqualUnmodifiableListView) return _pair;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pair);
  }

  @override
  @JsonKey()
  final String direction;
  @override
  final String? theme;
  @override
  final String? themeLabel;
  @override
  @JsonKey()
  final double strength;
  final List<String> _labels;
  @override
  @JsonKey()
  List<String> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  @JsonKey()
  final bool boostedByField;

  @override
  String toString() {
    return 'TensionPair(pair: $pair, direction: $direction, theme: $theme, themeLabel: $themeLabel, strength: $strength, labels: $labels, boostedByField: $boostedByField)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TensionPairImpl &&
            const DeepCollectionEquality().equals(other._pair, _pair) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.themeLabel, themeLabel) ||
                other.themeLabel == themeLabel) &&
            (identical(other.strength, strength) ||
                other.strength == strength) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.boostedByField, boostedByField) ||
                other.boostedByField == boostedByField));
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
    boostedByField,
  );

  /// Create a copy of TensionPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TensionPairImplCopyWith<_$TensionPairImpl> get copyWith =>
      __$$TensionPairImplCopyWithImpl<_$TensionPairImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TensionPairImplToJson(this);
  }
}

abstract class _TensionPair implements TensionPair {
  const factory _TensionPair({
    final List<String> pair,
    final String direction,
    final String? theme,
    final String? themeLabel,
    final double strength,
    final List<String> labels,
    final bool boostedByField,
  }) = _$TensionPairImpl;

  factory _TensionPair.fromJson(Map<String, dynamic> json) =
      _$TensionPairImpl.fromJson;

  @override
  List<String> get pair;
  @override
  String get direction;
  @override
  String? get theme;
  @override
  String? get themeLabel;
  @override
  double get strength;
  @override
  List<String> get labels;
  @override
  bool get boostedByField;

  /// Create a copy of TensionPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TensionPairImplCopyWith<_$TensionPairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelationalField _$RelationalFieldFromJson(Map<String, dynamic> json) {
  return _RelationalField.fromJson(json);
}

/// @nodoc
mixin _$RelationalField {
  String get label => throw _privateConstructorUsedError;
  List<String> get primaryThemes => throw _privateConstructorUsedError;
  List<String> get riskLoops => throw _privateConstructorUsedError;

  /// Serializes this RelationalField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationalField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationalFieldCopyWith<RelationalField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationalFieldCopyWith<$Res> {
  factory $RelationalFieldCopyWith(
    RelationalField value,
    $Res Function(RelationalField) then,
  ) = _$RelationalFieldCopyWithImpl<$Res, RelationalField>;
  @useResult
  $Res call({String label, List<String> primaryThemes, List<String> riskLoops});
}

/// @nodoc
class _$RelationalFieldCopyWithImpl<$Res, $Val extends RelationalField>
    implements $RelationalFieldCopyWith<$Res> {
  _$RelationalFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationalField
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
abstract class _$$RelationalFieldImplCopyWith<$Res>
    implements $RelationalFieldCopyWith<$Res> {
  factory _$$RelationalFieldImplCopyWith(
    _$RelationalFieldImpl value,
    $Res Function(_$RelationalFieldImpl) then,
  ) = __$$RelationalFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, List<String> primaryThemes, List<String> riskLoops});
}

/// @nodoc
class __$$RelationalFieldImplCopyWithImpl<$Res>
    extends _$RelationalFieldCopyWithImpl<$Res, _$RelationalFieldImpl>
    implements _$$RelationalFieldImplCopyWith<$Res> {
  __$$RelationalFieldImplCopyWithImpl(
    _$RelationalFieldImpl _value,
    $Res Function(_$RelationalFieldImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationalField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? primaryThemes = null,
    Object? riskLoops = null,
  }) {
    return _then(
      _$RelationalFieldImpl(
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
class _$RelationalFieldImpl implements _RelationalField {
  const _$RelationalFieldImpl({
    required this.label,
    final List<String> primaryThemes = const [],
    final List<String> riskLoops = const [],
  }) : _primaryThemes = primaryThemes,
       _riskLoops = riskLoops;

  factory _$RelationalFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationalFieldImplFromJson(json);

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
    return 'RelationalField(label: $label, primaryThemes: $primaryThemes, riskLoops: $riskLoops)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationalFieldImpl &&
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

  /// Create a copy of RelationalField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationalFieldImplCopyWith<_$RelationalFieldImpl> get copyWith =>
      __$$RelationalFieldImplCopyWithImpl<_$RelationalFieldImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationalFieldImplToJson(this);
  }
}

abstract class _RelationalField implements RelationalField {
  const factory _RelationalField({
    required final String label,
    final List<String> primaryThemes,
    final List<String> riskLoops,
  }) = _$RelationalFieldImpl;

  factory _RelationalField.fromJson(Map<String, dynamic> json) =
      _$RelationalFieldImpl.fromJson;

  @override
  String get label;
  @override
  List<String> get primaryThemes;
  @override
  List<String> get riskLoops;

  /// Create a copy of RelationalField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationalFieldImplCopyWith<_$RelationalFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelationshipConstellation _$RelationshipConstellationFromJson(
  Map<String, dynamic> json,
) {
  return _RelationshipConstellation.fromJson(json);
}

/// @nodoc
mixin _$RelationshipConstellation {
  List<SharedMotif> get shared => throw _privateConstructorUsedError;
  List<ComplementaryMotif> get complementary =>
      throw _privateConstructorUsedError;
  List<TensionPair> get tensions => throw _privateConstructorUsedError;
  RelationalField? get field => throw _privateConstructorUsedError;
  ConstellationMeta? get meta => throw _privateConstructorUsedError;

  /// Serializes this RelationshipConstellation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipConstellation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipConstellationCopyWith<RelationshipConstellation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipConstellationCopyWith<$Res> {
  factory $RelationshipConstellationCopyWith(
    RelationshipConstellation value,
    $Res Function(RelationshipConstellation) then,
  ) = _$RelationshipConstellationCopyWithImpl<$Res, RelationshipConstellation>;
  @useResult
  $Res call({
    List<SharedMotif> shared,
    List<ComplementaryMotif> complementary,
    List<TensionPair> tensions,
    RelationalField? field,
    ConstellationMeta? meta,
  });

  $RelationalFieldCopyWith<$Res>? get field;
  $ConstellationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$RelationshipConstellationCopyWithImpl<
  $Res,
  $Val extends RelationshipConstellation
>
    implements $RelationshipConstellationCopyWith<$Res> {
  _$RelationshipConstellationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipConstellation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shared = null,
    Object? complementary = null,
    Object? tensions = null,
    Object? field = freezed,
    Object? meta = freezed,
  }) {
    return _then(
      _value.copyWith(
            shared: null == shared
                ? _value.shared
                : shared // ignore: cast_nullable_to_non_nullable
                      as List<SharedMotif>,
            complementary: null == complementary
                ? _value.complementary
                : complementary // ignore: cast_nullable_to_non_nullable
                      as List<ComplementaryMotif>,
            tensions: null == tensions
                ? _value.tensions
                : tensions // ignore: cast_nullable_to_non_nullable
                      as List<TensionPair>,
            field: freezed == field
                ? _value.field
                : field // ignore: cast_nullable_to_non_nullable
                      as RelationalField?,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as ConstellationMeta?,
          )
          as $Val,
    );
  }

  /// Create a copy of RelationshipConstellation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationalFieldCopyWith<$Res>? get field {
    if (_value.field == null) {
      return null;
    }

    return $RelationalFieldCopyWith<$Res>(_value.field!, (value) {
      return _then(_value.copyWith(field: value) as $Val);
    });
  }

  /// Create a copy of RelationshipConstellation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConstellationMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ConstellationMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RelationshipConstellationImplCopyWith<$Res>
    implements $RelationshipConstellationCopyWith<$Res> {
  factory _$$RelationshipConstellationImplCopyWith(
    _$RelationshipConstellationImpl value,
    $Res Function(_$RelationshipConstellationImpl) then,
  ) = __$$RelationshipConstellationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<SharedMotif> shared,
    List<ComplementaryMotif> complementary,
    List<TensionPair> tensions,
    RelationalField? field,
    ConstellationMeta? meta,
  });

  @override
  $RelationalFieldCopyWith<$Res>? get field;
  @override
  $ConstellationMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$RelationshipConstellationImplCopyWithImpl<$Res>
    extends
        _$RelationshipConstellationCopyWithImpl<
          $Res,
          _$RelationshipConstellationImpl
        >
    implements _$$RelationshipConstellationImplCopyWith<$Res> {
  __$$RelationshipConstellationImplCopyWithImpl(
    _$RelationshipConstellationImpl _value,
    $Res Function(_$RelationshipConstellationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipConstellation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shared = null,
    Object? complementary = null,
    Object? tensions = null,
    Object? field = freezed,
    Object? meta = freezed,
  }) {
    return _then(
      _$RelationshipConstellationImpl(
        shared: null == shared
            ? _value._shared
            : shared // ignore: cast_nullable_to_non_nullable
                  as List<SharedMotif>,
        complementary: null == complementary
            ? _value._complementary
            : complementary // ignore: cast_nullable_to_non_nullable
                  as List<ComplementaryMotif>,
        tensions: null == tensions
            ? _value._tensions
            : tensions // ignore: cast_nullable_to_non_nullable
                  as List<TensionPair>,
        field: freezed == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as RelationalField?,
        meta: freezed == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as ConstellationMeta?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipConstellationImpl implements _RelationshipConstellation {
  const _$RelationshipConstellationImpl({
    final List<SharedMotif> shared = const [],
    final List<ComplementaryMotif> complementary = const [],
    final List<TensionPair> tensions = const [],
    this.field,
    this.meta,
  }) : _shared = shared,
       _complementary = complementary,
       _tensions = tensions;

  factory _$RelationshipConstellationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipConstellationImplFromJson(json);

  final List<SharedMotif> _shared;
  @override
  @JsonKey()
  List<SharedMotif> get shared {
    if (_shared is EqualUnmodifiableListView) return _shared;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shared);
  }

  final List<ComplementaryMotif> _complementary;
  @override
  @JsonKey()
  List<ComplementaryMotif> get complementary {
    if (_complementary is EqualUnmodifiableListView) return _complementary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_complementary);
  }

  final List<TensionPair> _tensions;
  @override
  @JsonKey()
  List<TensionPair> get tensions {
    if (_tensions is EqualUnmodifiableListView) return _tensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tensions);
  }

  @override
  final RelationalField? field;
  @override
  final ConstellationMeta? meta;

  @override
  String toString() {
    return 'RelationshipConstellation(shared: $shared, complementary: $complementary, tensions: $tensions, field: $field, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipConstellationImpl &&
            const DeepCollectionEquality().equals(other._shared, _shared) &&
            const DeepCollectionEquality().equals(
              other._complementary,
              _complementary,
            ) &&
            const DeepCollectionEquality().equals(other._tensions, _tensions) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_shared),
    const DeepCollectionEquality().hash(_complementary),
    const DeepCollectionEquality().hash(_tensions),
    field,
    meta,
  );

  /// Create a copy of RelationshipConstellation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipConstellationImplCopyWith<_$RelationshipConstellationImpl>
  get copyWith =>
      __$$RelationshipConstellationImplCopyWithImpl<
        _$RelationshipConstellationImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipConstellationImplToJson(this);
  }
}

abstract class _RelationshipConstellation implements RelationshipConstellation {
  const factory _RelationshipConstellation({
    final List<SharedMotif> shared,
    final List<ComplementaryMotif> complementary,
    final List<TensionPair> tensions,
    final RelationalField? field,
    final ConstellationMeta? meta,
  }) = _$RelationshipConstellationImpl;

  factory _RelationshipConstellation.fromJson(Map<String, dynamic> json) =
      _$RelationshipConstellationImpl.fromJson;

  @override
  List<SharedMotif> get shared;
  @override
  List<ComplementaryMotif> get complementary;
  @override
  List<TensionPair> get tensions;
  @override
  RelationalField? get field;
  @override
  ConstellationMeta? get meta;

  /// Create a copy of RelationshipConstellation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipConstellationImplCopyWith<_$RelationshipConstellationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

MeConstellationResponse _$MeConstellationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _MeConstellationResponse.fromJson(json);
}

/// @nodoc
mixin _$MeConstellationResponse {
  Constellation get meConstellation => throw _privateConstructorUsedError;
  String? get taxonomyVersion => throw _privateConstructorUsedError;
  String? get computedAt => throw _privateConstructorUsedError;

  /// Serializes this MeConstellationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeConstellationResponseCopyWith<MeConstellationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeConstellationResponseCopyWith<$Res> {
  factory $MeConstellationResponseCopyWith(
    MeConstellationResponse value,
    $Res Function(MeConstellationResponse) then,
  ) = _$MeConstellationResponseCopyWithImpl<$Res, MeConstellationResponse>;
  @useResult
  $Res call({
    Constellation meConstellation,
    String? taxonomyVersion,
    String? computedAt,
  });

  $ConstellationCopyWith<$Res> get meConstellation;
}

/// @nodoc
class _$MeConstellationResponseCopyWithImpl<
  $Res,
  $Val extends MeConstellationResponse
>
    implements $MeConstellationResponseCopyWith<$Res> {
  _$MeConstellationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meConstellation = null,
    Object? taxonomyVersion = freezed,
    Object? computedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            meConstellation: null == meConstellation
                ? _value.meConstellation
                : meConstellation // ignore: cast_nullable_to_non_nullable
                      as Constellation,
            taxonomyVersion: freezed == taxonomyVersion
                ? _value.taxonomyVersion
                : taxonomyVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            computedAt: freezed == computedAt
                ? _value.computedAt
                : computedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of MeConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConstellationCopyWith<$Res> get meConstellation {
    return $ConstellationCopyWith<$Res>(_value.meConstellation, (value) {
      return _then(_value.copyWith(meConstellation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MeConstellationResponseImplCopyWith<$Res>
    implements $MeConstellationResponseCopyWith<$Res> {
  factory _$$MeConstellationResponseImplCopyWith(
    _$MeConstellationResponseImpl value,
    $Res Function(_$MeConstellationResponseImpl) then,
  ) = __$$MeConstellationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Constellation meConstellation,
    String? taxonomyVersion,
    String? computedAt,
  });

  @override
  $ConstellationCopyWith<$Res> get meConstellation;
}

/// @nodoc
class __$$MeConstellationResponseImplCopyWithImpl<$Res>
    extends
        _$MeConstellationResponseCopyWithImpl<
          $Res,
          _$MeConstellationResponseImpl
        >
    implements _$$MeConstellationResponseImplCopyWith<$Res> {
  __$$MeConstellationResponseImplCopyWithImpl(
    _$MeConstellationResponseImpl _value,
    $Res Function(_$MeConstellationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MeConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meConstellation = null,
    Object? taxonomyVersion = freezed,
    Object? computedAt = freezed,
  }) {
    return _then(
      _$MeConstellationResponseImpl(
        meConstellation: null == meConstellation
            ? _value.meConstellation
            : meConstellation // ignore: cast_nullable_to_non_nullable
                  as Constellation,
        taxonomyVersion: freezed == taxonomyVersion
            ? _value.taxonomyVersion
            : taxonomyVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        computedAt: freezed == computedAt
            ? _value.computedAt
            : computedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MeConstellationResponseImpl implements _MeConstellationResponse {
  const _$MeConstellationResponseImpl({
    required this.meConstellation,
    this.taxonomyVersion,
    this.computedAt,
  });

  factory _$MeConstellationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeConstellationResponseImplFromJson(json);

  @override
  final Constellation meConstellation;
  @override
  final String? taxonomyVersion;
  @override
  final String? computedAt;

  @override
  String toString() {
    return 'MeConstellationResponse(meConstellation: $meConstellation, taxonomyVersion: $taxonomyVersion, computedAt: $computedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeConstellationResponseImpl &&
            (identical(other.meConstellation, meConstellation) ||
                other.meConstellation == meConstellation) &&
            (identical(other.taxonomyVersion, taxonomyVersion) ||
                other.taxonomyVersion == taxonomyVersion) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, meConstellation, taxonomyVersion, computedAt);

  /// Create a copy of MeConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeConstellationResponseImplCopyWith<_$MeConstellationResponseImpl>
  get copyWith =>
      __$$MeConstellationResponseImplCopyWithImpl<
        _$MeConstellationResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeConstellationResponseImplToJson(this);
  }
}

abstract class _MeConstellationResponse implements MeConstellationResponse {
  const factory _MeConstellationResponse({
    required final Constellation meConstellation,
    final String? taxonomyVersion,
    final String? computedAt,
  }) = _$MeConstellationResponseImpl;

  factory _MeConstellationResponse.fromJson(Map<String, dynamic> json) =
      _$MeConstellationResponseImpl.fromJson;

  @override
  Constellation get meConstellation;
  @override
  String? get taxonomyVersion;
  @override
  String? get computedAt;

  /// Create a copy of MeConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeConstellationResponseImplCopyWith<_$MeConstellationResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RelationshipConstellationResponse _$RelationshipConstellationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RelationshipConstellationResponse.fromJson(json);
}

/// @nodoc
mixin _$RelationshipConstellationResponse {
  Constellation? get meConstellation => throw _privateConstructorUsedError;
  Constellation? get partnerConstellation => throw _privateConstructorUsedError;
  RelationshipConstellation? get relationshipConstellation =>
      throw _privateConstructorUsedError;
  String? get taxonomyVersion => throw _privateConstructorUsedError;
  String? get computedAt => throw _privateConstructorUsedError;

  /// Serializes this RelationshipConstellationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipConstellationResponseCopyWith<RelationshipConstellationResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipConstellationResponseCopyWith<$Res> {
  factory $RelationshipConstellationResponseCopyWith(
    RelationshipConstellationResponse value,
    $Res Function(RelationshipConstellationResponse) then,
  ) =
      _$RelationshipConstellationResponseCopyWithImpl<
        $Res,
        RelationshipConstellationResponse
      >;
  @useResult
  $Res call({
    Constellation? meConstellation,
    Constellation? partnerConstellation,
    RelationshipConstellation? relationshipConstellation,
    String? taxonomyVersion,
    String? computedAt,
  });

  $ConstellationCopyWith<$Res>? get meConstellation;
  $ConstellationCopyWith<$Res>? get partnerConstellation;
  $RelationshipConstellationCopyWith<$Res>? get relationshipConstellation;
}

/// @nodoc
class _$RelationshipConstellationResponseCopyWithImpl<
  $Res,
  $Val extends RelationshipConstellationResponse
>
    implements $RelationshipConstellationResponseCopyWith<$Res> {
  _$RelationshipConstellationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meConstellation = freezed,
    Object? partnerConstellation = freezed,
    Object? relationshipConstellation = freezed,
    Object? taxonomyVersion = freezed,
    Object? computedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            meConstellation: freezed == meConstellation
                ? _value.meConstellation
                : meConstellation // ignore: cast_nullable_to_non_nullable
                      as Constellation?,
            partnerConstellation: freezed == partnerConstellation
                ? _value.partnerConstellation
                : partnerConstellation // ignore: cast_nullable_to_non_nullable
                      as Constellation?,
            relationshipConstellation: freezed == relationshipConstellation
                ? _value.relationshipConstellation
                : relationshipConstellation // ignore: cast_nullable_to_non_nullable
                      as RelationshipConstellation?,
            taxonomyVersion: freezed == taxonomyVersion
                ? _value.taxonomyVersion
                : taxonomyVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            computedAt: freezed == computedAt
                ? _value.computedAt
                : computedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of RelationshipConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConstellationCopyWith<$Res>? get meConstellation {
    if (_value.meConstellation == null) {
      return null;
    }

    return $ConstellationCopyWith<$Res>(_value.meConstellation!, (value) {
      return _then(_value.copyWith(meConstellation: value) as $Val);
    });
  }

  /// Create a copy of RelationshipConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConstellationCopyWith<$Res>? get partnerConstellation {
    if (_value.partnerConstellation == null) {
      return null;
    }

    return $ConstellationCopyWith<$Res>(_value.partnerConstellation!, (value) {
      return _then(_value.copyWith(partnerConstellation: value) as $Val);
    });
  }

  /// Create a copy of RelationshipConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipConstellationCopyWith<$Res>? get relationshipConstellation {
    if (_value.relationshipConstellation == null) {
      return null;
    }

    return $RelationshipConstellationCopyWith<$Res>(
      _value.relationshipConstellation!,
      (value) {
        return _then(_value.copyWith(relationshipConstellation: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$RelationshipConstellationResponseImplCopyWith<$Res>
    implements $RelationshipConstellationResponseCopyWith<$Res> {
  factory _$$RelationshipConstellationResponseImplCopyWith(
    _$RelationshipConstellationResponseImpl value,
    $Res Function(_$RelationshipConstellationResponseImpl) then,
  ) = __$$RelationshipConstellationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Constellation? meConstellation,
    Constellation? partnerConstellation,
    RelationshipConstellation? relationshipConstellation,
    String? taxonomyVersion,
    String? computedAt,
  });

  @override
  $ConstellationCopyWith<$Res>? get meConstellation;
  @override
  $ConstellationCopyWith<$Res>? get partnerConstellation;
  @override
  $RelationshipConstellationCopyWith<$Res>? get relationshipConstellation;
}

/// @nodoc
class __$$RelationshipConstellationResponseImplCopyWithImpl<$Res>
    extends
        _$RelationshipConstellationResponseCopyWithImpl<
          $Res,
          _$RelationshipConstellationResponseImpl
        >
    implements _$$RelationshipConstellationResponseImplCopyWith<$Res> {
  __$$RelationshipConstellationResponseImplCopyWithImpl(
    _$RelationshipConstellationResponseImpl _value,
    $Res Function(_$RelationshipConstellationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meConstellation = freezed,
    Object? partnerConstellation = freezed,
    Object? relationshipConstellation = freezed,
    Object? taxonomyVersion = freezed,
    Object? computedAt = freezed,
  }) {
    return _then(
      _$RelationshipConstellationResponseImpl(
        meConstellation: freezed == meConstellation
            ? _value.meConstellation
            : meConstellation // ignore: cast_nullable_to_non_nullable
                  as Constellation?,
        partnerConstellation: freezed == partnerConstellation
            ? _value.partnerConstellation
            : partnerConstellation // ignore: cast_nullable_to_non_nullable
                  as Constellation?,
        relationshipConstellation: freezed == relationshipConstellation
            ? _value.relationshipConstellation
            : relationshipConstellation // ignore: cast_nullable_to_non_nullable
                  as RelationshipConstellation?,
        taxonomyVersion: freezed == taxonomyVersion
            ? _value.taxonomyVersion
            : taxonomyVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        computedAt: freezed == computedAt
            ? _value.computedAt
            : computedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipConstellationResponseImpl
    implements _RelationshipConstellationResponse {
  const _$RelationshipConstellationResponseImpl({
    this.meConstellation,
    this.partnerConstellation,
    this.relationshipConstellation,
    this.taxonomyVersion,
    this.computedAt,
  });

  factory _$RelationshipConstellationResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RelationshipConstellationResponseImplFromJson(json);

  @override
  final Constellation? meConstellation;
  @override
  final Constellation? partnerConstellation;
  @override
  final RelationshipConstellation? relationshipConstellation;
  @override
  final String? taxonomyVersion;
  @override
  final String? computedAt;

  @override
  String toString() {
    return 'RelationshipConstellationResponse(meConstellation: $meConstellation, partnerConstellation: $partnerConstellation, relationshipConstellation: $relationshipConstellation, taxonomyVersion: $taxonomyVersion, computedAt: $computedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipConstellationResponseImpl &&
            (identical(other.meConstellation, meConstellation) ||
                other.meConstellation == meConstellation) &&
            (identical(other.partnerConstellation, partnerConstellation) ||
                other.partnerConstellation == partnerConstellation) &&
            (identical(
                  other.relationshipConstellation,
                  relationshipConstellation,
                ) ||
                other.relationshipConstellation == relationshipConstellation) &&
            (identical(other.taxonomyVersion, taxonomyVersion) ||
                other.taxonomyVersion == taxonomyVersion) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    meConstellation,
    partnerConstellation,
    relationshipConstellation,
    taxonomyVersion,
    computedAt,
  );

  /// Create a copy of RelationshipConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipConstellationResponseImplCopyWith<
    _$RelationshipConstellationResponseImpl
  >
  get copyWith =>
      __$$RelationshipConstellationResponseImplCopyWithImpl<
        _$RelationshipConstellationResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipConstellationResponseImplToJson(this);
  }
}

abstract class _RelationshipConstellationResponse
    implements RelationshipConstellationResponse {
  const factory _RelationshipConstellationResponse({
    final Constellation? meConstellation,
    final Constellation? partnerConstellation,
    final RelationshipConstellation? relationshipConstellation,
    final String? taxonomyVersion,
    final String? computedAt,
  }) = _$RelationshipConstellationResponseImpl;

  factory _RelationshipConstellationResponse.fromJson(
    Map<String, dynamic> json,
  ) = _$RelationshipConstellationResponseImpl.fromJson;

  @override
  Constellation? get meConstellation;
  @override
  Constellation? get partnerConstellation;
  @override
  RelationshipConstellation? get relationshipConstellation;
  @override
  String? get taxonomyVersion;
  @override
  String? get computedAt;

  /// Create a copy of RelationshipConstellationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipConstellationResponseImplCopyWith<
    _$RelationshipConstellationResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
