// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relationship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RelationshipCharacterSet _$RelationshipCharacterSetFromJson(
  Map<String, dynamic> json,
) {
  return _RelationshipCharacterSet.fromJson(json);
}

/// @nodoc
mixin _$RelationshipCharacterSet {
  String get userId => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  String get relationshipType =>
      throw _privateConstructorUsedError; // 'romantic' or 'platonic'
  String get otherLabel =>
      throw _privateConstructorUsedError; // 'partner', 'friend', 'other'
  List<Character> get characters => throw _privateConstructorUsedError;
  List<String> get rawInputs => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RelationshipCharacterSet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipCharacterSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipCharacterSetCopyWith<RelationshipCharacterSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipCharacterSetCopyWith<$Res> {
  factory $RelationshipCharacterSetCopyWith(
    RelationshipCharacterSet value,
    $Res Function(RelationshipCharacterSet) then,
  ) = _$RelationshipCharacterSetCopyWithImpl<$Res, RelationshipCharacterSet>;
  @useResult
  $Res call({
    String userId,
    bool enabled,
    String relationshipType,
    String otherLabel,
    List<Character> characters,
    List<String> rawInputs,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$RelationshipCharacterSetCopyWithImpl<
  $Res,
  $Val extends RelationshipCharacterSet
>
    implements $RelationshipCharacterSetCopyWith<$Res> {
  _$RelationshipCharacterSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipCharacterSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? enabled = null,
    Object? relationshipType = null,
    Object? otherLabel = null,
    Object? characters = null,
    Object? rawInputs = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            relationshipType: null == relationshipType
                ? _value.relationshipType
                : relationshipType // ignore: cast_nullable_to_non_nullable
                      as String,
            otherLabel: null == otherLabel
                ? _value.otherLabel
                : otherLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            characters: null == characters
                ? _value.characters
                : characters // ignore: cast_nullable_to_non_nullable
                      as List<Character>,
            rawInputs: null == rawInputs
                ? _value.rawInputs
                : rawInputs // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RelationshipCharacterSetImplCopyWith<$Res>
    implements $RelationshipCharacterSetCopyWith<$Res> {
  factory _$$RelationshipCharacterSetImplCopyWith(
    _$RelationshipCharacterSetImpl value,
    $Res Function(_$RelationshipCharacterSetImpl) then,
  ) = __$$RelationshipCharacterSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    bool enabled,
    String relationshipType,
    String otherLabel,
    List<Character> characters,
    List<String> rawInputs,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$RelationshipCharacterSetImplCopyWithImpl<$Res>
    extends
        _$RelationshipCharacterSetCopyWithImpl<
          $Res,
          _$RelationshipCharacterSetImpl
        >
    implements _$$RelationshipCharacterSetImplCopyWith<$Res> {
  __$$RelationshipCharacterSetImplCopyWithImpl(
    _$RelationshipCharacterSetImpl _value,
    $Res Function(_$RelationshipCharacterSetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipCharacterSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? enabled = null,
    Object? relationshipType = null,
    Object? otherLabel = null,
    Object? characters = null,
    Object? rawInputs = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$RelationshipCharacterSetImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        relationshipType: null == relationshipType
            ? _value.relationshipType
            : relationshipType // ignore: cast_nullable_to_non_nullable
                  as String,
        otherLabel: null == otherLabel
            ? _value.otherLabel
            : otherLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        characters: null == characters
            ? _value._characters
            : characters // ignore: cast_nullable_to_non_nullable
                  as List<Character>,
        rawInputs: null == rawInputs
            ? _value._rawInputs
            : rawInputs // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipCharacterSetImpl implements _RelationshipCharacterSet {
  const _$RelationshipCharacterSetImpl({
    required this.userId,
    this.enabled = false,
    this.relationshipType = 'platonic',
    this.otherLabel = 'friend',
    final List<Character> characters = const [],
    final List<String> rawInputs = const [],
    this.updatedAt,
  }) : _characters = characters,
       _rawInputs = rawInputs;

  factory _$RelationshipCharacterSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipCharacterSetImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey()
  final String relationshipType;
  // 'romantic' or 'platonic'
  @override
  @JsonKey()
  final String otherLabel;
  // 'partner', 'friend', 'other'
  final List<Character> _characters;
  // 'partner', 'friend', 'other'
  @override
  @JsonKey()
  List<Character> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  final List<String> _rawInputs;
  @override
  @JsonKey()
  List<String> get rawInputs {
    if (_rawInputs is EqualUnmodifiableListView) return _rawInputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawInputs);
  }

  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RelationshipCharacterSet(userId: $userId, enabled: $enabled, relationshipType: $relationshipType, otherLabel: $otherLabel, characters: $characters, rawInputs: $rawInputs, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipCharacterSetImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.relationshipType, relationshipType) ||
                other.relationshipType == relationshipType) &&
            (identical(other.otherLabel, otherLabel) ||
                other.otherLabel == otherLabel) &&
            const DeepCollectionEquality().equals(
              other._characters,
              _characters,
            ) &&
            const DeepCollectionEquality().equals(
              other._rawInputs,
              _rawInputs,
            ) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    enabled,
    relationshipType,
    otherLabel,
    const DeepCollectionEquality().hash(_characters),
    const DeepCollectionEquality().hash(_rawInputs),
    updatedAt,
  );

  /// Create a copy of RelationshipCharacterSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipCharacterSetImplCopyWith<_$RelationshipCharacterSetImpl>
  get copyWith =>
      __$$RelationshipCharacterSetImplCopyWithImpl<
        _$RelationshipCharacterSetImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipCharacterSetImplToJson(this);
  }
}

abstract class _RelationshipCharacterSet implements RelationshipCharacterSet {
  const factory _RelationshipCharacterSet({
    required final String userId,
    final bool enabled,
    final String relationshipType,
    final String otherLabel,
    final List<Character> characters,
    final List<String> rawInputs,
    final DateTime? updatedAt,
  }) = _$RelationshipCharacterSetImpl;

  factory _RelationshipCharacterSet.fromJson(Map<String, dynamic> json) =
      _$RelationshipCharacterSetImpl.fromJson;

  @override
  String get userId;
  @override
  bool get enabled;
  @override
  String get relationshipType; // 'romantic' or 'platonic'
  @override
  String get otherLabel; // 'partner', 'friend', 'other'
  @override
  List<Character> get characters;
  @override
  List<String> get rawInputs;
  @override
  DateTime? get updatedAt;

  /// Create a copy of RelationshipCharacterSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipCharacterSetImplCopyWith<_$RelationshipCharacterSetImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RelationshipModel _$RelationshipModelFromJson(Map<String, dynamic> json) {
  return _RelationshipModel.fromJson(json);
}

/// @nodoc
mixin _$RelationshipModel {
  String get type =>
      throw _privateConstructorUsedError; // 'romantic' or 'platonic'
  RelationshipField? get field => throw _privateConstructorUsedError;
  BondingAxis? get bondingAxis => throw _privateConstructorUsedError;
  ProjectionShadow? get projectionShadow => throw _privateConstructorUsedError;
  EgoPersonaMismatch? get egoPersonaMismatch =>
      throw _privateConstructorUsedError;
  CommunicationConflict? get communicationConflict =>
      throw _privateConstructorUsedError;
  NeedsBoundaries? get needsBoundaries => throw _privateConstructorUsedError;
  GrowthPath? get growthPath => throw _privateConstructorUsedError;
  RedFlagsRepair? get redFlagsRepair => throw _privateConstructorUsedError;
  List<NextStepSituation> get nextStepsSituations =>
      throw _privateConstructorUsedError;

  /// Serializes this RelationshipModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipModelCopyWith<RelationshipModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipModelCopyWith<$Res> {
  factory $RelationshipModelCopyWith(
    RelationshipModel value,
    $Res Function(RelationshipModel) then,
  ) = _$RelationshipModelCopyWithImpl<$Res, RelationshipModel>;
  @useResult
  $Res call({
    String type,
    RelationshipField? field,
    BondingAxis? bondingAxis,
    ProjectionShadow? projectionShadow,
    EgoPersonaMismatch? egoPersonaMismatch,
    CommunicationConflict? communicationConflict,
    NeedsBoundaries? needsBoundaries,
    GrowthPath? growthPath,
    RedFlagsRepair? redFlagsRepair,
    List<NextStepSituation> nextStepsSituations,
  });

  $RelationshipFieldCopyWith<$Res>? get field;
  $BondingAxisCopyWith<$Res>? get bondingAxis;
  $ProjectionShadowCopyWith<$Res>? get projectionShadow;
  $EgoPersonaMismatchCopyWith<$Res>? get egoPersonaMismatch;
  $CommunicationConflictCopyWith<$Res>? get communicationConflict;
  $NeedsBoundariesCopyWith<$Res>? get needsBoundaries;
  $GrowthPathCopyWith<$Res>? get growthPath;
  $RedFlagsRepairCopyWith<$Res>? get redFlagsRepair;
}

/// @nodoc
class _$RelationshipModelCopyWithImpl<$Res, $Val extends RelationshipModel>
    implements $RelationshipModelCopyWith<$Res> {
  _$RelationshipModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? field = freezed,
    Object? bondingAxis = freezed,
    Object? projectionShadow = freezed,
    Object? egoPersonaMismatch = freezed,
    Object? communicationConflict = freezed,
    Object? needsBoundaries = freezed,
    Object? growthPath = freezed,
    Object? redFlagsRepair = freezed,
    Object? nextStepsSituations = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            field: freezed == field
                ? _value.field
                : field // ignore: cast_nullable_to_non_nullable
                      as RelationshipField?,
            bondingAxis: freezed == bondingAxis
                ? _value.bondingAxis
                : bondingAxis // ignore: cast_nullable_to_non_nullable
                      as BondingAxis?,
            projectionShadow: freezed == projectionShadow
                ? _value.projectionShadow
                : projectionShadow // ignore: cast_nullable_to_non_nullable
                      as ProjectionShadow?,
            egoPersonaMismatch: freezed == egoPersonaMismatch
                ? _value.egoPersonaMismatch
                : egoPersonaMismatch // ignore: cast_nullable_to_non_nullable
                      as EgoPersonaMismatch?,
            communicationConflict: freezed == communicationConflict
                ? _value.communicationConflict
                : communicationConflict // ignore: cast_nullable_to_non_nullable
                      as CommunicationConflict?,
            needsBoundaries: freezed == needsBoundaries
                ? _value.needsBoundaries
                : needsBoundaries // ignore: cast_nullable_to_non_nullable
                      as NeedsBoundaries?,
            growthPath: freezed == growthPath
                ? _value.growthPath
                : growthPath // ignore: cast_nullable_to_non_nullable
                      as GrowthPath?,
            redFlagsRepair: freezed == redFlagsRepair
                ? _value.redFlagsRepair
                : redFlagsRepair // ignore: cast_nullable_to_non_nullable
                      as RedFlagsRepair?,
            nextStepsSituations: null == nextStepsSituations
                ? _value.nextStepsSituations
                : nextStepsSituations // ignore: cast_nullable_to_non_nullable
                      as List<NextStepSituation>,
          )
          as $Val,
    );
  }

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipFieldCopyWith<$Res>? get field {
    if (_value.field == null) {
      return null;
    }

    return $RelationshipFieldCopyWith<$Res>(_value.field!, (value) {
      return _then(_value.copyWith(field: value) as $Val);
    });
  }

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BondingAxisCopyWith<$Res>? get bondingAxis {
    if (_value.bondingAxis == null) {
      return null;
    }

    return $BondingAxisCopyWith<$Res>(_value.bondingAxis!, (value) {
      return _then(_value.copyWith(bondingAxis: value) as $Val);
    });
  }

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectionShadowCopyWith<$Res>? get projectionShadow {
    if (_value.projectionShadow == null) {
      return null;
    }

    return $ProjectionShadowCopyWith<$Res>(_value.projectionShadow!, (value) {
      return _then(_value.copyWith(projectionShadow: value) as $Val);
    });
  }

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EgoPersonaMismatchCopyWith<$Res>? get egoPersonaMismatch {
    if (_value.egoPersonaMismatch == null) {
      return null;
    }

    return $EgoPersonaMismatchCopyWith<$Res>(_value.egoPersonaMismatch!, (
      value,
    ) {
      return _then(_value.copyWith(egoPersonaMismatch: value) as $Val);
    });
  }

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommunicationConflictCopyWith<$Res>? get communicationConflict {
    if (_value.communicationConflict == null) {
      return null;
    }

    return $CommunicationConflictCopyWith<$Res>(_value.communicationConflict!, (
      value,
    ) {
      return _then(_value.copyWith(communicationConflict: value) as $Val);
    });
  }

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NeedsBoundariesCopyWith<$Res>? get needsBoundaries {
    if (_value.needsBoundaries == null) {
      return null;
    }

    return $NeedsBoundariesCopyWith<$Res>(_value.needsBoundaries!, (value) {
      return _then(_value.copyWith(needsBoundaries: value) as $Val);
    });
  }

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GrowthPathCopyWith<$Res>? get growthPath {
    if (_value.growthPath == null) {
      return null;
    }

    return $GrowthPathCopyWith<$Res>(_value.growthPath!, (value) {
      return _then(_value.copyWith(growthPath: value) as $Val);
    });
  }

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RedFlagsRepairCopyWith<$Res>? get redFlagsRepair {
    if (_value.redFlagsRepair == null) {
      return null;
    }

    return $RedFlagsRepairCopyWith<$Res>(_value.redFlagsRepair!, (value) {
      return _then(_value.copyWith(redFlagsRepair: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RelationshipModelImplCopyWith<$Res>
    implements $RelationshipModelCopyWith<$Res> {
  factory _$$RelationshipModelImplCopyWith(
    _$RelationshipModelImpl value,
    $Res Function(_$RelationshipModelImpl) then,
  ) = __$$RelationshipModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    RelationshipField? field,
    BondingAxis? bondingAxis,
    ProjectionShadow? projectionShadow,
    EgoPersonaMismatch? egoPersonaMismatch,
    CommunicationConflict? communicationConflict,
    NeedsBoundaries? needsBoundaries,
    GrowthPath? growthPath,
    RedFlagsRepair? redFlagsRepair,
    List<NextStepSituation> nextStepsSituations,
  });

  @override
  $RelationshipFieldCopyWith<$Res>? get field;
  @override
  $BondingAxisCopyWith<$Res>? get bondingAxis;
  @override
  $ProjectionShadowCopyWith<$Res>? get projectionShadow;
  @override
  $EgoPersonaMismatchCopyWith<$Res>? get egoPersonaMismatch;
  @override
  $CommunicationConflictCopyWith<$Res>? get communicationConflict;
  @override
  $NeedsBoundariesCopyWith<$Res>? get needsBoundaries;
  @override
  $GrowthPathCopyWith<$Res>? get growthPath;
  @override
  $RedFlagsRepairCopyWith<$Res>? get redFlagsRepair;
}

/// @nodoc
class __$$RelationshipModelImplCopyWithImpl<$Res>
    extends _$RelationshipModelCopyWithImpl<$Res, _$RelationshipModelImpl>
    implements _$$RelationshipModelImplCopyWith<$Res> {
  __$$RelationshipModelImplCopyWithImpl(
    _$RelationshipModelImpl _value,
    $Res Function(_$RelationshipModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? field = freezed,
    Object? bondingAxis = freezed,
    Object? projectionShadow = freezed,
    Object? egoPersonaMismatch = freezed,
    Object? communicationConflict = freezed,
    Object? needsBoundaries = freezed,
    Object? growthPath = freezed,
    Object? redFlagsRepair = freezed,
    Object? nextStepsSituations = null,
  }) {
    return _then(
      _$RelationshipModelImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        field: freezed == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as RelationshipField?,
        bondingAxis: freezed == bondingAxis
            ? _value.bondingAxis
            : bondingAxis // ignore: cast_nullable_to_non_nullable
                  as BondingAxis?,
        projectionShadow: freezed == projectionShadow
            ? _value.projectionShadow
            : projectionShadow // ignore: cast_nullable_to_non_nullable
                  as ProjectionShadow?,
        egoPersonaMismatch: freezed == egoPersonaMismatch
            ? _value.egoPersonaMismatch
            : egoPersonaMismatch // ignore: cast_nullable_to_non_nullable
                  as EgoPersonaMismatch?,
        communicationConflict: freezed == communicationConflict
            ? _value.communicationConflict
            : communicationConflict // ignore: cast_nullable_to_non_nullable
                  as CommunicationConflict?,
        needsBoundaries: freezed == needsBoundaries
            ? _value.needsBoundaries
            : needsBoundaries // ignore: cast_nullable_to_non_nullable
                  as NeedsBoundaries?,
        growthPath: freezed == growthPath
            ? _value.growthPath
            : growthPath // ignore: cast_nullable_to_non_nullable
                  as GrowthPath?,
        redFlagsRepair: freezed == redFlagsRepair
            ? _value.redFlagsRepair
            : redFlagsRepair // ignore: cast_nullable_to_non_nullable
                  as RedFlagsRepair?,
        nextStepsSituations: null == nextStepsSituations
            ? _value._nextStepsSituations
            : nextStepsSituations // ignore: cast_nullable_to_non_nullable
                  as List<NextStepSituation>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipModelImpl implements _RelationshipModel {
  const _$RelationshipModelImpl({
    required this.type,
    this.field,
    this.bondingAxis,
    this.projectionShadow,
    this.egoPersonaMismatch,
    this.communicationConflict,
    this.needsBoundaries,
    this.growthPath,
    this.redFlagsRepair,
    final List<NextStepSituation> nextStepsSituations = const [],
  }) : _nextStepsSituations = nextStepsSituations;

  factory _$RelationshipModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipModelImplFromJson(json);

  @override
  final String type;
  // 'romantic' or 'platonic'
  @override
  final RelationshipField? field;
  @override
  final BondingAxis? bondingAxis;
  @override
  final ProjectionShadow? projectionShadow;
  @override
  final EgoPersonaMismatch? egoPersonaMismatch;
  @override
  final CommunicationConflict? communicationConflict;
  @override
  final NeedsBoundaries? needsBoundaries;
  @override
  final GrowthPath? growthPath;
  @override
  final RedFlagsRepair? redFlagsRepair;
  final List<NextStepSituation> _nextStepsSituations;
  @override
  @JsonKey()
  List<NextStepSituation> get nextStepsSituations {
    if (_nextStepsSituations is EqualUnmodifiableListView)
      return _nextStepsSituations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextStepsSituations);
  }

  @override
  String toString() {
    return 'RelationshipModel(type: $type, field: $field, bondingAxis: $bondingAxis, projectionShadow: $projectionShadow, egoPersonaMismatch: $egoPersonaMismatch, communicationConflict: $communicationConflict, needsBoundaries: $needsBoundaries, growthPath: $growthPath, redFlagsRepair: $redFlagsRepair, nextStepsSituations: $nextStepsSituations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.bondingAxis, bondingAxis) ||
                other.bondingAxis == bondingAxis) &&
            (identical(other.projectionShadow, projectionShadow) ||
                other.projectionShadow == projectionShadow) &&
            (identical(other.egoPersonaMismatch, egoPersonaMismatch) ||
                other.egoPersonaMismatch == egoPersonaMismatch) &&
            (identical(other.communicationConflict, communicationConflict) ||
                other.communicationConflict == communicationConflict) &&
            (identical(other.needsBoundaries, needsBoundaries) ||
                other.needsBoundaries == needsBoundaries) &&
            (identical(other.growthPath, growthPath) ||
                other.growthPath == growthPath) &&
            (identical(other.redFlagsRepair, redFlagsRepair) ||
                other.redFlagsRepair == redFlagsRepair) &&
            const DeepCollectionEquality().equals(
              other._nextStepsSituations,
              _nextStepsSituations,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    field,
    bondingAxis,
    projectionShadow,
    egoPersonaMismatch,
    communicationConflict,
    needsBoundaries,
    growthPath,
    redFlagsRepair,
    const DeepCollectionEquality().hash(_nextStepsSituations),
  );

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipModelImplCopyWith<_$RelationshipModelImpl> get copyWith =>
      __$$RelationshipModelImplCopyWithImpl<_$RelationshipModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipModelImplToJson(this);
  }
}

abstract class _RelationshipModel implements RelationshipModel {
  const factory _RelationshipModel({
    required final String type,
    final RelationshipField? field,
    final BondingAxis? bondingAxis,
    final ProjectionShadow? projectionShadow,
    final EgoPersonaMismatch? egoPersonaMismatch,
    final CommunicationConflict? communicationConflict,
    final NeedsBoundaries? needsBoundaries,
    final GrowthPath? growthPath,
    final RedFlagsRepair? redFlagsRepair,
    final List<NextStepSituation> nextStepsSituations,
  }) = _$RelationshipModelImpl;

  factory _RelationshipModel.fromJson(Map<String, dynamic> json) =
      _$RelationshipModelImpl.fromJson;

  @override
  String get type; // 'romantic' or 'platonic'
  @override
  RelationshipField? get field;
  @override
  BondingAxis? get bondingAxis;
  @override
  ProjectionShadow? get projectionShadow;
  @override
  EgoPersonaMismatch? get egoPersonaMismatch;
  @override
  CommunicationConflict? get communicationConflict;
  @override
  NeedsBoundaries? get needsBoundaries;
  @override
  GrowthPath? get growthPath;
  @override
  RedFlagsRepair? get redFlagsRepair;
  @override
  List<NextStepSituation> get nextStepsSituations;

  /// Create a copy of RelationshipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipModelImplCopyWith<_$RelationshipModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelationshipField _$RelationshipFieldFromJson(Map<String, dynamic> json) {
  return _RelationshipField.fromJson(json);
}

/// @nodoc
mixin _$RelationshipField {
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get analysisBullets => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this RelationshipField to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipFieldCopyWith<RelationshipField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipFieldCopyWith<$Res> {
  factory $RelationshipFieldCopyWith(
    RelationshipField value,
    $Res Function(RelationshipField) then,
  ) = _$RelationshipFieldCopyWithImpl<$Res, RelationshipField>;
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$RelationshipFieldCopyWithImpl<$Res, $Val extends RelationshipField>
    implements $RelationshipFieldCopyWith<$Res> {
  _$RelationshipFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            analysisBullets: null == analysisBullets
                ? _value.analysisBullets
                : analysisBullets // ignore: cast_nullable_to_non_nullable
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
abstract class _$$RelationshipFieldImplCopyWith<$Res>
    implements $RelationshipFieldCopyWith<$Res> {
  factory _$$RelationshipFieldImplCopyWith(
    _$RelationshipFieldImpl value,
    $Res Function(_$RelationshipFieldImpl) then,
  ) = __$$RelationshipFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$RelationshipFieldImplCopyWithImpl<$Res>
    extends _$RelationshipFieldCopyWithImpl<$Res, _$RelationshipFieldImpl>
    implements _$$RelationshipFieldImplCopyWith<$Res> {
  __$$RelationshipFieldImplCopyWithImpl(
    _$RelationshipFieldImpl _value,
    $Res Function(_$RelationshipFieldImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$RelationshipFieldImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        analysisBullets: null == analysisBullets
            ? _value._analysisBullets
            : analysisBullets // ignore: cast_nullable_to_non_nullable
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
class _$RelationshipFieldImpl implements _RelationshipField {
  const _$RelationshipFieldImpl({
    this.summary,
    this.story,
    final List<String> analysisBullets = const [],
    final List<String> exampleRefs = const [],
  }) : _analysisBullets = analysisBullets,
       _exampleRefs = exampleRefs;

  factory _$RelationshipFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipFieldImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _analysisBullets;
  @override
  @JsonKey()
  List<String> get analysisBullets {
    if (_analysisBullets is EqualUnmodifiableListView) return _analysisBullets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisBullets);
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
    return 'RelationshipField(summary: $summary, story: $story, analysisBullets: $analysisBullets, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipFieldImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(
              other._analysisBullets,
              _analysisBullets,
            ) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    story,
    const DeepCollectionEquality().hash(_analysisBullets),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of RelationshipField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipFieldImplCopyWith<_$RelationshipFieldImpl> get copyWith =>
      __$$RelationshipFieldImplCopyWithImpl<_$RelationshipFieldImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipFieldImplToJson(this);
  }
}

abstract class _RelationshipField implements RelationshipField {
  const factory _RelationshipField({
    final String? summary,
    final String? story,
    final List<String> analysisBullets,
    final List<String> exampleRefs,
  }) = _$RelationshipFieldImpl;

  factory _RelationshipField.fromJson(Map<String, dynamic> json) =
      _$RelationshipFieldImpl.fromJson;

  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get analysisBullets;
  @override
  List<String> get exampleRefs;

  /// Create a copy of RelationshipField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipFieldImplCopyWith<_$RelationshipFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BondingAxis _$BondingAxisFromJson(Map<String, dynamic> json) {
  return _BondingAxis.fromJson(json);
}

/// @nodoc
mixin _$BondingAxis {
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get analysisBullets => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this BondingAxis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BondingAxis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BondingAxisCopyWith<BondingAxis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondingAxisCopyWith<$Res> {
  factory $BondingAxisCopyWith(
    BondingAxis value,
    $Res Function(BondingAxis) then,
  ) = _$BondingAxisCopyWithImpl<$Res, BondingAxis>;
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$BondingAxisCopyWithImpl<$Res, $Val extends BondingAxis>
    implements $BondingAxisCopyWith<$Res> {
  _$BondingAxisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BondingAxis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            analysisBullets: null == analysisBullets
                ? _value.analysisBullets
                : analysisBullets // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BondingAxisImplCopyWith<$Res>
    implements $BondingAxisCopyWith<$Res> {
  factory _$$BondingAxisImplCopyWith(
    _$BondingAxisImpl value,
    $Res Function(_$BondingAxisImpl) then,
  ) = __$$BondingAxisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$BondingAxisImplCopyWithImpl<$Res>
    extends _$BondingAxisCopyWithImpl<$Res, _$BondingAxisImpl>
    implements _$$BondingAxisImplCopyWith<$Res> {
  __$$BondingAxisImplCopyWithImpl(
    _$BondingAxisImpl _value,
    $Res Function(_$BondingAxisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BondingAxis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$BondingAxisImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        analysisBullets: null == analysisBullets
            ? _value._analysisBullets
            : analysisBullets // ignore: cast_nullable_to_non_nullable
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
class _$BondingAxisImpl implements _BondingAxis {
  const _$BondingAxisImpl({
    this.summary,
    this.story,
    final List<String> analysisBullets = const [],
    final List<String> exampleRefs = const [],
  }) : _analysisBullets = analysisBullets,
       _exampleRefs = exampleRefs;

  factory _$BondingAxisImpl.fromJson(Map<String, dynamic> json) =>
      _$$BondingAxisImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _analysisBullets;
  @override
  @JsonKey()
  List<String> get analysisBullets {
    if (_analysisBullets is EqualUnmodifiableListView) return _analysisBullets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisBullets);
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
    return 'BondingAxis(summary: $summary, story: $story, analysisBullets: $analysisBullets, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondingAxisImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(
              other._analysisBullets,
              _analysisBullets,
            ) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    story,
    const DeepCollectionEquality().hash(_analysisBullets),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of BondingAxis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BondingAxisImplCopyWith<_$BondingAxisImpl> get copyWith =>
      __$$BondingAxisImplCopyWithImpl<_$BondingAxisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BondingAxisImplToJson(this);
  }
}

abstract class _BondingAxis implements BondingAxis {
  const factory _BondingAxis({
    final String? summary,
    final String? story,
    final List<String> analysisBullets,
    final List<String> exampleRefs,
  }) = _$BondingAxisImpl;

  factory _BondingAxis.fromJson(Map<String, dynamic> json) =
      _$BondingAxisImpl.fromJson;

  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get analysisBullets;
  @override
  List<String> get exampleRefs;

  /// Create a copy of BondingAxis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BondingAxisImplCopyWith<_$BondingAxisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectionShadow _$ProjectionShadowFromJson(Map<String, dynamic> json) {
  return _ProjectionShadow.fromJson(json);
}

/// @nodoc
mixin _$ProjectionShadow {
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get analysisBullets => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this ProjectionShadow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectionShadow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectionShadowCopyWith<ProjectionShadow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectionShadowCopyWith<$Res> {
  factory $ProjectionShadowCopyWith(
    ProjectionShadow value,
    $Res Function(ProjectionShadow) then,
  ) = _$ProjectionShadowCopyWithImpl<$Res, ProjectionShadow>;
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$ProjectionShadowCopyWithImpl<$Res, $Val extends ProjectionShadow>
    implements $ProjectionShadowCopyWith<$Res> {
  _$ProjectionShadowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectionShadow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            analysisBullets: null == analysisBullets
                ? _value.analysisBullets
                : analysisBullets // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ProjectionShadowImplCopyWith<$Res>
    implements $ProjectionShadowCopyWith<$Res> {
  factory _$$ProjectionShadowImplCopyWith(
    _$ProjectionShadowImpl value,
    $Res Function(_$ProjectionShadowImpl) then,
  ) = __$$ProjectionShadowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$ProjectionShadowImplCopyWithImpl<$Res>
    extends _$ProjectionShadowCopyWithImpl<$Res, _$ProjectionShadowImpl>
    implements _$$ProjectionShadowImplCopyWith<$Res> {
  __$$ProjectionShadowImplCopyWithImpl(
    _$ProjectionShadowImpl _value,
    $Res Function(_$ProjectionShadowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectionShadow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$ProjectionShadowImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        analysisBullets: null == analysisBullets
            ? _value._analysisBullets
            : analysisBullets // ignore: cast_nullable_to_non_nullable
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
class _$ProjectionShadowImpl implements _ProjectionShadow {
  const _$ProjectionShadowImpl({
    this.summary,
    this.story,
    final List<String> analysisBullets = const [],
    final List<String> exampleRefs = const [],
  }) : _analysisBullets = analysisBullets,
       _exampleRefs = exampleRefs;

  factory _$ProjectionShadowImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectionShadowImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _analysisBullets;
  @override
  @JsonKey()
  List<String> get analysisBullets {
    if (_analysisBullets is EqualUnmodifiableListView) return _analysisBullets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisBullets);
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
    return 'ProjectionShadow(summary: $summary, story: $story, analysisBullets: $analysisBullets, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectionShadowImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(
              other._analysisBullets,
              _analysisBullets,
            ) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    story,
    const DeepCollectionEquality().hash(_analysisBullets),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of ProjectionShadow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectionShadowImplCopyWith<_$ProjectionShadowImpl> get copyWith =>
      __$$ProjectionShadowImplCopyWithImpl<_$ProjectionShadowImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectionShadowImplToJson(this);
  }
}

abstract class _ProjectionShadow implements ProjectionShadow {
  const factory _ProjectionShadow({
    final String? summary,
    final String? story,
    final List<String> analysisBullets,
    final List<String> exampleRefs,
  }) = _$ProjectionShadowImpl;

  factory _ProjectionShadow.fromJson(Map<String, dynamic> json) =
      _$ProjectionShadowImpl.fromJson;

  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get analysisBullets;
  @override
  List<String> get exampleRefs;

  /// Create a copy of ProjectionShadow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectionShadowImplCopyWith<_$ProjectionShadowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EgoPersonaMismatch _$EgoPersonaMismatchFromJson(Map<String, dynamic> json) {
  return _EgoPersonaMismatch.fromJson(json);
}

/// @nodoc
mixin _$EgoPersonaMismatch {
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get analysisBullets => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this EgoPersonaMismatch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EgoPersonaMismatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EgoPersonaMismatchCopyWith<EgoPersonaMismatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EgoPersonaMismatchCopyWith<$Res> {
  factory $EgoPersonaMismatchCopyWith(
    EgoPersonaMismatch value,
    $Res Function(EgoPersonaMismatch) then,
  ) = _$EgoPersonaMismatchCopyWithImpl<$Res, EgoPersonaMismatch>;
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$EgoPersonaMismatchCopyWithImpl<$Res, $Val extends EgoPersonaMismatch>
    implements $EgoPersonaMismatchCopyWith<$Res> {
  _$EgoPersonaMismatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EgoPersonaMismatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            analysisBullets: null == analysisBullets
                ? _value.analysisBullets
                : analysisBullets // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EgoPersonaMismatchImplCopyWith<$Res>
    implements $EgoPersonaMismatchCopyWith<$Res> {
  factory _$$EgoPersonaMismatchImplCopyWith(
    _$EgoPersonaMismatchImpl value,
    $Res Function(_$EgoPersonaMismatchImpl) then,
  ) = __$$EgoPersonaMismatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$EgoPersonaMismatchImplCopyWithImpl<$Res>
    extends _$EgoPersonaMismatchCopyWithImpl<$Res, _$EgoPersonaMismatchImpl>
    implements _$$EgoPersonaMismatchImplCopyWith<$Res> {
  __$$EgoPersonaMismatchImplCopyWithImpl(
    _$EgoPersonaMismatchImpl _value,
    $Res Function(_$EgoPersonaMismatchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EgoPersonaMismatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$EgoPersonaMismatchImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        analysisBullets: null == analysisBullets
            ? _value._analysisBullets
            : analysisBullets // ignore: cast_nullable_to_non_nullable
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
class _$EgoPersonaMismatchImpl implements _EgoPersonaMismatch {
  const _$EgoPersonaMismatchImpl({
    this.summary,
    this.story,
    final List<String> analysisBullets = const [],
    final List<String> exampleRefs = const [],
  }) : _analysisBullets = analysisBullets,
       _exampleRefs = exampleRefs;

  factory _$EgoPersonaMismatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$EgoPersonaMismatchImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _analysisBullets;
  @override
  @JsonKey()
  List<String> get analysisBullets {
    if (_analysisBullets is EqualUnmodifiableListView) return _analysisBullets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisBullets);
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
    return 'EgoPersonaMismatch(summary: $summary, story: $story, analysisBullets: $analysisBullets, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EgoPersonaMismatchImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(
              other._analysisBullets,
              _analysisBullets,
            ) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    story,
    const DeepCollectionEquality().hash(_analysisBullets),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of EgoPersonaMismatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EgoPersonaMismatchImplCopyWith<_$EgoPersonaMismatchImpl> get copyWith =>
      __$$EgoPersonaMismatchImplCopyWithImpl<_$EgoPersonaMismatchImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EgoPersonaMismatchImplToJson(this);
  }
}

abstract class _EgoPersonaMismatch implements EgoPersonaMismatch {
  const factory _EgoPersonaMismatch({
    final String? summary,
    final String? story,
    final List<String> analysisBullets,
    final List<String> exampleRefs,
  }) = _$EgoPersonaMismatchImpl;

  factory _EgoPersonaMismatch.fromJson(Map<String, dynamic> json) =
      _$EgoPersonaMismatchImpl.fromJson;

  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get analysisBullets;
  @override
  List<String> get exampleRefs;

  /// Create a copy of EgoPersonaMismatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EgoPersonaMismatchImplCopyWith<_$EgoPersonaMismatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommunicationConflict _$CommunicationConflictFromJson(
  Map<String, dynamic> json,
) {
  return _CommunicationConflict.fromJson(json);
}

/// @nodoc
mixin _$CommunicationConflict {
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get analysisBullets => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this CommunicationConflict to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunicationConflict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunicationConflictCopyWith<CommunicationConflict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunicationConflictCopyWith<$Res> {
  factory $CommunicationConflictCopyWith(
    CommunicationConflict value,
    $Res Function(CommunicationConflict) then,
  ) = _$CommunicationConflictCopyWithImpl<$Res, CommunicationConflict>;
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$CommunicationConflictCopyWithImpl<
  $Res,
  $Val extends CommunicationConflict
>
    implements $CommunicationConflictCopyWith<$Res> {
  _$CommunicationConflictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunicationConflict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            analysisBullets: null == analysisBullets
                ? _value.analysisBullets
                : analysisBullets // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CommunicationConflictImplCopyWith<$Res>
    implements $CommunicationConflictCopyWith<$Res> {
  factory _$$CommunicationConflictImplCopyWith(
    _$CommunicationConflictImpl value,
    $Res Function(_$CommunicationConflictImpl) then,
  ) = __$$CommunicationConflictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$CommunicationConflictImplCopyWithImpl<$Res>
    extends
        _$CommunicationConflictCopyWithImpl<$Res, _$CommunicationConflictImpl>
    implements _$$CommunicationConflictImplCopyWith<$Res> {
  __$$CommunicationConflictImplCopyWithImpl(
    _$CommunicationConflictImpl _value,
    $Res Function(_$CommunicationConflictImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommunicationConflict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$CommunicationConflictImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        analysisBullets: null == analysisBullets
            ? _value._analysisBullets
            : analysisBullets // ignore: cast_nullable_to_non_nullable
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
class _$CommunicationConflictImpl implements _CommunicationConflict {
  const _$CommunicationConflictImpl({
    this.summary,
    this.story,
    final List<String> analysisBullets = const [],
    final List<String> exampleRefs = const [],
  }) : _analysisBullets = analysisBullets,
       _exampleRefs = exampleRefs;

  factory _$CommunicationConflictImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunicationConflictImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _analysisBullets;
  @override
  @JsonKey()
  List<String> get analysisBullets {
    if (_analysisBullets is EqualUnmodifiableListView) return _analysisBullets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisBullets);
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
    return 'CommunicationConflict(summary: $summary, story: $story, analysisBullets: $analysisBullets, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunicationConflictImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(
              other._analysisBullets,
              _analysisBullets,
            ) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    story,
    const DeepCollectionEquality().hash(_analysisBullets),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of CommunicationConflict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunicationConflictImplCopyWith<_$CommunicationConflictImpl>
  get copyWith =>
      __$$CommunicationConflictImplCopyWithImpl<_$CommunicationConflictImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunicationConflictImplToJson(this);
  }
}

abstract class _CommunicationConflict implements CommunicationConflict {
  const factory _CommunicationConflict({
    final String? summary,
    final String? story,
    final List<String> analysisBullets,
    final List<String> exampleRefs,
  }) = _$CommunicationConflictImpl;

  factory _CommunicationConflict.fromJson(Map<String, dynamic> json) =
      _$CommunicationConflictImpl.fromJson;

  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get analysisBullets;
  @override
  List<String> get exampleRefs;

  /// Create a copy of CommunicationConflict
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunicationConflictImplCopyWith<_$CommunicationConflictImpl>
  get copyWith => throw _privateConstructorUsedError;
}

NeedsBoundaries _$NeedsBoundariesFromJson(Map<String, dynamic> json) {
  return _NeedsBoundaries.fromJson(json);
}

/// @nodoc
mixin _$NeedsBoundaries {
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get analysisBullets => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this NeedsBoundaries to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NeedsBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NeedsBoundariesCopyWith<NeedsBoundaries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NeedsBoundariesCopyWith<$Res> {
  factory $NeedsBoundariesCopyWith(
    NeedsBoundaries value,
    $Res Function(NeedsBoundaries) then,
  ) = _$NeedsBoundariesCopyWithImpl<$Res, NeedsBoundaries>;
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$NeedsBoundariesCopyWithImpl<$Res, $Val extends NeedsBoundaries>
    implements $NeedsBoundariesCopyWith<$Res> {
  _$NeedsBoundariesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NeedsBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            analysisBullets: null == analysisBullets
                ? _value.analysisBullets
                : analysisBullets // ignore: cast_nullable_to_non_nullable
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
abstract class _$$NeedsBoundariesImplCopyWith<$Res>
    implements $NeedsBoundariesCopyWith<$Res> {
  factory _$$NeedsBoundariesImplCopyWith(
    _$NeedsBoundariesImpl value,
    $Res Function(_$NeedsBoundariesImpl) then,
  ) = __$$NeedsBoundariesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$NeedsBoundariesImplCopyWithImpl<$Res>
    extends _$NeedsBoundariesCopyWithImpl<$Res, _$NeedsBoundariesImpl>
    implements _$$NeedsBoundariesImplCopyWith<$Res> {
  __$$NeedsBoundariesImplCopyWithImpl(
    _$NeedsBoundariesImpl _value,
    $Res Function(_$NeedsBoundariesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NeedsBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$NeedsBoundariesImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        analysisBullets: null == analysisBullets
            ? _value._analysisBullets
            : analysisBullets // ignore: cast_nullable_to_non_nullable
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
class _$NeedsBoundariesImpl implements _NeedsBoundaries {
  const _$NeedsBoundariesImpl({
    this.summary,
    this.story,
    final List<String> analysisBullets = const [],
    final List<String> exampleRefs = const [],
  }) : _analysisBullets = analysisBullets,
       _exampleRefs = exampleRefs;

  factory _$NeedsBoundariesImpl.fromJson(Map<String, dynamic> json) =>
      _$$NeedsBoundariesImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _analysisBullets;
  @override
  @JsonKey()
  List<String> get analysisBullets {
    if (_analysisBullets is EqualUnmodifiableListView) return _analysisBullets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisBullets);
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
    return 'NeedsBoundaries(summary: $summary, story: $story, analysisBullets: $analysisBullets, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NeedsBoundariesImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(
              other._analysisBullets,
              _analysisBullets,
            ) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    story,
    const DeepCollectionEquality().hash(_analysisBullets),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of NeedsBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NeedsBoundariesImplCopyWith<_$NeedsBoundariesImpl> get copyWith =>
      __$$NeedsBoundariesImplCopyWithImpl<_$NeedsBoundariesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NeedsBoundariesImplToJson(this);
  }
}

abstract class _NeedsBoundaries implements NeedsBoundaries {
  const factory _NeedsBoundaries({
    final String? summary,
    final String? story,
    final List<String> analysisBullets,
    final List<String> exampleRefs,
  }) = _$NeedsBoundariesImpl;

  factory _NeedsBoundaries.fromJson(Map<String, dynamic> json) =
      _$NeedsBoundariesImpl.fromJson;

  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get analysisBullets;
  @override
  List<String> get exampleRefs;

  /// Create a copy of NeedsBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NeedsBoundariesImplCopyWith<_$NeedsBoundariesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GrowthPath _$GrowthPathFromJson(Map<String, dynamic> json) {
  return _GrowthPath.fromJson(json);
}

/// @nodoc
mixin _$GrowthPath {
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get analysisBullets => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this GrowthPath to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GrowthPath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GrowthPathCopyWith<GrowthPath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrowthPathCopyWith<$Res> {
  factory $GrowthPathCopyWith(
    GrowthPath value,
    $Res Function(GrowthPath) then,
  ) = _$GrowthPathCopyWithImpl<$Res, GrowthPath>;
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$GrowthPathCopyWithImpl<$Res, $Val extends GrowthPath>
    implements $GrowthPathCopyWith<$Res> {
  _$GrowthPathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GrowthPath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            analysisBullets: null == analysisBullets
                ? _value.analysisBullets
                : analysisBullets // ignore: cast_nullable_to_non_nullable
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
abstract class _$$GrowthPathImplCopyWith<$Res>
    implements $GrowthPathCopyWith<$Res> {
  factory _$$GrowthPathImplCopyWith(
    _$GrowthPathImpl value,
    $Res Function(_$GrowthPathImpl) then,
  ) = __$$GrowthPathImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$GrowthPathImplCopyWithImpl<$Res>
    extends _$GrowthPathCopyWithImpl<$Res, _$GrowthPathImpl>
    implements _$$GrowthPathImplCopyWith<$Res> {
  __$$GrowthPathImplCopyWithImpl(
    _$GrowthPathImpl _value,
    $Res Function(_$GrowthPathImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GrowthPath
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$GrowthPathImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        analysisBullets: null == analysisBullets
            ? _value._analysisBullets
            : analysisBullets // ignore: cast_nullable_to_non_nullable
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
class _$GrowthPathImpl implements _GrowthPath {
  const _$GrowthPathImpl({
    this.summary,
    this.story,
    final List<String> analysisBullets = const [],
    final List<String> exampleRefs = const [],
  }) : _analysisBullets = analysisBullets,
       _exampleRefs = exampleRefs;

  factory _$GrowthPathImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrowthPathImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _analysisBullets;
  @override
  @JsonKey()
  List<String> get analysisBullets {
    if (_analysisBullets is EqualUnmodifiableListView) return _analysisBullets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisBullets);
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
    return 'GrowthPath(summary: $summary, story: $story, analysisBullets: $analysisBullets, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrowthPathImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(
              other._analysisBullets,
              _analysisBullets,
            ) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    story,
    const DeepCollectionEquality().hash(_analysisBullets),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of GrowthPath
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GrowthPathImplCopyWith<_$GrowthPathImpl> get copyWith =>
      __$$GrowthPathImplCopyWithImpl<_$GrowthPathImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrowthPathImplToJson(this);
  }
}

abstract class _GrowthPath implements GrowthPath {
  const factory _GrowthPath({
    final String? summary,
    final String? story,
    final List<String> analysisBullets,
    final List<String> exampleRefs,
  }) = _$GrowthPathImpl;

  factory _GrowthPath.fromJson(Map<String, dynamic> json) =
      _$GrowthPathImpl.fromJson;

  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get analysisBullets;
  @override
  List<String> get exampleRefs;

  /// Create a copy of GrowthPath
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GrowthPathImplCopyWith<_$GrowthPathImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RedFlagsRepair _$RedFlagsRepairFromJson(Map<String, dynamic> json) {
  return _RedFlagsRepair.fromJson(json);
}

/// @nodoc
mixin _$RedFlagsRepair {
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get analysisBullets => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this RedFlagsRepair to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RedFlagsRepair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RedFlagsRepairCopyWith<RedFlagsRepair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedFlagsRepairCopyWith<$Res> {
  factory $RedFlagsRepairCopyWith(
    RedFlagsRepair value,
    $Res Function(RedFlagsRepair) then,
  ) = _$RedFlagsRepairCopyWithImpl<$Res, RedFlagsRepair>;
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$RedFlagsRepairCopyWithImpl<$Res, $Val extends RedFlagsRepair>
    implements $RedFlagsRepairCopyWith<$Res> {
  _$RedFlagsRepairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RedFlagsRepair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            analysisBullets: null == analysisBullets
                ? _value.analysisBullets
                : analysisBullets // ignore: cast_nullable_to_non_nullable
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
abstract class _$$RedFlagsRepairImplCopyWith<$Res>
    implements $RedFlagsRepairCopyWith<$Res> {
  factory _$$RedFlagsRepairImplCopyWith(
    _$RedFlagsRepairImpl value,
    $Res Function(_$RedFlagsRepairImpl) then,
  ) = __$$RedFlagsRepairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$RedFlagsRepairImplCopyWithImpl<$Res>
    extends _$RedFlagsRepairCopyWithImpl<$Res, _$RedFlagsRepairImpl>
    implements _$$RedFlagsRepairImplCopyWith<$Res> {
  __$$RedFlagsRepairImplCopyWithImpl(
    _$RedFlagsRepairImpl _value,
    $Res Function(_$RedFlagsRepairImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RedFlagsRepair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$RedFlagsRepairImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        analysisBullets: null == analysisBullets
            ? _value._analysisBullets
            : analysisBullets // ignore: cast_nullable_to_non_nullable
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
class _$RedFlagsRepairImpl implements _RedFlagsRepair {
  const _$RedFlagsRepairImpl({
    this.summary,
    this.story,
    final List<String> analysisBullets = const [],
    final List<String> exampleRefs = const [],
  }) : _analysisBullets = analysisBullets,
       _exampleRefs = exampleRefs;

  factory _$RedFlagsRepairImpl.fromJson(Map<String, dynamic> json) =>
      _$$RedFlagsRepairImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _analysisBullets;
  @override
  @JsonKey()
  List<String> get analysisBullets {
    if (_analysisBullets is EqualUnmodifiableListView) return _analysisBullets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisBullets);
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
    return 'RedFlagsRepair(summary: $summary, story: $story, analysisBullets: $analysisBullets, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedFlagsRepairImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(
              other._analysisBullets,
              _analysisBullets,
            ) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    story,
    const DeepCollectionEquality().hash(_analysisBullets),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of RedFlagsRepair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedFlagsRepairImplCopyWith<_$RedFlagsRepairImpl> get copyWith =>
      __$$RedFlagsRepairImplCopyWithImpl<_$RedFlagsRepairImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RedFlagsRepairImplToJson(this);
  }
}

abstract class _RedFlagsRepair implements RedFlagsRepair {
  const factory _RedFlagsRepair({
    final String? summary,
    final String? story,
    final List<String> analysisBullets,
    final List<String> exampleRefs,
  }) = _$RedFlagsRepairImpl;

  factory _RedFlagsRepair.fromJson(Map<String, dynamic> json) =
      _$RedFlagsRepairImpl.fromJson;

  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get analysisBullets;
  @override
  List<String> get exampleRefs;

  /// Create a copy of RedFlagsRepair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedFlagsRepairImplCopyWith<_$RedFlagsRepairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NextStepSituation _$NextStepSituationFromJson(Map<String, dynamic> json) {
  return _NextStepSituation.fromJson(json);
}

/// @nodoc
mixin _$NextStepSituation {
  String? get title => throw _privateConstructorUsedError;
  String? get context => throw _privateConstructorUsedError;
  String? get guidance => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this NextStepSituation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NextStepSituation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NextStepSituationCopyWith<NextStepSituation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextStepSituationCopyWith<$Res> {
  factory $NextStepSituationCopyWith(
    NextStepSituation value,
    $Res Function(NextStepSituation) then,
  ) = _$NextStepSituationCopyWithImpl<$Res, NextStepSituation>;
  @useResult
  $Res call({
    String? title,
    String? context,
    String? guidance,
    List<String> exampleRefs,
  });
}

/// @nodoc
class _$NextStepSituationCopyWithImpl<$Res, $Val extends NextStepSituation>
    implements $NextStepSituationCopyWith<$Res> {
  _$NextStepSituationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NextStepSituation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? context = freezed,
    Object? guidance = freezed,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            context: freezed == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String?,
            guidance: freezed == guidance
                ? _value.guidance
                : guidance // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$NextStepSituationImplCopyWith<$Res>
    implements $NextStepSituationCopyWith<$Res> {
  factory _$$NextStepSituationImplCopyWith(
    _$NextStepSituationImpl value,
    $Res Function(_$NextStepSituationImpl) then,
  ) = __$$NextStepSituationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? title,
    String? context,
    String? guidance,
    List<String> exampleRefs,
  });
}

/// @nodoc
class __$$NextStepSituationImplCopyWithImpl<$Res>
    extends _$NextStepSituationCopyWithImpl<$Res, _$NextStepSituationImpl>
    implements _$$NextStepSituationImplCopyWith<$Res> {
  __$$NextStepSituationImplCopyWithImpl(
    _$NextStepSituationImpl _value,
    $Res Function(_$NextStepSituationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NextStepSituation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? context = freezed,
    Object? guidance = freezed,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$NextStepSituationImpl(
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        context: freezed == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String?,
        guidance: freezed == guidance
            ? _value.guidance
            : guidance // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$NextStepSituationImpl implements _NextStepSituation {
  const _$NextStepSituationImpl({
    this.title,
    this.context,
    this.guidance,
    final List<String> exampleRefs = const [],
  }) : _exampleRefs = exampleRefs;

  factory _$NextStepSituationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NextStepSituationImplFromJson(json);

  @override
  final String? title;
  @override
  final String? context;
  @override
  final String? guidance;
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
    return 'NextStepSituation(title: $title, context: $context, guidance: $guidance, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextStepSituationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.guidance, guidance) ||
                other.guidance == guidance) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    context,
    guidance,
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of NextStepSituation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NextStepSituationImplCopyWith<_$NextStepSituationImpl> get copyWith =>
      __$$NextStepSituationImplCopyWithImpl<_$NextStepSituationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NextStepSituationImplToJson(this);
  }
}

abstract class _NextStepSituation implements NextStepSituation {
  const factory _NextStepSituation({
    final String? title,
    final String? context,
    final String? guidance,
    final List<String> exampleRefs,
  }) = _$NextStepSituationImpl;

  factory _NextStepSituation.fromJson(Map<String, dynamic> json) =
      _$NextStepSituationImpl.fromJson;

  @override
  String? get title;
  @override
  String? get context;
  @override
  String? get guidance;
  @override
  List<String> get exampleRefs;

  /// Create a copy of NextStepSituation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NextStepSituationImplCopyWith<_$NextStepSituationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelationshipOutput _$RelationshipOutputFromJson(Map<String, dynamic> json) {
  return _RelationshipOutput.fromJson(json);
}

/// @nodoc
mixin _$RelationshipOutput {
  RelationshipMyth? get myth => throw _privateConstructorUsedError;
  RelationshipModel? get relationshipModel =>
      throw _privateConstructorUsedError;
  RelationshipNarrative? get narrative => throw _privateConstructorUsedError;
  RelationshipExamples? get examples =>
      throw _privateConstructorUsedError; // NEW: What-If Scenarios for key relationship themes
  List<WhatIfScenario> get whatIfScenarios =>
      throw _privateConstructorUsedError; // NEW: Ease zones (where it works naturally)
  EaseZones? get easeZones =>
      throw _privateConstructorUsedError; // NEW: Rupture loops (where it breaks)
  RuptureLoops? get ruptureLoops => throw _privateConstructorUsedError;
  RelationshipMeta? get meta =>
      throw _privateConstructorUsedError; // NEW: Relationship archetype constellation
  RelationshipConstellationResponse? get constellation =>
      throw _privateConstructorUsedError;

  /// Serializes this RelationshipOutput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipOutputCopyWith<RelationshipOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipOutputCopyWith<$Res> {
  factory $RelationshipOutputCopyWith(
    RelationshipOutput value,
    $Res Function(RelationshipOutput) then,
  ) = _$RelationshipOutputCopyWithImpl<$Res, RelationshipOutput>;
  @useResult
  $Res call({
    RelationshipMyth? myth,
    RelationshipModel? relationshipModel,
    RelationshipNarrative? narrative,
    RelationshipExamples? examples,
    List<WhatIfScenario> whatIfScenarios,
    EaseZones? easeZones,
    RuptureLoops? ruptureLoops,
    RelationshipMeta? meta,
    RelationshipConstellationResponse? constellation,
  });

  $RelationshipMythCopyWith<$Res>? get myth;
  $RelationshipModelCopyWith<$Res>? get relationshipModel;
  $RelationshipNarrativeCopyWith<$Res>? get narrative;
  $RelationshipExamplesCopyWith<$Res>? get examples;
  $EaseZonesCopyWith<$Res>? get easeZones;
  $RuptureLoopsCopyWith<$Res>? get ruptureLoops;
  $RelationshipMetaCopyWith<$Res>? get meta;
  $RelationshipConstellationResponseCopyWith<$Res>? get constellation;
}

/// @nodoc
class _$RelationshipOutputCopyWithImpl<$Res, $Val extends RelationshipOutput>
    implements $RelationshipOutputCopyWith<$Res> {
  _$RelationshipOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myth = freezed,
    Object? relationshipModel = freezed,
    Object? narrative = freezed,
    Object? examples = freezed,
    Object? whatIfScenarios = null,
    Object? easeZones = freezed,
    Object? ruptureLoops = freezed,
    Object? meta = freezed,
    Object? constellation = freezed,
  }) {
    return _then(
      _value.copyWith(
            myth: freezed == myth
                ? _value.myth
                : myth // ignore: cast_nullable_to_non_nullable
                      as RelationshipMyth?,
            relationshipModel: freezed == relationshipModel
                ? _value.relationshipModel
                : relationshipModel // ignore: cast_nullable_to_non_nullable
                      as RelationshipModel?,
            narrative: freezed == narrative
                ? _value.narrative
                : narrative // ignore: cast_nullable_to_non_nullable
                      as RelationshipNarrative?,
            examples: freezed == examples
                ? _value.examples
                : examples // ignore: cast_nullable_to_non_nullable
                      as RelationshipExamples?,
            whatIfScenarios: null == whatIfScenarios
                ? _value.whatIfScenarios
                : whatIfScenarios // ignore: cast_nullable_to_non_nullable
                      as List<WhatIfScenario>,
            easeZones: freezed == easeZones
                ? _value.easeZones
                : easeZones // ignore: cast_nullable_to_non_nullable
                      as EaseZones?,
            ruptureLoops: freezed == ruptureLoops
                ? _value.ruptureLoops
                : ruptureLoops // ignore: cast_nullable_to_non_nullable
                      as RuptureLoops?,
            meta: freezed == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as RelationshipMeta?,
            constellation: freezed == constellation
                ? _value.constellation
                : constellation // ignore: cast_nullable_to_non_nullable
                      as RelationshipConstellationResponse?,
          )
          as $Val,
    );
  }

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipMythCopyWith<$Res>? get myth {
    if (_value.myth == null) {
      return null;
    }

    return $RelationshipMythCopyWith<$Res>(_value.myth!, (value) {
      return _then(_value.copyWith(myth: value) as $Val);
    });
  }

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipModelCopyWith<$Res>? get relationshipModel {
    if (_value.relationshipModel == null) {
      return null;
    }

    return $RelationshipModelCopyWith<$Res>(_value.relationshipModel!, (value) {
      return _then(_value.copyWith(relationshipModel: value) as $Val);
    });
  }

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipNarrativeCopyWith<$Res>? get narrative {
    if (_value.narrative == null) {
      return null;
    }

    return $RelationshipNarrativeCopyWith<$Res>(_value.narrative!, (value) {
      return _then(_value.copyWith(narrative: value) as $Val);
    });
  }

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipExamplesCopyWith<$Res>? get examples {
    if (_value.examples == null) {
      return null;
    }

    return $RelationshipExamplesCopyWith<$Res>(_value.examples!, (value) {
      return _then(_value.copyWith(examples: value) as $Val);
    });
  }

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EaseZonesCopyWith<$Res>? get easeZones {
    if (_value.easeZones == null) {
      return null;
    }

    return $EaseZonesCopyWith<$Res>(_value.easeZones!, (value) {
      return _then(_value.copyWith(easeZones: value) as $Val);
    });
  }

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RuptureLoopsCopyWith<$Res>? get ruptureLoops {
    if (_value.ruptureLoops == null) {
      return null;
    }

    return $RuptureLoopsCopyWith<$Res>(_value.ruptureLoops!, (value) {
      return _then(_value.copyWith(ruptureLoops: value) as $Val);
    });
  }

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $RelationshipMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipConstellationResponseCopyWith<$Res>? get constellation {
    if (_value.constellation == null) {
      return null;
    }

    return $RelationshipConstellationResponseCopyWith<$Res>(
      _value.constellation!,
      (value) {
        return _then(_value.copyWith(constellation: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$RelationshipOutputImplCopyWith<$Res>
    implements $RelationshipOutputCopyWith<$Res> {
  factory _$$RelationshipOutputImplCopyWith(
    _$RelationshipOutputImpl value,
    $Res Function(_$RelationshipOutputImpl) then,
  ) = __$$RelationshipOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    RelationshipMyth? myth,
    RelationshipModel? relationshipModel,
    RelationshipNarrative? narrative,
    RelationshipExamples? examples,
    List<WhatIfScenario> whatIfScenarios,
    EaseZones? easeZones,
    RuptureLoops? ruptureLoops,
    RelationshipMeta? meta,
    RelationshipConstellationResponse? constellation,
  });

  @override
  $RelationshipMythCopyWith<$Res>? get myth;
  @override
  $RelationshipModelCopyWith<$Res>? get relationshipModel;
  @override
  $RelationshipNarrativeCopyWith<$Res>? get narrative;
  @override
  $RelationshipExamplesCopyWith<$Res>? get examples;
  @override
  $EaseZonesCopyWith<$Res>? get easeZones;
  @override
  $RuptureLoopsCopyWith<$Res>? get ruptureLoops;
  @override
  $RelationshipMetaCopyWith<$Res>? get meta;
  @override
  $RelationshipConstellationResponseCopyWith<$Res>? get constellation;
}

/// @nodoc
class __$$RelationshipOutputImplCopyWithImpl<$Res>
    extends _$RelationshipOutputCopyWithImpl<$Res, _$RelationshipOutputImpl>
    implements _$$RelationshipOutputImplCopyWith<$Res> {
  __$$RelationshipOutputImplCopyWithImpl(
    _$RelationshipOutputImpl _value,
    $Res Function(_$RelationshipOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myth = freezed,
    Object? relationshipModel = freezed,
    Object? narrative = freezed,
    Object? examples = freezed,
    Object? whatIfScenarios = null,
    Object? easeZones = freezed,
    Object? ruptureLoops = freezed,
    Object? meta = freezed,
    Object? constellation = freezed,
  }) {
    return _then(
      _$RelationshipOutputImpl(
        myth: freezed == myth
            ? _value.myth
            : myth // ignore: cast_nullable_to_non_nullable
                  as RelationshipMyth?,
        relationshipModel: freezed == relationshipModel
            ? _value.relationshipModel
            : relationshipModel // ignore: cast_nullable_to_non_nullable
                  as RelationshipModel?,
        narrative: freezed == narrative
            ? _value.narrative
            : narrative // ignore: cast_nullable_to_non_nullable
                  as RelationshipNarrative?,
        examples: freezed == examples
            ? _value.examples
            : examples // ignore: cast_nullable_to_non_nullable
                  as RelationshipExamples?,
        whatIfScenarios: null == whatIfScenarios
            ? _value._whatIfScenarios
            : whatIfScenarios // ignore: cast_nullable_to_non_nullable
                  as List<WhatIfScenario>,
        easeZones: freezed == easeZones
            ? _value.easeZones
            : easeZones // ignore: cast_nullable_to_non_nullable
                  as EaseZones?,
        ruptureLoops: freezed == ruptureLoops
            ? _value.ruptureLoops
            : ruptureLoops // ignore: cast_nullable_to_non_nullable
                  as RuptureLoops?,
        meta: freezed == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as RelationshipMeta?,
        constellation: freezed == constellation
            ? _value.constellation
            : constellation // ignore: cast_nullable_to_non_nullable
                  as RelationshipConstellationResponse?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipOutputImpl implements _RelationshipOutput {
  const _$RelationshipOutputImpl({
    this.myth,
    this.relationshipModel,
    this.narrative,
    this.examples,
    final List<WhatIfScenario> whatIfScenarios = const [],
    this.easeZones,
    this.ruptureLoops,
    this.meta,
    this.constellation,
  }) : _whatIfScenarios = whatIfScenarios;

  factory _$RelationshipOutputImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipOutputImplFromJson(json);

  @override
  final RelationshipMyth? myth;
  @override
  final RelationshipModel? relationshipModel;
  @override
  final RelationshipNarrative? narrative;
  @override
  final RelationshipExamples? examples;
  // NEW: What-If Scenarios for key relationship themes
  final List<WhatIfScenario> _whatIfScenarios;
  // NEW: What-If Scenarios for key relationship themes
  @override
  @JsonKey()
  List<WhatIfScenario> get whatIfScenarios {
    if (_whatIfScenarios is EqualUnmodifiableListView) return _whatIfScenarios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whatIfScenarios);
  }

  // NEW: Ease zones (where it works naturally)
  @override
  final EaseZones? easeZones;
  // NEW: Rupture loops (where it breaks)
  @override
  final RuptureLoops? ruptureLoops;
  @override
  final RelationshipMeta? meta;
  // NEW: Relationship archetype constellation
  @override
  final RelationshipConstellationResponse? constellation;

  @override
  String toString() {
    return 'RelationshipOutput(myth: $myth, relationshipModel: $relationshipModel, narrative: $narrative, examples: $examples, whatIfScenarios: $whatIfScenarios, easeZones: $easeZones, ruptureLoops: $ruptureLoops, meta: $meta, constellation: $constellation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipOutputImpl &&
            (identical(other.myth, myth) || other.myth == myth) &&
            (identical(other.relationshipModel, relationshipModel) ||
                other.relationshipModel == relationshipModel) &&
            (identical(other.narrative, narrative) ||
                other.narrative == narrative) &&
            (identical(other.examples, examples) ||
                other.examples == examples) &&
            const DeepCollectionEquality().equals(
              other._whatIfScenarios,
              _whatIfScenarios,
            ) &&
            (identical(other.easeZones, easeZones) ||
                other.easeZones == easeZones) &&
            (identical(other.ruptureLoops, ruptureLoops) ||
                other.ruptureLoops == ruptureLoops) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.constellation, constellation) ||
                other.constellation == constellation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    myth,
    relationshipModel,
    narrative,
    examples,
    const DeepCollectionEquality().hash(_whatIfScenarios),
    easeZones,
    ruptureLoops,
    meta,
    constellation,
  );

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipOutputImplCopyWith<_$RelationshipOutputImpl> get copyWith =>
      __$$RelationshipOutputImplCopyWithImpl<_$RelationshipOutputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipOutputImplToJson(this);
  }
}

abstract class _RelationshipOutput implements RelationshipOutput {
  const factory _RelationshipOutput({
    final RelationshipMyth? myth,
    final RelationshipModel? relationshipModel,
    final RelationshipNarrative? narrative,
    final RelationshipExamples? examples,
    final List<WhatIfScenario> whatIfScenarios,
    final EaseZones? easeZones,
    final RuptureLoops? ruptureLoops,
    final RelationshipMeta? meta,
    final RelationshipConstellationResponse? constellation,
  }) = _$RelationshipOutputImpl;

  factory _RelationshipOutput.fromJson(Map<String, dynamic> json) =
      _$RelationshipOutputImpl.fromJson;

  @override
  RelationshipMyth? get myth;
  @override
  RelationshipModel? get relationshipModel;
  @override
  RelationshipNarrative? get narrative;
  @override
  RelationshipExamples? get examples; // NEW: What-If Scenarios for key relationship themes
  @override
  List<WhatIfScenario> get whatIfScenarios; // NEW: Ease zones (where it works naturally)
  @override
  EaseZones? get easeZones; // NEW: Rupture loops (where it breaks)
  @override
  RuptureLoops? get ruptureLoops;
  @override
  RelationshipMeta? get meta; // NEW: Relationship archetype constellation
  @override
  RelationshipConstellationResponse? get constellation;

  /// Create a copy of RelationshipOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipOutputImplCopyWith<_$RelationshipOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WhatIfScenario _$WhatIfScenarioFromJson(Map<String, dynamic> json) {
  return _WhatIfScenario.fromJson(json);
}

/// @nodoc
mixin _$WhatIfScenario {
  String get theme =>
      throw _privateConstructorUsedError; // 'conflict', 'intimacy', 'trust', 'autonomy', 'authority'
  String? get myMode =>
      throw _privateConstructorUsedError; // e.g., 'char_x_phase_y'
  String? get theirMode =>
      throw _privateConstructorUsedError; // e.g., 'char_a_phase_b'
  String? get setup =>
      throw _privateConstructorUsedError; // Specific real-life situation
  String? get unconsciousPattern =>
      throw _privateConstructorUsedError; // Likely projection/trigger
  String? get unconsciousPath =>
      throw _privateConstructorUsedError; // What happens if unconscious
  String? get consciousPath =>
      throw _privateConstructorUsedError; // What happens with individuation
  List<String> get actions =>
      throw _privateConstructorUsedError; // Actions that change trajectory
  List<String> get avoid => throw _privateConstructorUsedError; // What to avoid
  List<RelationshipExampleRef> get examples =>
      throw _privateConstructorUsedError;

  /// Serializes this WhatIfScenario to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WhatIfScenario
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WhatIfScenarioCopyWith<WhatIfScenario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhatIfScenarioCopyWith<$Res> {
  factory $WhatIfScenarioCopyWith(
    WhatIfScenario value,
    $Res Function(WhatIfScenario) then,
  ) = _$WhatIfScenarioCopyWithImpl<$Res, WhatIfScenario>;
  @useResult
  $Res call({
    String theme,
    String? myMode,
    String? theirMode,
    String? setup,
    String? unconsciousPattern,
    String? unconsciousPath,
    String? consciousPath,
    List<String> actions,
    List<String> avoid,
    List<RelationshipExampleRef> examples,
  });
}

/// @nodoc
class _$WhatIfScenarioCopyWithImpl<$Res, $Val extends WhatIfScenario>
    implements $WhatIfScenarioCopyWith<$Res> {
  _$WhatIfScenarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WhatIfScenario
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? myMode = freezed,
    Object? theirMode = freezed,
    Object? setup = freezed,
    Object? unconsciousPattern = freezed,
    Object? unconsciousPath = freezed,
    Object? consciousPath = freezed,
    Object? actions = null,
    Object? avoid = null,
    Object? examples = null,
  }) {
    return _then(
      _value.copyWith(
            theme: null == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as String,
            myMode: freezed == myMode
                ? _value.myMode
                : myMode // ignore: cast_nullable_to_non_nullable
                      as String?,
            theirMode: freezed == theirMode
                ? _value.theirMode
                : theirMode // ignore: cast_nullable_to_non_nullable
                      as String?,
            setup: freezed == setup
                ? _value.setup
                : setup // ignore: cast_nullable_to_non_nullable
                      as String?,
            unconsciousPattern: freezed == unconsciousPattern
                ? _value.unconsciousPattern
                : unconsciousPattern // ignore: cast_nullable_to_non_nullable
                      as String?,
            unconsciousPath: freezed == unconsciousPath
                ? _value.unconsciousPath
                : unconsciousPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            consciousPath: freezed == consciousPath
                ? _value.consciousPath
                : consciousPath // ignore: cast_nullable_to_non_nullable
                      as String?,
            actions: null == actions
                ? _value.actions
                : actions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            avoid: null == avoid
                ? _value.avoid
                : avoid // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            examples: null == examples
                ? _value.examples
                : examples // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WhatIfScenarioImplCopyWith<$Res>
    implements $WhatIfScenarioCopyWith<$Res> {
  factory _$$WhatIfScenarioImplCopyWith(
    _$WhatIfScenarioImpl value,
    $Res Function(_$WhatIfScenarioImpl) then,
  ) = __$$WhatIfScenarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String theme,
    String? myMode,
    String? theirMode,
    String? setup,
    String? unconsciousPattern,
    String? unconsciousPath,
    String? consciousPath,
    List<String> actions,
    List<String> avoid,
    List<RelationshipExampleRef> examples,
  });
}

/// @nodoc
class __$$WhatIfScenarioImplCopyWithImpl<$Res>
    extends _$WhatIfScenarioCopyWithImpl<$Res, _$WhatIfScenarioImpl>
    implements _$$WhatIfScenarioImplCopyWith<$Res> {
  __$$WhatIfScenarioImplCopyWithImpl(
    _$WhatIfScenarioImpl _value,
    $Res Function(_$WhatIfScenarioImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WhatIfScenario
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? myMode = freezed,
    Object? theirMode = freezed,
    Object? setup = freezed,
    Object? unconsciousPattern = freezed,
    Object? unconsciousPath = freezed,
    Object? consciousPath = freezed,
    Object? actions = null,
    Object? avoid = null,
    Object? examples = null,
  }) {
    return _then(
      _$WhatIfScenarioImpl(
        theme: null == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as String,
        myMode: freezed == myMode
            ? _value.myMode
            : myMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        theirMode: freezed == theirMode
            ? _value.theirMode
            : theirMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        setup: freezed == setup
            ? _value.setup
            : setup // ignore: cast_nullable_to_non_nullable
                  as String?,
        unconsciousPattern: freezed == unconsciousPattern
            ? _value.unconsciousPattern
            : unconsciousPattern // ignore: cast_nullable_to_non_nullable
                  as String?,
        unconsciousPath: freezed == unconsciousPath
            ? _value.unconsciousPath
            : unconsciousPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        consciousPath: freezed == consciousPath
            ? _value.consciousPath
            : consciousPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        actions: null == actions
            ? _value._actions
            : actions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        avoid: null == avoid
            ? _value._avoid
            : avoid // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        examples: null == examples
            ? _value._examples
            : examples // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WhatIfScenarioImpl implements _WhatIfScenario {
  const _$WhatIfScenarioImpl({
    required this.theme,
    this.myMode,
    this.theirMode,
    this.setup,
    this.unconsciousPattern,
    this.unconsciousPath,
    this.consciousPath,
    final List<String> actions = const [],
    final List<String> avoid = const [],
    final List<RelationshipExampleRef> examples = const [],
  }) : _actions = actions,
       _avoid = avoid,
       _examples = examples;

  factory _$WhatIfScenarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhatIfScenarioImplFromJson(json);

  @override
  final String theme;
  // 'conflict', 'intimacy', 'trust', 'autonomy', 'authority'
  @override
  final String? myMode;
  // e.g., 'char_x_phase_y'
  @override
  final String? theirMode;
  // e.g., 'char_a_phase_b'
  @override
  final String? setup;
  // Specific real-life situation
  @override
  final String? unconsciousPattern;
  // Likely projection/trigger
  @override
  final String? unconsciousPath;
  // What happens if unconscious
  @override
  final String? consciousPath;
  // What happens with individuation
  final List<String> _actions;
  // What happens with individuation
  @override
  @JsonKey()
  List<String> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  // Actions that change trajectory
  final List<String> _avoid;
  // Actions that change trajectory
  @override
  @JsonKey()
  List<String> get avoid {
    if (_avoid is EqualUnmodifiableListView) return _avoid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_avoid);
  }

  // What to avoid
  final List<RelationshipExampleRef> _examples;
  // What to avoid
  @override
  @JsonKey()
  List<RelationshipExampleRef> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  @override
  String toString() {
    return 'WhatIfScenario(theme: $theme, myMode: $myMode, theirMode: $theirMode, setup: $setup, unconsciousPattern: $unconsciousPattern, unconsciousPath: $unconsciousPath, consciousPath: $consciousPath, actions: $actions, avoid: $avoid, examples: $examples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WhatIfScenarioImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.myMode, myMode) || other.myMode == myMode) &&
            (identical(other.theirMode, theirMode) ||
                other.theirMode == theirMode) &&
            (identical(other.setup, setup) || other.setup == setup) &&
            (identical(other.unconsciousPattern, unconsciousPattern) ||
                other.unconsciousPattern == unconsciousPattern) &&
            (identical(other.unconsciousPath, unconsciousPath) ||
                other.unconsciousPath == unconsciousPath) &&
            (identical(other.consciousPath, consciousPath) ||
                other.consciousPath == consciousPath) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            const DeepCollectionEquality().equals(other._avoid, _avoid) &&
            const DeepCollectionEquality().equals(other._examples, _examples));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    theme,
    myMode,
    theirMode,
    setup,
    unconsciousPattern,
    unconsciousPath,
    consciousPath,
    const DeepCollectionEquality().hash(_actions),
    const DeepCollectionEquality().hash(_avoid),
    const DeepCollectionEquality().hash(_examples),
  );

  /// Create a copy of WhatIfScenario
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WhatIfScenarioImplCopyWith<_$WhatIfScenarioImpl> get copyWith =>
      __$$WhatIfScenarioImplCopyWithImpl<_$WhatIfScenarioImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WhatIfScenarioImplToJson(this);
  }
}

abstract class _WhatIfScenario implements WhatIfScenario {
  const factory _WhatIfScenario({
    required final String theme,
    final String? myMode,
    final String? theirMode,
    final String? setup,
    final String? unconsciousPattern,
    final String? unconsciousPath,
    final String? consciousPath,
    final List<String> actions,
    final List<String> avoid,
    final List<RelationshipExampleRef> examples,
  }) = _$WhatIfScenarioImpl;

  factory _WhatIfScenario.fromJson(Map<String, dynamic> json) =
      _$WhatIfScenarioImpl.fromJson;

  @override
  String get theme; // 'conflict', 'intimacy', 'trust', 'autonomy', 'authority'
  @override
  String? get myMode; // e.g., 'char_x_phase_y'
  @override
  String? get theirMode; // e.g., 'char_a_phase_b'
  @override
  String? get setup; // Specific real-life situation
  @override
  String? get unconsciousPattern; // Likely projection/trigger
  @override
  String? get unconsciousPath; // What happens if unconscious
  @override
  String? get consciousPath; // What happens with individuation
  @override
  List<String> get actions; // Actions that change trajectory
  @override
  List<String> get avoid; // What to avoid
  @override
  List<RelationshipExampleRef> get examples;

  /// Create a copy of WhatIfScenario
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WhatIfScenarioImplCopyWith<_$WhatIfScenarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EaseZones _$EaseZonesFromJson(Map<String, dynamic> json) {
  return _EaseZones.fromJson(json);
}

/// @nodoc
mixin _$EaseZones {
  String? get summary => throw _privateConstructorUsedError;
  List<String> get zones =>
      throw _privateConstructorUsedError; // List of ease zone names
  /// Detailed zones with examples (from AI)
  List<EaseZoneDetail> get zonesWithExamples =>
      throw _privateConstructorUsedError;

  /// Examples for this module
  List<RelationshipExampleRef> get exampleRefs =>
      throw _privateConstructorUsedError;

  /// Serializes this EaseZones to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EaseZones
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EaseZonesCopyWith<EaseZones> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EaseZonesCopyWith<$Res> {
  factory $EaseZonesCopyWith(EaseZones value, $Res Function(EaseZones) then) =
      _$EaseZonesCopyWithImpl<$Res, EaseZones>;
  @useResult
  $Res call({
    String? summary,
    List<String> zones,
    List<EaseZoneDetail> zonesWithExamples,
    List<RelationshipExampleRef> exampleRefs,
  });
}

/// @nodoc
class _$EaseZonesCopyWithImpl<$Res, $Val extends EaseZones>
    implements $EaseZonesCopyWith<$Res> {
  _$EaseZonesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EaseZones
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? zones = null,
    Object? zonesWithExamples = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            zones: null == zones
                ? _value.zones
                : zones // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            zonesWithExamples: null == zonesWithExamples
                ? _value.zonesWithExamples
                : zonesWithExamples // ignore: cast_nullable_to_non_nullable
                      as List<EaseZoneDetail>,
            exampleRefs: null == exampleRefs
                ? _value.exampleRefs
                : exampleRefs // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EaseZonesImplCopyWith<$Res>
    implements $EaseZonesCopyWith<$Res> {
  factory _$$EaseZonesImplCopyWith(
    _$EaseZonesImpl value,
    $Res Function(_$EaseZonesImpl) then,
  ) = __$$EaseZonesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    List<String> zones,
    List<EaseZoneDetail> zonesWithExamples,
    List<RelationshipExampleRef> exampleRefs,
  });
}

/// @nodoc
class __$$EaseZonesImplCopyWithImpl<$Res>
    extends _$EaseZonesCopyWithImpl<$Res, _$EaseZonesImpl>
    implements _$$EaseZonesImplCopyWith<$Res> {
  __$$EaseZonesImplCopyWithImpl(
    _$EaseZonesImpl _value,
    $Res Function(_$EaseZonesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EaseZones
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? zones = null,
    Object? zonesWithExamples = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$EaseZonesImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        zones: null == zones
            ? _value._zones
            : zones // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        zonesWithExamples: null == zonesWithExamples
            ? _value._zonesWithExamples
            : zonesWithExamples // ignore: cast_nullable_to_non_nullable
                  as List<EaseZoneDetail>,
        exampleRefs: null == exampleRefs
            ? _value._exampleRefs
            : exampleRefs // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EaseZonesImpl implements _EaseZones {
  const _$EaseZonesImpl({
    this.summary,
    final List<String> zones = const [],
    final List<EaseZoneDetail> zonesWithExamples = const [],
    final List<RelationshipExampleRef> exampleRefs = const [],
  }) : _zones = zones,
       _zonesWithExamples = zonesWithExamples,
       _exampleRefs = exampleRefs;

  factory _$EaseZonesImpl.fromJson(Map<String, dynamic> json) =>
      _$$EaseZonesImplFromJson(json);

  @override
  final String? summary;
  final List<String> _zones;
  @override
  @JsonKey()
  List<String> get zones {
    if (_zones is EqualUnmodifiableListView) return _zones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zones);
  }

  // List of ease zone names
  /// Detailed zones with examples (from AI)
  final List<EaseZoneDetail> _zonesWithExamples;
  // List of ease zone names
  /// Detailed zones with examples (from AI)
  @override
  @JsonKey()
  List<EaseZoneDetail> get zonesWithExamples {
    if (_zonesWithExamples is EqualUnmodifiableListView)
      return _zonesWithExamples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zonesWithExamples);
  }

  /// Examples for this module
  final List<RelationshipExampleRef> _exampleRefs;

  /// Examples for this module
  @override
  @JsonKey()
  List<RelationshipExampleRef> get exampleRefs {
    if (_exampleRefs is EqualUnmodifiableListView) return _exampleRefs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exampleRefs);
  }

  @override
  String toString() {
    return 'EaseZones(summary: $summary, zones: $zones, zonesWithExamples: $zonesWithExamples, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EaseZonesImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._zones, _zones) &&
            const DeepCollectionEquality().equals(
              other._zonesWithExamples,
              _zonesWithExamples,
            ) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    const DeepCollectionEquality().hash(_zones),
    const DeepCollectionEquality().hash(_zonesWithExamples),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of EaseZones
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EaseZonesImplCopyWith<_$EaseZonesImpl> get copyWith =>
      __$$EaseZonesImplCopyWithImpl<_$EaseZonesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EaseZonesImplToJson(this);
  }
}

abstract class _EaseZones implements EaseZones {
  const factory _EaseZones({
    final String? summary,
    final List<String> zones,
    final List<EaseZoneDetail> zonesWithExamples,
    final List<RelationshipExampleRef> exampleRefs,
  }) = _$EaseZonesImpl;

  factory _EaseZones.fromJson(Map<String, dynamic> json) =
      _$EaseZonesImpl.fromJson;

  @override
  String? get summary;
  @override
  List<String> get zones; // List of ease zone names
  /// Detailed zones with examples (from AI)
  @override
  List<EaseZoneDetail> get zonesWithExamples;

  /// Examples for this module
  @override
  List<RelationshipExampleRef> get exampleRefs;

  /// Create a copy of EaseZones
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EaseZonesImplCopyWith<_$EaseZonesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EaseZoneDetail _$EaseZoneDetailFromJson(Map<String, dynamic> json) {
  return _EaseZoneDetail.fromJson(json);
}

/// @nodoc
mixin _$EaseZoneDetail {
  String? get zone => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  EaseZoneExample? get example => throw _privateConstructorUsedError;

  /// Serializes this EaseZoneDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EaseZoneDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EaseZoneDetailCopyWith<EaseZoneDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EaseZoneDetailCopyWith<$Res> {
  factory $EaseZoneDetailCopyWith(
    EaseZoneDetail value,
    $Res Function(EaseZoneDetail) then,
  ) = _$EaseZoneDetailCopyWithImpl<$Res, EaseZoneDetail>;
  @useResult
  $Res call({String? zone, String? description, EaseZoneExample? example});

  $EaseZoneExampleCopyWith<$Res>? get example;
}

/// @nodoc
class _$EaseZoneDetailCopyWithImpl<$Res, $Val extends EaseZoneDetail>
    implements $EaseZoneDetailCopyWith<$Res> {
  _$EaseZoneDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EaseZoneDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zone = freezed,
    Object? description = freezed,
    Object? example = freezed,
  }) {
    return _then(
      _value.copyWith(
            zone: freezed == zone
                ? _value.zone
                : zone // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            example: freezed == example
                ? _value.example
                : example // ignore: cast_nullable_to_non_nullable
                      as EaseZoneExample?,
          )
          as $Val,
    );
  }

  /// Create a copy of EaseZoneDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EaseZoneExampleCopyWith<$Res>? get example {
    if (_value.example == null) {
      return null;
    }

    return $EaseZoneExampleCopyWith<$Res>(_value.example!, (value) {
      return _then(_value.copyWith(example: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EaseZoneDetailImplCopyWith<$Res>
    implements $EaseZoneDetailCopyWith<$Res> {
  factory _$$EaseZoneDetailImplCopyWith(
    _$EaseZoneDetailImpl value,
    $Res Function(_$EaseZoneDetailImpl) then,
  ) = __$$EaseZoneDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? zone, String? description, EaseZoneExample? example});

  @override
  $EaseZoneExampleCopyWith<$Res>? get example;
}

/// @nodoc
class __$$EaseZoneDetailImplCopyWithImpl<$Res>
    extends _$EaseZoneDetailCopyWithImpl<$Res, _$EaseZoneDetailImpl>
    implements _$$EaseZoneDetailImplCopyWith<$Res> {
  __$$EaseZoneDetailImplCopyWithImpl(
    _$EaseZoneDetailImpl _value,
    $Res Function(_$EaseZoneDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EaseZoneDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zone = freezed,
    Object? description = freezed,
    Object? example = freezed,
  }) {
    return _then(
      _$EaseZoneDetailImpl(
        zone: freezed == zone
            ? _value.zone
            : zone // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        example: freezed == example
            ? _value.example
            : example // ignore: cast_nullable_to_non_nullable
                  as EaseZoneExample?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EaseZoneDetailImpl implements _EaseZoneDetail {
  const _$EaseZoneDetailImpl({this.zone, this.description, this.example});

  factory _$EaseZoneDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$EaseZoneDetailImplFromJson(json);

  @override
  final String? zone;
  @override
  final String? description;
  @override
  final EaseZoneExample? example;

  @override
  String toString() {
    return 'EaseZoneDetail(zone: $zone, description: $description, example: $example)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EaseZoneDetailImpl &&
            (identical(other.zone, zone) || other.zone == zone) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.example, example) || other.example == example));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, zone, description, example);

  /// Create a copy of EaseZoneDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EaseZoneDetailImplCopyWith<_$EaseZoneDetailImpl> get copyWith =>
      __$$EaseZoneDetailImplCopyWithImpl<_$EaseZoneDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EaseZoneDetailImplToJson(this);
  }
}

abstract class _EaseZoneDetail implements EaseZoneDetail {
  const factory _EaseZoneDetail({
    final String? zone,
    final String? description,
    final EaseZoneExample? example,
  }) = _$EaseZoneDetailImpl;

  factory _EaseZoneDetail.fromJson(Map<String, dynamic> json) =
      _$EaseZoneDetailImpl.fromJson;

  @override
  String? get zone;
  @override
  String? get description;
  @override
  EaseZoneExample? get example;

  /// Create a copy of EaseZoneDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EaseZoneDetailImplCopyWith<_$EaseZoneDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EaseZoneExample _$EaseZoneExampleFromJson(Map<String, dynamic> json) {
  return _EaseZoneExample.fromJson(json);
}

/// @nodoc
mixin _$EaseZoneExample {
  String? get characterName => throw _privateConstructorUsedError;
  RelationshipExampleReference? get reference =>
      throw _privateConstructorUsedError;
  String? get scene => throw _privateConstructorUsedError;

  /// Serializes this EaseZoneExample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EaseZoneExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EaseZoneExampleCopyWith<EaseZoneExample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EaseZoneExampleCopyWith<$Res> {
  factory $EaseZoneExampleCopyWith(
    EaseZoneExample value,
    $Res Function(EaseZoneExample) then,
  ) = _$EaseZoneExampleCopyWithImpl<$Res, EaseZoneExample>;
  @useResult
  $Res call({
    String? characterName,
    RelationshipExampleReference? reference,
    String? scene,
  });

  $RelationshipExampleReferenceCopyWith<$Res>? get reference;
}

/// @nodoc
class _$EaseZoneExampleCopyWithImpl<$Res, $Val extends EaseZoneExample>
    implements $EaseZoneExampleCopyWith<$Res> {
  _$EaseZoneExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EaseZoneExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterName = freezed,
    Object? reference = freezed,
    Object? scene = freezed,
  }) {
    return _then(
      _value.copyWith(
            characterName: freezed == characterName
                ? _value.characterName
                : characterName // ignore: cast_nullable_to_non_nullable
                      as String?,
            reference: freezed == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as RelationshipExampleReference?,
            scene: freezed == scene
                ? _value.scene
                : scene // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of EaseZoneExample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipExampleReferenceCopyWith<$Res>? get reference {
    if (_value.reference == null) {
      return null;
    }

    return $RelationshipExampleReferenceCopyWith<$Res>(_value.reference!, (
      value,
    ) {
      return _then(_value.copyWith(reference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EaseZoneExampleImplCopyWith<$Res>
    implements $EaseZoneExampleCopyWith<$Res> {
  factory _$$EaseZoneExampleImplCopyWith(
    _$EaseZoneExampleImpl value,
    $Res Function(_$EaseZoneExampleImpl) then,
  ) = __$$EaseZoneExampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? characterName,
    RelationshipExampleReference? reference,
    String? scene,
  });

  @override
  $RelationshipExampleReferenceCopyWith<$Res>? get reference;
}

/// @nodoc
class __$$EaseZoneExampleImplCopyWithImpl<$Res>
    extends _$EaseZoneExampleCopyWithImpl<$Res, _$EaseZoneExampleImpl>
    implements _$$EaseZoneExampleImplCopyWith<$Res> {
  __$$EaseZoneExampleImplCopyWithImpl(
    _$EaseZoneExampleImpl _value,
    $Res Function(_$EaseZoneExampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EaseZoneExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterName = freezed,
    Object? reference = freezed,
    Object? scene = freezed,
  }) {
    return _then(
      _$EaseZoneExampleImpl(
        characterName: freezed == characterName
            ? _value.characterName
            : characterName // ignore: cast_nullable_to_non_nullable
                  as String?,
        reference: freezed == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as RelationshipExampleReference?,
        scene: freezed == scene
            ? _value.scene
            : scene // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EaseZoneExampleImpl implements _EaseZoneExample {
  const _$EaseZoneExampleImpl({this.characterName, this.reference, this.scene});

  factory _$EaseZoneExampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$EaseZoneExampleImplFromJson(json);

  @override
  final String? characterName;
  @override
  final RelationshipExampleReference? reference;
  @override
  final String? scene;

  @override
  String toString() {
    return 'EaseZoneExample(characterName: $characterName, reference: $reference, scene: $scene)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EaseZoneExampleImpl &&
            (identical(other.characterName, characterName) ||
                other.characterName == characterName) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.scene, scene) || other.scene == scene));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, characterName, reference, scene);

  /// Create a copy of EaseZoneExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EaseZoneExampleImplCopyWith<_$EaseZoneExampleImpl> get copyWith =>
      __$$EaseZoneExampleImplCopyWithImpl<_$EaseZoneExampleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EaseZoneExampleImplToJson(this);
  }
}

abstract class _EaseZoneExample implements EaseZoneExample {
  const factory _EaseZoneExample({
    final String? characterName,
    final RelationshipExampleReference? reference,
    final String? scene,
  }) = _$EaseZoneExampleImpl;

  factory _EaseZoneExample.fromJson(Map<String, dynamic> json) =
      _$EaseZoneExampleImpl.fromJson;

  @override
  String? get characterName;
  @override
  RelationshipExampleReference? get reference;
  @override
  String? get scene;

  /// Create a copy of EaseZoneExample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EaseZoneExampleImplCopyWith<_$EaseZoneExampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RuptureLoops _$RuptureLoopsFromJson(Map<String, dynamic> json) {
  return _RuptureLoops.fromJson(json);
}

/// @nodoc
mixin _$RuptureLoops {
  String? get summary => throw _privateConstructorUsedError;
  List<RuptureLoop> get loops => throw _privateConstructorUsedError;

  /// Examples for this module
  List<RelationshipExampleRef> get exampleRefs =>
      throw _privateConstructorUsedError;

  /// Serializes this RuptureLoops to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RuptureLoops
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RuptureLoopsCopyWith<RuptureLoops> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuptureLoopsCopyWith<$Res> {
  factory $RuptureLoopsCopyWith(
    RuptureLoops value,
    $Res Function(RuptureLoops) then,
  ) = _$RuptureLoopsCopyWithImpl<$Res, RuptureLoops>;
  @useResult
  $Res call({
    String? summary,
    List<RuptureLoop> loops,
    List<RelationshipExampleRef> exampleRefs,
  });
}

/// @nodoc
class _$RuptureLoopsCopyWithImpl<$Res, $Val extends RuptureLoops>
    implements $RuptureLoopsCopyWith<$Res> {
  _$RuptureLoopsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuptureLoops
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? loops = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            loops: null == loops
                ? _value.loops
                : loops // ignore: cast_nullable_to_non_nullable
                      as List<RuptureLoop>,
            exampleRefs: null == exampleRefs
                ? _value.exampleRefs
                : exampleRefs // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RuptureLoopsImplCopyWith<$Res>
    implements $RuptureLoopsCopyWith<$Res> {
  factory _$$RuptureLoopsImplCopyWith(
    _$RuptureLoopsImpl value,
    $Res Function(_$RuptureLoopsImpl) then,
  ) = __$$RuptureLoopsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    List<RuptureLoop> loops,
    List<RelationshipExampleRef> exampleRefs,
  });
}

/// @nodoc
class __$$RuptureLoopsImplCopyWithImpl<$Res>
    extends _$RuptureLoopsCopyWithImpl<$Res, _$RuptureLoopsImpl>
    implements _$$RuptureLoopsImplCopyWith<$Res> {
  __$$RuptureLoopsImplCopyWithImpl(
    _$RuptureLoopsImpl _value,
    $Res Function(_$RuptureLoopsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RuptureLoops
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? loops = null,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$RuptureLoopsImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        loops: null == loops
            ? _value._loops
            : loops // ignore: cast_nullable_to_non_nullable
                  as List<RuptureLoop>,
        exampleRefs: null == exampleRefs
            ? _value._exampleRefs
            : exampleRefs // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RuptureLoopsImpl implements _RuptureLoops {
  const _$RuptureLoopsImpl({
    this.summary,
    final List<RuptureLoop> loops = const [],
    final List<RelationshipExampleRef> exampleRefs = const [],
  }) : _loops = loops,
       _exampleRefs = exampleRefs;

  factory _$RuptureLoopsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuptureLoopsImplFromJson(json);

  @override
  final String? summary;
  final List<RuptureLoop> _loops;
  @override
  @JsonKey()
  List<RuptureLoop> get loops {
    if (_loops is EqualUnmodifiableListView) return _loops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loops);
  }

  /// Examples for this module
  final List<RelationshipExampleRef> _exampleRefs;

  /// Examples for this module
  @override
  @JsonKey()
  List<RelationshipExampleRef> get exampleRefs {
    if (_exampleRefs is EqualUnmodifiableListView) return _exampleRefs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exampleRefs);
  }

  @override
  String toString() {
    return 'RuptureLoops(summary: $summary, loops: $loops, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuptureLoopsImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._loops, _loops) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    const DeepCollectionEquality().hash(_loops),
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of RuptureLoops
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuptureLoopsImplCopyWith<_$RuptureLoopsImpl> get copyWith =>
      __$$RuptureLoopsImplCopyWithImpl<_$RuptureLoopsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuptureLoopsImplToJson(this);
  }
}

abstract class _RuptureLoops implements RuptureLoops {
  const factory _RuptureLoops({
    final String? summary,
    final List<RuptureLoop> loops,
    final List<RelationshipExampleRef> exampleRefs,
  }) = _$RuptureLoopsImpl;

  factory _RuptureLoops.fromJson(Map<String, dynamic> json) =
      _$RuptureLoopsImpl.fromJson;

  @override
  String? get summary;
  @override
  List<RuptureLoop> get loops;

  /// Examples for this module
  @override
  List<RelationshipExampleRef> get exampleRefs;

  /// Create a copy of RuptureLoops
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuptureLoopsImplCopyWith<_$RuptureLoopsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RuptureLoop _$RuptureLoopFromJson(Map<String, dynamic> json) {
  return _RuptureLoop.fromJson(json);
}

/// @nodoc
mixin _$RuptureLoop {
  String? get name => throw _privateConstructorUsedError;
  String? get trigger => throw _privateConstructorUsedError;
  String? get pattern => throw _privateConstructorUsedError;
  String? get repair => throw _privateConstructorUsedError;

  /// Serializes this RuptureLoop to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RuptureLoop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RuptureLoopCopyWith<RuptureLoop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuptureLoopCopyWith<$Res> {
  factory $RuptureLoopCopyWith(
    RuptureLoop value,
    $Res Function(RuptureLoop) then,
  ) = _$RuptureLoopCopyWithImpl<$Res, RuptureLoop>;
  @useResult
  $Res call({String? name, String? trigger, String? pattern, String? repair});
}

/// @nodoc
class _$RuptureLoopCopyWithImpl<$Res, $Val extends RuptureLoop>
    implements $RuptureLoopCopyWith<$Res> {
  _$RuptureLoopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuptureLoop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? trigger = freezed,
    Object? pattern = freezed,
    Object? repair = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            trigger: freezed == trigger
                ? _value.trigger
                : trigger // ignore: cast_nullable_to_non_nullable
                      as String?,
            pattern: freezed == pattern
                ? _value.pattern
                : pattern // ignore: cast_nullable_to_non_nullable
                      as String?,
            repair: freezed == repair
                ? _value.repair
                : repair // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RuptureLoopImplCopyWith<$Res>
    implements $RuptureLoopCopyWith<$Res> {
  factory _$$RuptureLoopImplCopyWith(
    _$RuptureLoopImpl value,
    $Res Function(_$RuptureLoopImpl) then,
  ) = __$$RuptureLoopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? trigger, String? pattern, String? repair});
}

/// @nodoc
class __$$RuptureLoopImplCopyWithImpl<$Res>
    extends _$RuptureLoopCopyWithImpl<$Res, _$RuptureLoopImpl>
    implements _$$RuptureLoopImplCopyWith<$Res> {
  __$$RuptureLoopImplCopyWithImpl(
    _$RuptureLoopImpl _value,
    $Res Function(_$RuptureLoopImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RuptureLoop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? trigger = freezed,
    Object? pattern = freezed,
    Object? repair = freezed,
  }) {
    return _then(
      _$RuptureLoopImpl(
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        trigger: freezed == trigger
            ? _value.trigger
            : trigger // ignore: cast_nullable_to_non_nullable
                  as String?,
        pattern: freezed == pattern
            ? _value.pattern
            : pattern // ignore: cast_nullable_to_non_nullable
                  as String?,
        repair: freezed == repair
            ? _value.repair
            : repair // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RuptureLoopImpl implements _RuptureLoop {
  const _$RuptureLoopImpl({this.name, this.trigger, this.pattern, this.repair});

  factory _$RuptureLoopImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuptureLoopImplFromJson(json);

  @override
  final String? name;
  @override
  final String? trigger;
  @override
  final String? pattern;
  @override
  final String? repair;

  @override
  String toString() {
    return 'RuptureLoop(name: $name, trigger: $trigger, pattern: $pattern, repair: $repair)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuptureLoopImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.repair, repair) || other.repair == repair));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, trigger, pattern, repair);

  /// Create a copy of RuptureLoop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuptureLoopImplCopyWith<_$RuptureLoopImpl> get copyWith =>
      __$$RuptureLoopImplCopyWithImpl<_$RuptureLoopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuptureLoopImplToJson(this);
  }
}

abstract class _RuptureLoop implements RuptureLoop {
  const factory _RuptureLoop({
    final String? name,
    final String? trigger,
    final String? pattern,
    final String? repair,
  }) = _$RuptureLoopImpl;

  factory _RuptureLoop.fromJson(Map<String, dynamic> json) =
      _$RuptureLoopImpl.fromJson;

  @override
  String? get name;
  @override
  String? get trigger;
  @override
  String? get pattern;
  @override
  String? get repair;

  /// Create a copy of RuptureLoop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuptureLoopImplCopyWith<_$RuptureLoopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelationshipMyth _$RelationshipMythFromJson(Map<String, dynamic> json) {
  return _RelationshipMyth.fromJson(json);
}

/// @nodoc
mixin _$RelationshipMyth {
  String? get title => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get themes => throw _privateConstructorUsedError;

  /// Serializes this RelationshipMyth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipMyth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipMythCopyWith<RelationshipMyth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipMythCopyWith<$Res> {
  factory $RelationshipMythCopyWith(
    RelationshipMyth value,
    $Res Function(RelationshipMyth) then,
  ) = _$RelationshipMythCopyWithImpl<$Res, RelationshipMyth>;
  @useResult
  $Res call({
    String? title,
    String? summary,
    String? story,
    List<String> themes,
  });
}

/// @nodoc
class _$RelationshipMythCopyWithImpl<$Res, $Val extends RelationshipMyth>
    implements $RelationshipMythCopyWith<$Res> {
  _$RelationshipMythCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipMyth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? summary = freezed,
    Object? story = freezed,
    Object? themes = null,
  }) {
    return _then(
      _value.copyWith(
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            themes: null == themes
                ? _value.themes
                : themes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RelationshipMythImplCopyWith<$Res>
    implements $RelationshipMythCopyWith<$Res> {
  factory _$$RelationshipMythImplCopyWith(
    _$RelationshipMythImpl value,
    $Res Function(_$RelationshipMythImpl) then,
  ) = __$$RelationshipMythImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? title,
    String? summary,
    String? story,
    List<String> themes,
  });
}

/// @nodoc
class __$$RelationshipMythImplCopyWithImpl<$Res>
    extends _$RelationshipMythCopyWithImpl<$Res, _$RelationshipMythImpl>
    implements _$$RelationshipMythImplCopyWith<$Res> {
  __$$RelationshipMythImplCopyWithImpl(
    _$RelationshipMythImpl _value,
    $Res Function(_$RelationshipMythImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipMyth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? summary = freezed,
    Object? story = freezed,
    Object? themes = null,
  }) {
    return _then(
      _$RelationshipMythImpl(
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        themes: null == themes
            ? _value._themes
            : themes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipMythImpl implements _RelationshipMyth {
  const _$RelationshipMythImpl({
    this.title,
    this.summary,
    this.story,
    final List<String> themes = const [],
  }) : _themes = themes;

  factory _$RelationshipMythImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipMythImplFromJson(json);

  @override
  final String? title;
  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _themes;
  @override
  @JsonKey()
  List<String> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  @override
  String toString() {
    return 'RelationshipMyth(title: $title, summary: $summary, story: $story, themes: $themes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipMythImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(other._themes, _themes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    summary,
    story,
    const DeepCollectionEquality().hash(_themes),
  );

  /// Create a copy of RelationshipMyth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipMythImplCopyWith<_$RelationshipMythImpl> get copyWith =>
      __$$RelationshipMythImplCopyWithImpl<_$RelationshipMythImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipMythImplToJson(this);
  }
}

abstract class _RelationshipMyth implements RelationshipMyth {
  const factory _RelationshipMyth({
    final String? title,
    final String? summary,
    final String? story,
    final List<String> themes,
  }) = _$RelationshipMythImpl;

  factory _RelationshipMyth.fromJson(Map<String, dynamic> json) =
      _$RelationshipMythImpl.fromJson;

  @override
  String? get title;
  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get themes;

  /// Create a copy of RelationshipMyth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipMythImplCopyWith<_$RelationshipMythImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelationshipNarrative _$RelationshipNarrativeFromJson(
  Map<String, dynamic> json,
) {
  return _RelationshipNarrative.fromJson(json);
}

/// @nodoc
mixin _$RelationshipNarrative {
  ModuleNarrative? get relationalField => throw _privateConstructorUsedError;
  ModuleNarrative? get attractionBonding => throw _privateConstructorUsedError;
  ModuleNarrative? get projectionShadow => throw _privateConstructorUsedError;
  ModuleNarrative? get egoPersonaMismatch => throw _privateConstructorUsedError;
  ModuleNarrative? get communicationConflict =>
      throw _privateConstructorUsedError;
  ModuleNarrative? get needsBoundaries => throw _privateConstructorUsedError;
  ModuleNarrative? get growthPath => throw _privateConstructorUsedError;
  ModuleNarrative? get redFlagsRepair => throw _privateConstructorUsedError;
  List<SituationalGuidance> get nextSteps => throw _privateConstructorUsedError;

  /// Serializes this RelationshipNarrative to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipNarrativeCopyWith<RelationshipNarrative> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipNarrativeCopyWith<$Res> {
  factory $RelationshipNarrativeCopyWith(
    RelationshipNarrative value,
    $Res Function(RelationshipNarrative) then,
  ) = _$RelationshipNarrativeCopyWithImpl<$Res, RelationshipNarrative>;
  @useResult
  $Res call({
    ModuleNarrative? relationalField,
    ModuleNarrative? attractionBonding,
    ModuleNarrative? projectionShadow,
    ModuleNarrative? egoPersonaMismatch,
    ModuleNarrative? communicationConflict,
    ModuleNarrative? needsBoundaries,
    ModuleNarrative? growthPath,
    ModuleNarrative? redFlagsRepair,
    List<SituationalGuidance> nextSteps,
  });

  $ModuleNarrativeCopyWith<$Res>? get relationalField;
  $ModuleNarrativeCopyWith<$Res>? get attractionBonding;
  $ModuleNarrativeCopyWith<$Res>? get projectionShadow;
  $ModuleNarrativeCopyWith<$Res>? get egoPersonaMismatch;
  $ModuleNarrativeCopyWith<$Res>? get communicationConflict;
  $ModuleNarrativeCopyWith<$Res>? get needsBoundaries;
  $ModuleNarrativeCopyWith<$Res>? get growthPath;
  $ModuleNarrativeCopyWith<$Res>? get redFlagsRepair;
}

/// @nodoc
class _$RelationshipNarrativeCopyWithImpl<
  $Res,
  $Val extends RelationshipNarrative
>
    implements $RelationshipNarrativeCopyWith<$Res> {
  _$RelationshipNarrativeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relationalField = freezed,
    Object? attractionBonding = freezed,
    Object? projectionShadow = freezed,
    Object? egoPersonaMismatch = freezed,
    Object? communicationConflict = freezed,
    Object? needsBoundaries = freezed,
    Object? growthPath = freezed,
    Object? redFlagsRepair = freezed,
    Object? nextSteps = null,
  }) {
    return _then(
      _value.copyWith(
            relationalField: freezed == relationalField
                ? _value.relationalField
                : relationalField // ignore: cast_nullable_to_non_nullable
                      as ModuleNarrative?,
            attractionBonding: freezed == attractionBonding
                ? _value.attractionBonding
                : attractionBonding // ignore: cast_nullable_to_non_nullable
                      as ModuleNarrative?,
            projectionShadow: freezed == projectionShadow
                ? _value.projectionShadow
                : projectionShadow // ignore: cast_nullable_to_non_nullable
                      as ModuleNarrative?,
            egoPersonaMismatch: freezed == egoPersonaMismatch
                ? _value.egoPersonaMismatch
                : egoPersonaMismatch // ignore: cast_nullable_to_non_nullable
                      as ModuleNarrative?,
            communicationConflict: freezed == communicationConflict
                ? _value.communicationConflict
                : communicationConflict // ignore: cast_nullable_to_non_nullable
                      as ModuleNarrative?,
            needsBoundaries: freezed == needsBoundaries
                ? _value.needsBoundaries
                : needsBoundaries // ignore: cast_nullable_to_non_nullable
                      as ModuleNarrative?,
            growthPath: freezed == growthPath
                ? _value.growthPath
                : growthPath // ignore: cast_nullable_to_non_nullable
                      as ModuleNarrative?,
            redFlagsRepair: freezed == redFlagsRepair
                ? _value.redFlagsRepair
                : redFlagsRepair // ignore: cast_nullable_to_non_nullable
                      as ModuleNarrative?,
            nextSteps: null == nextSteps
                ? _value.nextSteps
                : nextSteps // ignore: cast_nullable_to_non_nullable
                      as List<SituationalGuidance>,
          )
          as $Val,
    );
  }

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModuleNarrativeCopyWith<$Res>? get relationalField {
    if (_value.relationalField == null) {
      return null;
    }

    return $ModuleNarrativeCopyWith<$Res>(_value.relationalField!, (value) {
      return _then(_value.copyWith(relationalField: value) as $Val);
    });
  }

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModuleNarrativeCopyWith<$Res>? get attractionBonding {
    if (_value.attractionBonding == null) {
      return null;
    }

    return $ModuleNarrativeCopyWith<$Res>(_value.attractionBonding!, (value) {
      return _then(_value.copyWith(attractionBonding: value) as $Val);
    });
  }

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModuleNarrativeCopyWith<$Res>? get projectionShadow {
    if (_value.projectionShadow == null) {
      return null;
    }

    return $ModuleNarrativeCopyWith<$Res>(_value.projectionShadow!, (value) {
      return _then(_value.copyWith(projectionShadow: value) as $Val);
    });
  }

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModuleNarrativeCopyWith<$Res>? get egoPersonaMismatch {
    if (_value.egoPersonaMismatch == null) {
      return null;
    }

    return $ModuleNarrativeCopyWith<$Res>(_value.egoPersonaMismatch!, (value) {
      return _then(_value.copyWith(egoPersonaMismatch: value) as $Val);
    });
  }

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModuleNarrativeCopyWith<$Res>? get communicationConflict {
    if (_value.communicationConflict == null) {
      return null;
    }

    return $ModuleNarrativeCopyWith<$Res>(_value.communicationConflict!, (
      value,
    ) {
      return _then(_value.copyWith(communicationConflict: value) as $Val);
    });
  }

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModuleNarrativeCopyWith<$Res>? get needsBoundaries {
    if (_value.needsBoundaries == null) {
      return null;
    }

    return $ModuleNarrativeCopyWith<$Res>(_value.needsBoundaries!, (value) {
      return _then(_value.copyWith(needsBoundaries: value) as $Val);
    });
  }

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModuleNarrativeCopyWith<$Res>? get growthPath {
    if (_value.growthPath == null) {
      return null;
    }

    return $ModuleNarrativeCopyWith<$Res>(_value.growthPath!, (value) {
      return _then(_value.copyWith(growthPath: value) as $Val);
    });
  }

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModuleNarrativeCopyWith<$Res>? get redFlagsRepair {
    if (_value.redFlagsRepair == null) {
      return null;
    }

    return $ModuleNarrativeCopyWith<$Res>(_value.redFlagsRepair!, (value) {
      return _then(_value.copyWith(redFlagsRepair: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RelationshipNarrativeImplCopyWith<$Res>
    implements $RelationshipNarrativeCopyWith<$Res> {
  factory _$$RelationshipNarrativeImplCopyWith(
    _$RelationshipNarrativeImpl value,
    $Res Function(_$RelationshipNarrativeImpl) then,
  ) = __$$RelationshipNarrativeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ModuleNarrative? relationalField,
    ModuleNarrative? attractionBonding,
    ModuleNarrative? projectionShadow,
    ModuleNarrative? egoPersonaMismatch,
    ModuleNarrative? communicationConflict,
    ModuleNarrative? needsBoundaries,
    ModuleNarrative? growthPath,
    ModuleNarrative? redFlagsRepair,
    List<SituationalGuidance> nextSteps,
  });

  @override
  $ModuleNarrativeCopyWith<$Res>? get relationalField;
  @override
  $ModuleNarrativeCopyWith<$Res>? get attractionBonding;
  @override
  $ModuleNarrativeCopyWith<$Res>? get projectionShadow;
  @override
  $ModuleNarrativeCopyWith<$Res>? get egoPersonaMismatch;
  @override
  $ModuleNarrativeCopyWith<$Res>? get communicationConflict;
  @override
  $ModuleNarrativeCopyWith<$Res>? get needsBoundaries;
  @override
  $ModuleNarrativeCopyWith<$Res>? get growthPath;
  @override
  $ModuleNarrativeCopyWith<$Res>? get redFlagsRepair;
}

/// @nodoc
class __$$RelationshipNarrativeImplCopyWithImpl<$Res>
    extends
        _$RelationshipNarrativeCopyWithImpl<$Res, _$RelationshipNarrativeImpl>
    implements _$$RelationshipNarrativeImplCopyWith<$Res> {
  __$$RelationshipNarrativeImplCopyWithImpl(
    _$RelationshipNarrativeImpl _value,
    $Res Function(_$RelationshipNarrativeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relationalField = freezed,
    Object? attractionBonding = freezed,
    Object? projectionShadow = freezed,
    Object? egoPersonaMismatch = freezed,
    Object? communicationConflict = freezed,
    Object? needsBoundaries = freezed,
    Object? growthPath = freezed,
    Object? redFlagsRepair = freezed,
    Object? nextSteps = null,
  }) {
    return _then(
      _$RelationshipNarrativeImpl(
        relationalField: freezed == relationalField
            ? _value.relationalField
            : relationalField // ignore: cast_nullable_to_non_nullable
                  as ModuleNarrative?,
        attractionBonding: freezed == attractionBonding
            ? _value.attractionBonding
            : attractionBonding // ignore: cast_nullable_to_non_nullable
                  as ModuleNarrative?,
        projectionShadow: freezed == projectionShadow
            ? _value.projectionShadow
            : projectionShadow // ignore: cast_nullable_to_non_nullable
                  as ModuleNarrative?,
        egoPersonaMismatch: freezed == egoPersonaMismatch
            ? _value.egoPersonaMismatch
            : egoPersonaMismatch // ignore: cast_nullable_to_non_nullable
                  as ModuleNarrative?,
        communicationConflict: freezed == communicationConflict
            ? _value.communicationConflict
            : communicationConflict // ignore: cast_nullable_to_non_nullable
                  as ModuleNarrative?,
        needsBoundaries: freezed == needsBoundaries
            ? _value.needsBoundaries
            : needsBoundaries // ignore: cast_nullable_to_non_nullable
                  as ModuleNarrative?,
        growthPath: freezed == growthPath
            ? _value.growthPath
            : growthPath // ignore: cast_nullable_to_non_nullable
                  as ModuleNarrative?,
        redFlagsRepair: freezed == redFlagsRepair
            ? _value.redFlagsRepair
            : redFlagsRepair // ignore: cast_nullable_to_non_nullable
                  as ModuleNarrative?,
        nextSteps: null == nextSteps
            ? _value._nextSteps
            : nextSteps // ignore: cast_nullable_to_non_nullable
                  as List<SituationalGuidance>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipNarrativeImpl implements _RelationshipNarrative {
  const _$RelationshipNarrativeImpl({
    this.relationalField,
    this.attractionBonding,
    this.projectionShadow,
    this.egoPersonaMismatch,
    this.communicationConflict,
    this.needsBoundaries,
    this.growthPath,
    this.redFlagsRepair,
    final List<SituationalGuidance> nextSteps = const [],
  }) : _nextSteps = nextSteps;

  factory _$RelationshipNarrativeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipNarrativeImplFromJson(json);

  @override
  final ModuleNarrative? relationalField;
  @override
  final ModuleNarrative? attractionBonding;
  @override
  final ModuleNarrative? projectionShadow;
  @override
  final ModuleNarrative? egoPersonaMismatch;
  @override
  final ModuleNarrative? communicationConflict;
  @override
  final ModuleNarrative? needsBoundaries;
  @override
  final ModuleNarrative? growthPath;
  @override
  final ModuleNarrative? redFlagsRepair;
  final List<SituationalGuidance> _nextSteps;
  @override
  @JsonKey()
  List<SituationalGuidance> get nextSteps {
    if (_nextSteps is EqualUnmodifiableListView) return _nextSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextSteps);
  }

  @override
  String toString() {
    return 'RelationshipNarrative(relationalField: $relationalField, attractionBonding: $attractionBonding, projectionShadow: $projectionShadow, egoPersonaMismatch: $egoPersonaMismatch, communicationConflict: $communicationConflict, needsBoundaries: $needsBoundaries, growthPath: $growthPath, redFlagsRepair: $redFlagsRepair, nextSteps: $nextSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipNarrativeImpl &&
            (identical(other.relationalField, relationalField) ||
                other.relationalField == relationalField) &&
            (identical(other.attractionBonding, attractionBonding) ||
                other.attractionBonding == attractionBonding) &&
            (identical(other.projectionShadow, projectionShadow) ||
                other.projectionShadow == projectionShadow) &&
            (identical(other.egoPersonaMismatch, egoPersonaMismatch) ||
                other.egoPersonaMismatch == egoPersonaMismatch) &&
            (identical(other.communicationConflict, communicationConflict) ||
                other.communicationConflict == communicationConflict) &&
            (identical(other.needsBoundaries, needsBoundaries) ||
                other.needsBoundaries == needsBoundaries) &&
            (identical(other.growthPath, growthPath) ||
                other.growthPath == growthPath) &&
            (identical(other.redFlagsRepair, redFlagsRepair) ||
                other.redFlagsRepair == redFlagsRepair) &&
            const DeepCollectionEquality().equals(
              other._nextSteps,
              _nextSteps,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    relationalField,
    attractionBonding,
    projectionShadow,
    egoPersonaMismatch,
    communicationConflict,
    needsBoundaries,
    growthPath,
    redFlagsRepair,
    const DeepCollectionEquality().hash(_nextSteps),
  );

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipNarrativeImplCopyWith<_$RelationshipNarrativeImpl>
  get copyWith =>
      __$$RelationshipNarrativeImplCopyWithImpl<_$RelationshipNarrativeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipNarrativeImplToJson(this);
  }
}

abstract class _RelationshipNarrative implements RelationshipNarrative {
  const factory _RelationshipNarrative({
    final ModuleNarrative? relationalField,
    final ModuleNarrative? attractionBonding,
    final ModuleNarrative? projectionShadow,
    final ModuleNarrative? egoPersonaMismatch,
    final ModuleNarrative? communicationConflict,
    final ModuleNarrative? needsBoundaries,
    final ModuleNarrative? growthPath,
    final ModuleNarrative? redFlagsRepair,
    final List<SituationalGuidance> nextSteps,
  }) = _$RelationshipNarrativeImpl;

  factory _RelationshipNarrative.fromJson(Map<String, dynamic> json) =
      _$RelationshipNarrativeImpl.fromJson;

  @override
  ModuleNarrative? get relationalField;
  @override
  ModuleNarrative? get attractionBonding;
  @override
  ModuleNarrative? get projectionShadow;
  @override
  ModuleNarrative? get egoPersonaMismatch;
  @override
  ModuleNarrative? get communicationConflict;
  @override
  ModuleNarrative? get needsBoundaries;
  @override
  ModuleNarrative? get growthPath;
  @override
  ModuleNarrative? get redFlagsRepair;
  @override
  List<SituationalGuidance> get nextSteps;

  /// Create a copy of RelationshipNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipNarrativeImplCopyWith<_$RelationshipNarrativeImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ModuleNarrative _$ModuleNarrativeFromJson(Map<String, dynamic> json) {
  return _ModuleNarrative.fromJson(json);
}

/// @nodoc
mixin _$ModuleNarrative {
  String? get summary => throw _privateConstructorUsedError;
  String? get story => throw _privateConstructorUsedError;
  List<String> get analysisBullets => throw _privateConstructorUsedError;
  List<SituationalExample> get situations => throw _privateConstructorUsedError;

  /// Serializes this ModuleNarrative to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModuleNarrative
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModuleNarrativeCopyWith<ModuleNarrative> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleNarrativeCopyWith<$Res> {
  factory $ModuleNarrativeCopyWith(
    ModuleNarrative value,
    $Res Function(ModuleNarrative) then,
  ) = _$ModuleNarrativeCopyWithImpl<$Res, ModuleNarrative>;
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<SituationalExample> situations,
  });
}

/// @nodoc
class _$ModuleNarrativeCopyWithImpl<$Res, $Val extends ModuleNarrative>
    implements $ModuleNarrativeCopyWith<$Res> {
  _$ModuleNarrativeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModuleNarrative
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? situations = null,
  }) {
    return _then(
      _value.copyWith(
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            story: freezed == story
                ? _value.story
                : story // ignore: cast_nullable_to_non_nullable
                      as String?,
            analysisBullets: null == analysisBullets
                ? _value.analysisBullets
                : analysisBullets // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            situations: null == situations
                ? _value.situations
                : situations // ignore: cast_nullable_to_non_nullable
                      as List<SituationalExample>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ModuleNarrativeImplCopyWith<$Res>
    implements $ModuleNarrativeCopyWith<$Res> {
  factory _$$ModuleNarrativeImplCopyWith(
    _$ModuleNarrativeImpl value,
    $Res Function(_$ModuleNarrativeImpl) then,
  ) = __$$ModuleNarrativeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? summary,
    String? story,
    List<String> analysisBullets,
    List<SituationalExample> situations,
  });
}

/// @nodoc
class __$$ModuleNarrativeImplCopyWithImpl<$Res>
    extends _$ModuleNarrativeCopyWithImpl<$Res, _$ModuleNarrativeImpl>
    implements _$$ModuleNarrativeImplCopyWith<$Res> {
  __$$ModuleNarrativeImplCopyWithImpl(
    _$ModuleNarrativeImpl _value,
    $Res Function(_$ModuleNarrativeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ModuleNarrative
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? story = freezed,
    Object? analysisBullets = null,
    Object? situations = null,
  }) {
    return _then(
      _$ModuleNarrativeImpl(
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        story: freezed == story
            ? _value.story
            : story // ignore: cast_nullable_to_non_nullable
                  as String?,
        analysisBullets: null == analysisBullets
            ? _value._analysisBullets
            : analysisBullets // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        situations: null == situations
            ? _value._situations
            : situations // ignore: cast_nullable_to_non_nullable
                  as List<SituationalExample>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ModuleNarrativeImpl implements _ModuleNarrative {
  const _$ModuleNarrativeImpl({
    this.summary,
    this.story,
    final List<String> analysisBullets = const [],
    final List<SituationalExample> situations = const [],
  }) : _analysisBullets = analysisBullets,
       _situations = situations;

  factory _$ModuleNarrativeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModuleNarrativeImplFromJson(json);

  @override
  final String? summary;
  @override
  final String? story;
  final List<String> _analysisBullets;
  @override
  @JsonKey()
  List<String> get analysisBullets {
    if (_analysisBullets is EqualUnmodifiableListView) return _analysisBullets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analysisBullets);
  }

  final List<SituationalExample> _situations;
  @override
  @JsonKey()
  List<SituationalExample> get situations {
    if (_situations is EqualUnmodifiableListView) return _situations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_situations);
  }

  @override
  String toString() {
    return 'ModuleNarrative(summary: $summary, story: $story, analysisBullets: $analysisBullets, situations: $situations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModuleNarrativeImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality().equals(
              other._analysisBullets,
              _analysisBullets,
            ) &&
            const DeepCollectionEquality().equals(
              other._situations,
              _situations,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    story,
    const DeepCollectionEquality().hash(_analysisBullets),
    const DeepCollectionEquality().hash(_situations),
  );

  /// Create a copy of ModuleNarrative
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModuleNarrativeImplCopyWith<_$ModuleNarrativeImpl> get copyWith =>
      __$$ModuleNarrativeImplCopyWithImpl<_$ModuleNarrativeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ModuleNarrativeImplToJson(this);
  }
}

abstract class _ModuleNarrative implements ModuleNarrative {
  const factory _ModuleNarrative({
    final String? summary,
    final String? story,
    final List<String> analysisBullets,
    final List<SituationalExample> situations,
  }) = _$ModuleNarrativeImpl;

  factory _ModuleNarrative.fromJson(Map<String, dynamic> json) =
      _$ModuleNarrativeImpl.fromJson;

  @override
  String? get summary;
  @override
  String? get story;
  @override
  List<String> get analysisBullets;
  @override
  List<SituationalExample> get situations;

  /// Create a copy of ModuleNarrative
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModuleNarrativeImplCopyWith<_$ModuleNarrativeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SituationalExample _$SituationalExampleFromJson(Map<String, dynamic> json) {
  return _SituationalExample.fromJson(json);
}

/// @nodoc
mixin _$SituationalExample {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this SituationalExample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SituationalExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SituationalExampleCopyWith<SituationalExample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SituationalExampleCopyWith<$Res> {
  factory $SituationalExampleCopyWith(
    SituationalExample value,
    $Res Function(SituationalExample) then,
  ) = _$SituationalExampleCopyWithImpl<$Res, SituationalExample>;
  @useResult
  $Res call({String? title, String? description, List<String> exampleRefs});
}

/// @nodoc
class _$SituationalExampleCopyWithImpl<$Res, $Val extends SituationalExample>
    implements $SituationalExampleCopyWith<$Res> {
  _$SituationalExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SituationalExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$SituationalExampleImplCopyWith<$Res>
    implements $SituationalExampleCopyWith<$Res> {
  factory _$$SituationalExampleImplCopyWith(
    _$SituationalExampleImpl value,
    $Res Function(_$SituationalExampleImpl) then,
  ) = __$$SituationalExampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? description, List<String> exampleRefs});
}

/// @nodoc
class __$$SituationalExampleImplCopyWithImpl<$Res>
    extends _$SituationalExampleCopyWithImpl<$Res, _$SituationalExampleImpl>
    implements _$$SituationalExampleImplCopyWith<$Res> {
  __$$SituationalExampleImplCopyWithImpl(
    _$SituationalExampleImpl _value,
    $Res Function(_$SituationalExampleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SituationalExample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$SituationalExampleImpl(
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$SituationalExampleImpl implements _SituationalExample {
  const _$SituationalExampleImpl({
    this.title,
    this.description,
    final List<String> exampleRefs = const [],
  }) : _exampleRefs = exampleRefs;

  factory _$SituationalExampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$SituationalExampleImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
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
    return 'SituationalExample(title: $title, description: $description, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SituationalExampleImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of SituationalExample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SituationalExampleImplCopyWith<_$SituationalExampleImpl> get copyWith =>
      __$$SituationalExampleImplCopyWithImpl<_$SituationalExampleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SituationalExampleImplToJson(this);
  }
}

abstract class _SituationalExample implements SituationalExample {
  const factory _SituationalExample({
    final String? title,
    final String? description,
    final List<String> exampleRefs,
  }) = _$SituationalExampleImpl;

  factory _SituationalExample.fromJson(Map<String, dynamic> json) =
      _$SituationalExampleImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  List<String> get exampleRefs;

  /// Create a copy of SituationalExample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SituationalExampleImplCopyWith<_$SituationalExampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SituationalGuidance _$SituationalGuidanceFromJson(Map<String, dynamic> json) {
  return _SituationalGuidance.fromJson(json);
}

/// @nodoc
mixin _$SituationalGuidance {
  String? get situation => throw _privateConstructorUsedError;
  String? get guidance => throw _privateConstructorUsedError;
  List<String> get exampleRefs => throw _privateConstructorUsedError;

  /// Serializes this SituationalGuidance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SituationalGuidance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SituationalGuidanceCopyWith<SituationalGuidance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SituationalGuidanceCopyWith<$Res> {
  factory $SituationalGuidanceCopyWith(
    SituationalGuidance value,
    $Res Function(SituationalGuidance) then,
  ) = _$SituationalGuidanceCopyWithImpl<$Res, SituationalGuidance>;
  @useResult
  $Res call({String? situation, String? guidance, List<String> exampleRefs});
}

/// @nodoc
class _$SituationalGuidanceCopyWithImpl<$Res, $Val extends SituationalGuidance>
    implements $SituationalGuidanceCopyWith<$Res> {
  _$SituationalGuidanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SituationalGuidance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? situation = freezed,
    Object? guidance = freezed,
    Object? exampleRefs = null,
  }) {
    return _then(
      _value.copyWith(
            situation: freezed == situation
                ? _value.situation
                : situation // ignore: cast_nullable_to_non_nullable
                      as String?,
            guidance: freezed == guidance
                ? _value.guidance
                : guidance // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$SituationalGuidanceImplCopyWith<$Res>
    implements $SituationalGuidanceCopyWith<$Res> {
  factory _$$SituationalGuidanceImplCopyWith(
    _$SituationalGuidanceImpl value,
    $Res Function(_$SituationalGuidanceImpl) then,
  ) = __$$SituationalGuidanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? situation, String? guidance, List<String> exampleRefs});
}

/// @nodoc
class __$$SituationalGuidanceImplCopyWithImpl<$Res>
    extends _$SituationalGuidanceCopyWithImpl<$Res, _$SituationalGuidanceImpl>
    implements _$$SituationalGuidanceImplCopyWith<$Res> {
  __$$SituationalGuidanceImplCopyWithImpl(
    _$SituationalGuidanceImpl _value,
    $Res Function(_$SituationalGuidanceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SituationalGuidance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? situation = freezed,
    Object? guidance = freezed,
    Object? exampleRefs = null,
  }) {
    return _then(
      _$SituationalGuidanceImpl(
        situation: freezed == situation
            ? _value.situation
            : situation // ignore: cast_nullable_to_non_nullable
                  as String?,
        guidance: freezed == guidance
            ? _value.guidance
            : guidance // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$SituationalGuidanceImpl implements _SituationalGuidance {
  const _$SituationalGuidanceImpl({
    this.situation,
    this.guidance,
    final List<String> exampleRefs = const [],
  }) : _exampleRefs = exampleRefs;

  factory _$SituationalGuidanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SituationalGuidanceImplFromJson(json);

  @override
  final String? situation;
  @override
  final String? guidance;
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
    return 'SituationalGuidance(situation: $situation, guidance: $guidance, exampleRefs: $exampleRefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SituationalGuidanceImpl &&
            (identical(other.situation, situation) ||
                other.situation == situation) &&
            (identical(other.guidance, guidance) ||
                other.guidance == guidance) &&
            const DeepCollectionEquality().equals(
              other._exampleRefs,
              _exampleRefs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    situation,
    guidance,
    const DeepCollectionEquality().hash(_exampleRefs),
  );

  /// Create a copy of SituationalGuidance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SituationalGuidanceImplCopyWith<_$SituationalGuidanceImpl> get copyWith =>
      __$$SituationalGuidanceImplCopyWithImpl<_$SituationalGuidanceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SituationalGuidanceImplToJson(this);
  }
}

abstract class _SituationalGuidance implements SituationalGuidance {
  const factory _SituationalGuidance({
    final String? situation,
    final String? guidance,
    final List<String> exampleRefs,
  }) = _$SituationalGuidanceImpl;

  factory _SituationalGuidance.fromJson(Map<String, dynamic> json) =
      _$SituationalGuidanceImpl.fromJson;

  @override
  String? get situation;
  @override
  String? get guidance;
  @override
  List<String> get exampleRefs;

  /// Create a copy of SituationalGuidance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SituationalGuidanceImplCopyWith<_$SituationalGuidanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelationshipExamples _$RelationshipExamplesFromJson(Map<String, dynamic> json) {
  return _RelationshipExamples.fromJson(json);
}

/// @nodoc
mixin _$RelationshipExamples {
  List<RelationshipExampleRef> get relationalField =>
      throw _privateConstructorUsedError;
  List<RelationshipExampleRef> get attractionBonding =>
      throw _privateConstructorUsedError;
  List<RelationshipExampleRef> get projectionShadow =>
      throw _privateConstructorUsedError;
  List<RelationshipExampleRef> get egoPersonaMismatch =>
      throw _privateConstructorUsedError;
  List<RelationshipExampleRef> get communicationConflict =>
      throw _privateConstructorUsedError;
  List<RelationshipExampleRef> get needsBoundaries =>
      throw _privateConstructorUsedError;
  List<RelationshipExampleRef> get growthPath =>
      throw _privateConstructorUsedError;
  List<RelationshipExampleRef> get redFlagsRepair =>
      throw _privateConstructorUsedError;
  List<RelationshipExampleRef> get nextSteps =>
      throw _privateConstructorUsedError;

  /// Serializes this RelationshipExamples to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipExamples
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipExamplesCopyWith<RelationshipExamples> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipExamplesCopyWith<$Res> {
  factory $RelationshipExamplesCopyWith(
    RelationshipExamples value,
    $Res Function(RelationshipExamples) then,
  ) = _$RelationshipExamplesCopyWithImpl<$Res, RelationshipExamples>;
  @useResult
  $Res call({
    List<RelationshipExampleRef> relationalField,
    List<RelationshipExampleRef> attractionBonding,
    List<RelationshipExampleRef> projectionShadow,
    List<RelationshipExampleRef> egoPersonaMismatch,
    List<RelationshipExampleRef> communicationConflict,
    List<RelationshipExampleRef> needsBoundaries,
    List<RelationshipExampleRef> growthPath,
    List<RelationshipExampleRef> redFlagsRepair,
    List<RelationshipExampleRef> nextSteps,
  });
}

/// @nodoc
class _$RelationshipExamplesCopyWithImpl<
  $Res,
  $Val extends RelationshipExamples
>
    implements $RelationshipExamplesCopyWith<$Res> {
  _$RelationshipExamplesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipExamples
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relationalField = null,
    Object? attractionBonding = null,
    Object? projectionShadow = null,
    Object? egoPersonaMismatch = null,
    Object? communicationConflict = null,
    Object? needsBoundaries = null,
    Object? growthPath = null,
    Object? redFlagsRepair = null,
    Object? nextSteps = null,
  }) {
    return _then(
      _value.copyWith(
            relationalField: null == relationalField
                ? _value.relationalField
                : relationalField // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
            attractionBonding: null == attractionBonding
                ? _value.attractionBonding
                : attractionBonding // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
            projectionShadow: null == projectionShadow
                ? _value.projectionShadow
                : projectionShadow // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
            egoPersonaMismatch: null == egoPersonaMismatch
                ? _value.egoPersonaMismatch
                : egoPersonaMismatch // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
            communicationConflict: null == communicationConflict
                ? _value.communicationConflict
                : communicationConflict // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
            needsBoundaries: null == needsBoundaries
                ? _value.needsBoundaries
                : needsBoundaries // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
            growthPath: null == growthPath
                ? _value.growthPath
                : growthPath // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
            redFlagsRepair: null == redFlagsRepair
                ? _value.redFlagsRepair
                : redFlagsRepair // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
            nextSteps: null == nextSteps
                ? _value.nextSteps
                : nextSteps // ignore: cast_nullable_to_non_nullable
                      as List<RelationshipExampleRef>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RelationshipExamplesImplCopyWith<$Res>
    implements $RelationshipExamplesCopyWith<$Res> {
  factory _$$RelationshipExamplesImplCopyWith(
    _$RelationshipExamplesImpl value,
    $Res Function(_$RelationshipExamplesImpl) then,
  ) = __$$RelationshipExamplesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<RelationshipExampleRef> relationalField,
    List<RelationshipExampleRef> attractionBonding,
    List<RelationshipExampleRef> projectionShadow,
    List<RelationshipExampleRef> egoPersonaMismatch,
    List<RelationshipExampleRef> communicationConflict,
    List<RelationshipExampleRef> needsBoundaries,
    List<RelationshipExampleRef> growthPath,
    List<RelationshipExampleRef> redFlagsRepair,
    List<RelationshipExampleRef> nextSteps,
  });
}

/// @nodoc
class __$$RelationshipExamplesImplCopyWithImpl<$Res>
    extends _$RelationshipExamplesCopyWithImpl<$Res, _$RelationshipExamplesImpl>
    implements _$$RelationshipExamplesImplCopyWith<$Res> {
  __$$RelationshipExamplesImplCopyWithImpl(
    _$RelationshipExamplesImpl _value,
    $Res Function(_$RelationshipExamplesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipExamples
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relationalField = null,
    Object? attractionBonding = null,
    Object? projectionShadow = null,
    Object? egoPersonaMismatch = null,
    Object? communicationConflict = null,
    Object? needsBoundaries = null,
    Object? growthPath = null,
    Object? redFlagsRepair = null,
    Object? nextSteps = null,
  }) {
    return _then(
      _$RelationshipExamplesImpl(
        relationalField: null == relationalField
            ? _value._relationalField
            : relationalField // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
        attractionBonding: null == attractionBonding
            ? _value._attractionBonding
            : attractionBonding // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
        projectionShadow: null == projectionShadow
            ? _value._projectionShadow
            : projectionShadow // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
        egoPersonaMismatch: null == egoPersonaMismatch
            ? _value._egoPersonaMismatch
            : egoPersonaMismatch // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
        communicationConflict: null == communicationConflict
            ? _value._communicationConflict
            : communicationConflict // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
        needsBoundaries: null == needsBoundaries
            ? _value._needsBoundaries
            : needsBoundaries // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
        growthPath: null == growthPath
            ? _value._growthPath
            : growthPath // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
        redFlagsRepair: null == redFlagsRepair
            ? _value._redFlagsRepair
            : redFlagsRepair // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
        nextSteps: null == nextSteps
            ? _value._nextSteps
            : nextSteps // ignore: cast_nullable_to_non_nullable
                  as List<RelationshipExampleRef>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipExamplesImpl implements _RelationshipExamples {
  const _$RelationshipExamplesImpl({
    final List<RelationshipExampleRef> relationalField = const [],
    final List<RelationshipExampleRef> attractionBonding = const [],
    final List<RelationshipExampleRef> projectionShadow = const [],
    final List<RelationshipExampleRef> egoPersonaMismatch = const [],
    final List<RelationshipExampleRef> communicationConflict = const [],
    final List<RelationshipExampleRef> needsBoundaries = const [],
    final List<RelationshipExampleRef> growthPath = const [],
    final List<RelationshipExampleRef> redFlagsRepair = const [],
    final List<RelationshipExampleRef> nextSteps = const [],
  }) : _relationalField = relationalField,
       _attractionBonding = attractionBonding,
       _projectionShadow = projectionShadow,
       _egoPersonaMismatch = egoPersonaMismatch,
       _communicationConflict = communicationConflict,
       _needsBoundaries = needsBoundaries,
       _growthPath = growthPath,
       _redFlagsRepair = redFlagsRepair,
       _nextSteps = nextSteps;

  factory _$RelationshipExamplesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipExamplesImplFromJson(json);

  final List<RelationshipExampleRef> _relationalField;
  @override
  @JsonKey()
  List<RelationshipExampleRef> get relationalField {
    if (_relationalField is EqualUnmodifiableListView) return _relationalField;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relationalField);
  }

  final List<RelationshipExampleRef> _attractionBonding;
  @override
  @JsonKey()
  List<RelationshipExampleRef> get attractionBonding {
    if (_attractionBonding is EqualUnmodifiableListView)
      return _attractionBonding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attractionBonding);
  }

  final List<RelationshipExampleRef> _projectionShadow;
  @override
  @JsonKey()
  List<RelationshipExampleRef> get projectionShadow {
    if (_projectionShadow is EqualUnmodifiableListView)
      return _projectionShadow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectionShadow);
  }

  final List<RelationshipExampleRef> _egoPersonaMismatch;
  @override
  @JsonKey()
  List<RelationshipExampleRef> get egoPersonaMismatch {
    if (_egoPersonaMismatch is EqualUnmodifiableListView)
      return _egoPersonaMismatch;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_egoPersonaMismatch);
  }

  final List<RelationshipExampleRef> _communicationConflict;
  @override
  @JsonKey()
  List<RelationshipExampleRef> get communicationConflict {
    if (_communicationConflict is EqualUnmodifiableListView)
      return _communicationConflict;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_communicationConflict);
  }

  final List<RelationshipExampleRef> _needsBoundaries;
  @override
  @JsonKey()
  List<RelationshipExampleRef> get needsBoundaries {
    if (_needsBoundaries is EqualUnmodifiableListView) return _needsBoundaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_needsBoundaries);
  }

  final List<RelationshipExampleRef> _growthPath;
  @override
  @JsonKey()
  List<RelationshipExampleRef> get growthPath {
    if (_growthPath is EqualUnmodifiableListView) return _growthPath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_growthPath);
  }

  final List<RelationshipExampleRef> _redFlagsRepair;
  @override
  @JsonKey()
  List<RelationshipExampleRef> get redFlagsRepair {
    if (_redFlagsRepair is EqualUnmodifiableListView) return _redFlagsRepair;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_redFlagsRepair);
  }

  final List<RelationshipExampleRef> _nextSteps;
  @override
  @JsonKey()
  List<RelationshipExampleRef> get nextSteps {
    if (_nextSteps is EqualUnmodifiableListView) return _nextSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextSteps);
  }

  @override
  String toString() {
    return 'RelationshipExamples(relationalField: $relationalField, attractionBonding: $attractionBonding, projectionShadow: $projectionShadow, egoPersonaMismatch: $egoPersonaMismatch, communicationConflict: $communicationConflict, needsBoundaries: $needsBoundaries, growthPath: $growthPath, redFlagsRepair: $redFlagsRepair, nextSteps: $nextSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipExamplesImpl &&
            const DeepCollectionEquality().equals(
              other._relationalField,
              _relationalField,
            ) &&
            const DeepCollectionEquality().equals(
              other._attractionBonding,
              _attractionBonding,
            ) &&
            const DeepCollectionEquality().equals(
              other._projectionShadow,
              _projectionShadow,
            ) &&
            const DeepCollectionEquality().equals(
              other._egoPersonaMismatch,
              _egoPersonaMismatch,
            ) &&
            const DeepCollectionEquality().equals(
              other._communicationConflict,
              _communicationConflict,
            ) &&
            const DeepCollectionEquality().equals(
              other._needsBoundaries,
              _needsBoundaries,
            ) &&
            const DeepCollectionEquality().equals(
              other._growthPath,
              _growthPath,
            ) &&
            const DeepCollectionEquality().equals(
              other._redFlagsRepair,
              _redFlagsRepair,
            ) &&
            const DeepCollectionEquality().equals(
              other._nextSteps,
              _nextSteps,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_relationalField),
    const DeepCollectionEquality().hash(_attractionBonding),
    const DeepCollectionEquality().hash(_projectionShadow),
    const DeepCollectionEquality().hash(_egoPersonaMismatch),
    const DeepCollectionEquality().hash(_communicationConflict),
    const DeepCollectionEquality().hash(_needsBoundaries),
    const DeepCollectionEquality().hash(_growthPath),
    const DeepCollectionEquality().hash(_redFlagsRepair),
    const DeepCollectionEquality().hash(_nextSteps),
  );

  /// Create a copy of RelationshipExamples
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipExamplesImplCopyWith<_$RelationshipExamplesImpl>
  get copyWith =>
      __$$RelationshipExamplesImplCopyWithImpl<_$RelationshipExamplesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipExamplesImplToJson(this);
  }
}

abstract class _RelationshipExamples implements RelationshipExamples {
  const factory _RelationshipExamples({
    final List<RelationshipExampleRef> relationalField,
    final List<RelationshipExampleRef> attractionBonding,
    final List<RelationshipExampleRef> projectionShadow,
    final List<RelationshipExampleRef> egoPersonaMismatch,
    final List<RelationshipExampleRef> communicationConflict,
    final List<RelationshipExampleRef> needsBoundaries,
    final List<RelationshipExampleRef> growthPath,
    final List<RelationshipExampleRef> redFlagsRepair,
    final List<RelationshipExampleRef> nextSteps,
  }) = _$RelationshipExamplesImpl;

  factory _RelationshipExamples.fromJson(Map<String, dynamic> json) =
      _$RelationshipExamplesImpl.fromJson;

  @override
  List<RelationshipExampleRef> get relationalField;
  @override
  List<RelationshipExampleRef> get attractionBonding;
  @override
  List<RelationshipExampleRef> get projectionShadow;
  @override
  List<RelationshipExampleRef> get egoPersonaMismatch;
  @override
  List<RelationshipExampleRef> get communicationConflict;
  @override
  List<RelationshipExampleRef> get needsBoundaries;
  @override
  List<RelationshipExampleRef> get growthPath;
  @override
  List<RelationshipExampleRef> get redFlagsRepair;
  @override
  List<RelationshipExampleRef> get nextSteps;

  /// Create a copy of RelationshipExamples
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipExamplesImplCopyWith<_$RelationshipExamplesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RelationshipExampleRef _$RelationshipExampleRefFromJson(
  Map<String, dynamic> json,
) {
  return _RelationshipExampleRef.fromJson(json);
}

/// @nodoc
mixin _$RelationshipExampleRef {
  String? get characterName => throw _privateConstructorUsedError;
  String? get fromSide => throw _privateConstructorUsedError; // 'me' or 'other'
  RelationshipExampleReference? get reference =>
      throw _privateConstructorUsedError;
  String? get situation => throw _privateConstructorUsedError;
  List<String> get actions => throw _privateConstructorUsedError;
  List<String> get outcomeAndCost => throw _privateConstructorUsedError;
  String get tier => throw _privateConstructorUsedError;

  /// Serializes this RelationshipExampleRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipExampleRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipExampleRefCopyWith<RelationshipExampleRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipExampleRefCopyWith<$Res> {
  factory $RelationshipExampleRefCopyWith(
    RelationshipExampleRef value,
    $Res Function(RelationshipExampleRef) then,
  ) = _$RelationshipExampleRefCopyWithImpl<$Res, RelationshipExampleRef>;
  @useResult
  $Res call({
    String? characterName,
    String? fromSide,
    RelationshipExampleReference? reference,
    String? situation,
    List<String> actions,
    List<String> outcomeAndCost,
    String tier,
  });

  $RelationshipExampleReferenceCopyWith<$Res>? get reference;
}

/// @nodoc
class _$RelationshipExampleRefCopyWithImpl<
  $Res,
  $Val extends RelationshipExampleRef
>
    implements $RelationshipExampleRefCopyWith<$Res> {
  _$RelationshipExampleRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipExampleRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterName = freezed,
    Object? fromSide = freezed,
    Object? reference = freezed,
    Object? situation = freezed,
    Object? actions = null,
    Object? outcomeAndCost = null,
    Object? tier = null,
  }) {
    return _then(
      _value.copyWith(
            characterName: freezed == characterName
                ? _value.characterName
                : characterName // ignore: cast_nullable_to_non_nullable
                      as String?,
            fromSide: freezed == fromSide
                ? _value.fromSide
                : fromSide // ignore: cast_nullable_to_non_nullable
                      as String?,
            reference: freezed == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as RelationshipExampleReference?,
            situation: freezed == situation
                ? _value.situation
                : situation // ignore: cast_nullable_to_non_nullable
                      as String?,
            actions: null == actions
                ? _value.actions
                : actions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            outcomeAndCost: null == outcomeAndCost
                ? _value.outcomeAndCost
                : outcomeAndCost // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            tier: null == tier
                ? _value.tier
                : tier // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of RelationshipExampleRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelationshipExampleReferenceCopyWith<$Res>? get reference {
    if (_value.reference == null) {
      return null;
    }

    return $RelationshipExampleReferenceCopyWith<$Res>(_value.reference!, (
      value,
    ) {
      return _then(_value.copyWith(reference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RelationshipExampleRefImplCopyWith<$Res>
    implements $RelationshipExampleRefCopyWith<$Res> {
  factory _$$RelationshipExampleRefImplCopyWith(
    _$RelationshipExampleRefImpl value,
    $Res Function(_$RelationshipExampleRefImpl) then,
  ) = __$$RelationshipExampleRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? characterName,
    String? fromSide,
    RelationshipExampleReference? reference,
    String? situation,
    List<String> actions,
    List<String> outcomeAndCost,
    String tier,
  });

  @override
  $RelationshipExampleReferenceCopyWith<$Res>? get reference;
}

/// @nodoc
class __$$RelationshipExampleRefImplCopyWithImpl<$Res>
    extends
        _$RelationshipExampleRefCopyWithImpl<$Res, _$RelationshipExampleRefImpl>
    implements _$$RelationshipExampleRefImplCopyWith<$Res> {
  __$$RelationshipExampleRefImplCopyWithImpl(
    _$RelationshipExampleRefImpl _value,
    $Res Function(_$RelationshipExampleRefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipExampleRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterName = freezed,
    Object? fromSide = freezed,
    Object? reference = freezed,
    Object? situation = freezed,
    Object? actions = null,
    Object? outcomeAndCost = null,
    Object? tier = null,
  }) {
    return _then(
      _$RelationshipExampleRefImpl(
        characterName: freezed == characterName
            ? _value.characterName
            : characterName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fromSide: freezed == fromSide
            ? _value.fromSide
            : fromSide // ignore: cast_nullable_to_non_nullable
                  as String?,
        reference: freezed == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as RelationshipExampleReference?,
        situation: freezed == situation
            ? _value.situation
            : situation // ignore: cast_nullable_to_non_nullable
                  as String?,
        actions: null == actions
            ? _value._actions
            : actions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        outcomeAndCost: null == outcomeAndCost
            ? _value._outcomeAndCost
            : outcomeAndCost // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        tier: null == tier
            ? _value.tier
            : tier // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipExampleRefImpl implements _RelationshipExampleRef {
  const _$RelationshipExampleRefImpl({
    this.characterName,
    this.fromSide,
    this.reference,
    this.situation,
    final List<String> actions = const [],
    final List<String> outcomeAndCost = const [],
    this.tier = 'B',
  }) : _actions = actions,
       _outcomeAndCost = outcomeAndCost;

  factory _$RelationshipExampleRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipExampleRefImplFromJson(json);

  @override
  final String? characterName;
  @override
  final String? fromSide;
  // 'me' or 'other'
  @override
  final RelationshipExampleReference? reference;
  @override
  final String? situation;
  final List<String> _actions;
  @override
  @JsonKey()
  List<String> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  final List<String> _outcomeAndCost;
  @override
  @JsonKey()
  List<String> get outcomeAndCost {
    if (_outcomeAndCost is EqualUnmodifiableListView) return _outcomeAndCost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outcomeAndCost);
  }

  @override
  @JsonKey()
  final String tier;

  @override
  String toString() {
    return 'RelationshipExampleRef(characterName: $characterName, fromSide: $fromSide, reference: $reference, situation: $situation, actions: $actions, outcomeAndCost: $outcomeAndCost, tier: $tier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipExampleRefImpl &&
            (identical(other.characterName, characterName) ||
                other.characterName == characterName) &&
            (identical(other.fromSide, fromSide) ||
                other.fromSide == fromSide) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.situation, situation) ||
                other.situation == situation) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            const DeepCollectionEquality().equals(
              other._outcomeAndCost,
              _outcomeAndCost,
            ) &&
            (identical(other.tier, tier) || other.tier == tier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    characterName,
    fromSide,
    reference,
    situation,
    const DeepCollectionEquality().hash(_actions),
    const DeepCollectionEquality().hash(_outcomeAndCost),
    tier,
  );

  /// Create a copy of RelationshipExampleRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipExampleRefImplCopyWith<_$RelationshipExampleRefImpl>
  get copyWith =>
      __$$RelationshipExampleRefImplCopyWithImpl<_$RelationshipExampleRefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipExampleRefImplToJson(this);
  }
}

abstract class _RelationshipExampleRef implements RelationshipExampleRef {
  const factory _RelationshipExampleRef({
    final String? characterName,
    final String? fromSide,
    final RelationshipExampleReference? reference,
    final String? situation,
    final List<String> actions,
    final List<String> outcomeAndCost,
    final String tier,
  }) = _$RelationshipExampleRefImpl;

  factory _RelationshipExampleRef.fromJson(Map<String, dynamic> json) =
      _$RelationshipExampleRefImpl.fromJson;

  @override
  String? get characterName;
  @override
  String? get fromSide; // 'me' or 'other'
  @override
  RelationshipExampleReference? get reference;
  @override
  String? get situation;
  @override
  List<String> get actions;
  @override
  List<String> get outcomeAndCost;
  @override
  String get tier;

  /// Create a copy of RelationshipExampleRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipExampleRefImplCopyWith<_$RelationshipExampleRefImpl>
  get copyWith => throw _privateConstructorUsedError;
}

RelationshipExampleReference _$RelationshipExampleReferenceFromJson(
  Map<String, dynamic> json,
) {
  return _RelationshipExampleReference.fromJson(json);
}

/// @nodoc
mixin _$RelationshipExampleReference {
  String? get title => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String get medium => throw _privateConstructorUsedError;

  /// Serializes this RelationshipExampleReference to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipExampleReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipExampleReferenceCopyWith<RelationshipExampleReference>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipExampleReferenceCopyWith<$Res> {
  factory $RelationshipExampleReferenceCopyWith(
    RelationshipExampleReference value,
    $Res Function(RelationshipExampleReference) then,
  ) =
      _$RelationshipExampleReferenceCopyWithImpl<
        $Res,
        RelationshipExampleReference
      >;
  @useResult
  $Res call({String? title, String? year, String medium});
}

/// @nodoc
class _$RelationshipExampleReferenceCopyWithImpl<
  $Res,
  $Val extends RelationshipExampleReference
>
    implements $RelationshipExampleReferenceCopyWith<$Res> {
  _$RelationshipExampleReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipExampleReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? year = freezed,
    Object? medium = null,
  }) {
    return _then(
      _value.copyWith(
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as String?,
            medium: null == medium
                ? _value.medium
                : medium // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RelationshipExampleReferenceImplCopyWith<$Res>
    implements $RelationshipExampleReferenceCopyWith<$Res> {
  factory _$$RelationshipExampleReferenceImplCopyWith(
    _$RelationshipExampleReferenceImpl value,
    $Res Function(_$RelationshipExampleReferenceImpl) then,
  ) = __$$RelationshipExampleReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? year, String medium});
}

/// @nodoc
class __$$RelationshipExampleReferenceImplCopyWithImpl<$Res>
    extends
        _$RelationshipExampleReferenceCopyWithImpl<
          $Res,
          _$RelationshipExampleReferenceImpl
        >
    implements _$$RelationshipExampleReferenceImplCopyWith<$Res> {
  __$$RelationshipExampleReferenceImplCopyWithImpl(
    _$RelationshipExampleReferenceImpl _value,
    $Res Function(_$RelationshipExampleReferenceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipExampleReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? year = freezed,
    Object? medium = null,
  }) {
    return _then(
      _$RelationshipExampleReferenceImpl(
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as String?,
        medium: null == medium
            ? _value.medium
            : medium // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipExampleReferenceImpl
    implements _RelationshipExampleReference {
  const _$RelationshipExampleReferenceImpl({
    this.title,
    this.year,
    this.medium = 'film',
  });

  factory _$RelationshipExampleReferenceImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$RelationshipExampleReferenceImplFromJson(json);

  @override
  final String? title;
  @override
  final String? year;
  @override
  @JsonKey()
  final String medium;

  @override
  String toString() {
    return 'RelationshipExampleReference(title: $title, year: $year, medium: $medium)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipExampleReferenceImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.medium, medium) || other.medium == medium));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, year, medium);

  /// Create a copy of RelationshipExampleReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipExampleReferenceImplCopyWith<
    _$RelationshipExampleReferenceImpl
  >
  get copyWith =>
      __$$RelationshipExampleReferenceImplCopyWithImpl<
        _$RelationshipExampleReferenceImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipExampleReferenceImplToJson(this);
  }
}

abstract class _RelationshipExampleReference
    implements RelationshipExampleReference {
  const factory _RelationshipExampleReference({
    final String? title,
    final String? year,
    final String medium,
  }) = _$RelationshipExampleReferenceImpl;

  factory _RelationshipExampleReference.fromJson(Map<String, dynamic> json) =
      _$RelationshipExampleReferenceImpl.fromJson;

  @override
  String? get title;
  @override
  String? get year;
  @override
  String get medium;

  /// Create a copy of RelationshipExampleReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipExampleReferenceImplCopyWith<
    _$RelationshipExampleReferenceImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

RelationshipMeta _$RelationshipMetaFromJson(Map<String, dynamic> json) {
  return _RelationshipMeta.fromJson(json);
}

/// @nodoc
mixin _$RelationshipMeta {
  String? get generatedAt => throw _privateConstructorUsedError;
  String? get modelVersion => throw _privateConstructorUsedError;
  String? get inputHash => throw _privateConstructorUsedError;
  String? get relationshipType => throw _privateConstructorUsedError;
  bool? get hasMeData => throw _privateConstructorUsedError;

  /// Serializes this RelationshipMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelationshipMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelationshipMetaCopyWith<RelationshipMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationshipMetaCopyWith<$Res> {
  factory $RelationshipMetaCopyWith(
    RelationshipMeta value,
    $Res Function(RelationshipMeta) then,
  ) = _$RelationshipMetaCopyWithImpl<$Res, RelationshipMeta>;
  @useResult
  $Res call({
    String? generatedAt,
    String? modelVersion,
    String? inputHash,
    String? relationshipType,
    bool? hasMeData,
  });
}

/// @nodoc
class _$RelationshipMetaCopyWithImpl<$Res, $Val extends RelationshipMeta>
    implements $RelationshipMetaCopyWith<$Res> {
  _$RelationshipMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelationshipMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = freezed,
    Object? modelVersion = freezed,
    Object? inputHash = freezed,
    Object? relationshipType = freezed,
    Object? hasMeData = freezed,
  }) {
    return _then(
      _value.copyWith(
            generatedAt: freezed == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            modelVersion: freezed == modelVersion
                ? _value.modelVersion
                : modelVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            inputHash: freezed == inputHash
                ? _value.inputHash
                : inputHash // ignore: cast_nullable_to_non_nullable
                      as String?,
            relationshipType: freezed == relationshipType
                ? _value.relationshipType
                : relationshipType // ignore: cast_nullable_to_non_nullable
                      as String?,
            hasMeData: freezed == hasMeData
                ? _value.hasMeData
                : hasMeData // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RelationshipMetaImplCopyWith<$Res>
    implements $RelationshipMetaCopyWith<$Res> {
  factory _$$RelationshipMetaImplCopyWith(
    _$RelationshipMetaImpl value,
    $Res Function(_$RelationshipMetaImpl) then,
  ) = __$$RelationshipMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? generatedAt,
    String? modelVersion,
    String? inputHash,
    String? relationshipType,
    bool? hasMeData,
  });
}

/// @nodoc
class __$$RelationshipMetaImplCopyWithImpl<$Res>
    extends _$RelationshipMetaCopyWithImpl<$Res, _$RelationshipMetaImpl>
    implements _$$RelationshipMetaImplCopyWith<$Res> {
  __$$RelationshipMetaImplCopyWithImpl(
    _$RelationshipMetaImpl _value,
    $Res Function(_$RelationshipMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RelationshipMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = freezed,
    Object? modelVersion = freezed,
    Object? inputHash = freezed,
    Object? relationshipType = freezed,
    Object? hasMeData = freezed,
  }) {
    return _then(
      _$RelationshipMetaImpl(
        generatedAt: freezed == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        modelVersion: freezed == modelVersion
            ? _value.modelVersion
            : modelVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        inputHash: freezed == inputHash
            ? _value.inputHash
            : inputHash // ignore: cast_nullable_to_non_nullable
                  as String?,
        relationshipType: freezed == relationshipType
            ? _value.relationshipType
            : relationshipType // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasMeData: freezed == hasMeData
            ? _value.hasMeData
            : hasMeData // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationshipMetaImpl implements _RelationshipMeta {
  const _$RelationshipMetaImpl({
    this.generatedAt,
    this.modelVersion,
    this.inputHash,
    this.relationshipType,
    this.hasMeData,
  });

  factory _$RelationshipMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationshipMetaImplFromJson(json);

  @override
  final String? generatedAt;
  @override
  final String? modelVersion;
  @override
  final String? inputHash;
  @override
  final String? relationshipType;
  @override
  final bool? hasMeData;

  @override
  String toString() {
    return 'RelationshipMeta(generatedAt: $generatedAt, modelVersion: $modelVersion, inputHash: $inputHash, relationshipType: $relationshipType, hasMeData: $hasMeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationshipMetaImpl &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.modelVersion, modelVersion) ||
                other.modelVersion == modelVersion) &&
            (identical(other.inputHash, inputHash) ||
                other.inputHash == inputHash) &&
            (identical(other.relationshipType, relationshipType) ||
                other.relationshipType == relationshipType) &&
            (identical(other.hasMeData, hasMeData) ||
                other.hasMeData == hasMeData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    generatedAt,
    modelVersion,
    inputHash,
    relationshipType,
    hasMeData,
  );

  /// Create a copy of RelationshipMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationshipMetaImplCopyWith<_$RelationshipMetaImpl> get copyWith =>
      __$$RelationshipMetaImplCopyWithImpl<_$RelationshipMetaImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationshipMetaImplToJson(this);
  }
}

abstract class _RelationshipMeta implements RelationshipMeta {
  const factory _RelationshipMeta({
    final String? generatedAt,
    final String? modelVersion,
    final String? inputHash,
    final String? relationshipType,
    final bool? hasMeData,
  }) = _$RelationshipMetaImpl;

  factory _RelationshipMeta.fromJson(Map<String, dynamic> json) =
      _$RelationshipMetaImpl.fromJson;

  @override
  String? get generatedAt;
  @override
  String? get modelVersion;
  @override
  String? get inputHash;
  @override
  String? get relationshipType;
  @override
  bool? get hasMeData;

  /// Create a copy of RelationshipMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelationshipMetaImplCopyWith<_$RelationshipMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
