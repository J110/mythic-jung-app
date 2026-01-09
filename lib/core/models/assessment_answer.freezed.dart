// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AssessmentAnswer _$AssessmentAnswerFromJson(Map<String, dynamic> json) {
  return _AssessmentAnswer.fromJson(json);
}

/// @nodoc
mixin _$AssessmentAnswer {
  String get assessmentType => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  List<String> get selectedCharacterIds => throw _privateConstructorUsedError;
  int? get confidence => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AssessmentAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentAnswerCopyWith<AssessmentAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentAnswerCopyWith<$Res> {
  factory $AssessmentAnswerCopyWith(
    AssessmentAnswer value,
    $Res Function(AssessmentAnswer) then,
  ) = _$AssessmentAnswerCopyWithImpl<$Res, AssessmentAnswer>;
  @useResult
  $Res call({
    String assessmentType,
    String questionId,
    List<String> selectedCharacterIds,
    int? confidence,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$AssessmentAnswerCopyWithImpl<$Res, $Val extends AssessmentAnswer>
    implements $AssessmentAnswerCopyWith<$Res> {
  _$AssessmentAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentType = null,
    Object? questionId = null,
    Object? selectedCharacterIds = null,
    Object? confidence = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            assessmentType: null == assessmentType
                ? _value.assessmentType
                : assessmentType // ignore: cast_nullable_to_non_nullable
                      as String,
            questionId: null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedCharacterIds: null == selectedCharacterIds
                ? _value.selectedCharacterIds
                : selectedCharacterIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            confidence: freezed == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as int?,
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
abstract class _$$AssessmentAnswerImplCopyWith<$Res>
    implements $AssessmentAnswerCopyWith<$Res> {
  factory _$$AssessmentAnswerImplCopyWith(
    _$AssessmentAnswerImpl value,
    $Res Function(_$AssessmentAnswerImpl) then,
  ) = __$$AssessmentAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String assessmentType,
    String questionId,
    List<String> selectedCharacterIds,
    int? confidence,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$AssessmentAnswerImplCopyWithImpl<$Res>
    extends _$AssessmentAnswerCopyWithImpl<$Res, _$AssessmentAnswerImpl>
    implements _$$AssessmentAnswerImplCopyWith<$Res> {
  __$$AssessmentAnswerImplCopyWithImpl(
    _$AssessmentAnswerImpl _value,
    $Res Function(_$AssessmentAnswerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AssessmentAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentType = null,
    Object? questionId = null,
    Object? selectedCharacterIds = null,
    Object? confidence = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$AssessmentAnswerImpl(
        assessmentType: null == assessmentType
            ? _value.assessmentType
            : assessmentType // ignore: cast_nullable_to_non_nullable
                  as String,
        questionId: null == questionId
            ? _value.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedCharacterIds: null == selectedCharacterIds
            ? _value._selectedCharacterIds
            : selectedCharacterIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        confidence: freezed == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as int?,
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
class _$AssessmentAnswerImpl implements _AssessmentAnswer {
  const _$AssessmentAnswerImpl({
    required this.assessmentType,
    required this.questionId,
    required final List<String> selectedCharacterIds,
    this.confidence,
    this.updatedAt,
  }) : _selectedCharacterIds = selectedCharacterIds;

  factory _$AssessmentAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentAnswerImplFromJson(json);

  @override
  final String assessmentType;
  @override
  final String questionId;
  final List<String> _selectedCharacterIds;
  @override
  List<String> get selectedCharacterIds {
    if (_selectedCharacterIds is EqualUnmodifiableListView)
      return _selectedCharacterIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCharacterIds);
  }

  @override
  final int? confidence;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AssessmentAnswer(assessmentType: $assessmentType, questionId: $questionId, selectedCharacterIds: $selectedCharacterIds, confidence: $confidence, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentAnswerImpl &&
            (identical(other.assessmentType, assessmentType) ||
                other.assessmentType == assessmentType) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            const DeepCollectionEquality().equals(
              other._selectedCharacterIds,
              _selectedCharacterIds,
            ) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    assessmentType,
    questionId,
    const DeepCollectionEquality().hash(_selectedCharacterIds),
    confidence,
    updatedAt,
  );

  /// Create a copy of AssessmentAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentAnswerImplCopyWith<_$AssessmentAnswerImpl> get copyWith =>
      __$$AssessmentAnswerImplCopyWithImpl<_$AssessmentAnswerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssessmentAnswerImplToJson(this);
  }
}

abstract class _AssessmentAnswer implements AssessmentAnswer {
  const factory _AssessmentAnswer({
    required final String assessmentType,
    required final String questionId,
    required final List<String> selectedCharacterIds,
    final int? confidence,
    final DateTime? updatedAt,
  }) = _$AssessmentAnswerImpl;

  factory _AssessmentAnswer.fromJson(Map<String, dynamic> json) =
      _$AssessmentAnswerImpl.fromJson;

  @override
  String get assessmentType;
  @override
  String get questionId;
  @override
  List<String> get selectedCharacterIds;
  @override
  int? get confidence;
  @override
  DateTime? get updatedAt;

  /// Create a copy of AssessmentAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentAnswerImplCopyWith<_$AssessmentAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
