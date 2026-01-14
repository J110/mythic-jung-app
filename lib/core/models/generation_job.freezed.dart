// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generation_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenerationJob _$GenerationJobFromJson(Map<String, dynamic> json) {
  return _GenerationJob.fromJson(json);
}

/// @nodoc
mixin _$GenerationJob {
  String get jobId => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // pending, running, completed, failed
  int get progress => throw _privateConstructorUsedError;
  int get currentStep => throw _privateConstructorUsedError;
  int get totalSteps => throw _privateConstructorUsedError;
  String get stepLabel => throw _privateConstructorUsedError;
  GeneratedOutput? get result => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this GenerationJob to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerationJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationJobCopyWith<GenerationJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationJobCopyWith<$Res> {
  factory $GenerationJobCopyWith(
    GenerationJob value,
    $Res Function(GenerationJob) then,
  ) = _$GenerationJobCopyWithImpl<$Res, GenerationJob>;
  @useResult
  $Res call({
    String jobId,
    String status,
    int progress,
    int currentStep,
    int totalSteps,
    String stepLabel,
    GeneratedOutput? result,
    String? error,
  });

  $GeneratedOutputCopyWith<$Res>? get result;
}

/// @nodoc
class _$GenerationJobCopyWithImpl<$Res, $Val extends GenerationJob>
    implements $GenerationJobCopyWith<$Res> {
  _$GenerationJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerationJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? status = null,
    Object? progress = null,
    Object? currentStep = null,
    Object? totalSteps = null,
    Object? stepLabel = null,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as int,
            currentStep: null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSteps: null == totalSteps
                ? _value.totalSteps
                : totalSteps // ignore: cast_nullable_to_non_nullable
                      as int,
            stepLabel: null == stepLabel
                ? _value.stepLabel
                : stepLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            result: freezed == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as GeneratedOutput?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of GenerationJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneratedOutputCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $GeneratedOutputCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenerationJobImplCopyWith<$Res>
    implements $GenerationJobCopyWith<$Res> {
  factory _$$GenerationJobImplCopyWith(
    _$GenerationJobImpl value,
    $Res Function(_$GenerationJobImpl) then,
  ) = __$$GenerationJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String jobId,
    String status,
    int progress,
    int currentStep,
    int totalSteps,
    String stepLabel,
    GeneratedOutput? result,
    String? error,
  });

  @override
  $GeneratedOutputCopyWith<$Res>? get result;
}

/// @nodoc
class __$$GenerationJobImplCopyWithImpl<$Res>
    extends _$GenerationJobCopyWithImpl<$Res, _$GenerationJobImpl>
    implements _$$GenerationJobImplCopyWith<$Res> {
  __$$GenerationJobImplCopyWithImpl(
    _$GenerationJobImpl _value,
    $Res Function(_$GenerationJobImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerationJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? status = null,
    Object? progress = null,
    Object? currentStep = null,
    Object? totalSteps = null,
    Object? stepLabel = null,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$GenerationJobImpl(
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as int,
        currentStep: null == currentStep
            ? _value.currentStep
            : currentStep // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSteps: null == totalSteps
            ? _value.totalSteps
            : totalSteps // ignore: cast_nullable_to_non_nullable
                  as int,
        stepLabel: null == stepLabel
            ? _value.stepLabel
            : stepLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        result: freezed == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as GeneratedOutput?,
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
class _$GenerationJobImpl implements _GenerationJob {
  const _$GenerationJobImpl({
    required this.jobId,
    required this.status,
    this.progress = 0,
    this.currentStep = 0,
    this.totalSteps = 6,
    this.stepLabel = 'Starting...',
    this.result,
    this.error,
  });

  factory _$GenerationJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerationJobImplFromJson(json);

  @override
  final String jobId;
  @override
  final String status;
  // pending, running, completed, failed
  @override
  @JsonKey()
  final int progress;
  @override
  @JsonKey()
  final int currentStep;
  @override
  @JsonKey()
  final int totalSteps;
  @override
  @JsonKey()
  final String stepLabel;
  @override
  final GeneratedOutput? result;
  @override
  final String? error;

  @override
  String toString() {
    return 'GenerationJob(jobId: $jobId, status: $status, progress: $progress, currentStep: $currentStep, totalSteps: $totalSteps, stepLabel: $stepLabel, result: $result, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationJobImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            (identical(other.stepLabel, stepLabel) ||
                other.stepLabel == stepLabel) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    jobId,
    status,
    progress,
    currentStep,
    totalSteps,
    stepLabel,
    result,
    error,
  );

  /// Create a copy of GenerationJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationJobImplCopyWith<_$GenerationJobImpl> get copyWith =>
      __$$GenerationJobImplCopyWithImpl<_$GenerationJobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerationJobImplToJson(this);
  }
}

abstract class _GenerationJob implements GenerationJob {
  const factory _GenerationJob({
    required final String jobId,
    required final String status,
    final int progress,
    final int currentStep,
    final int totalSteps,
    final String stepLabel,
    final GeneratedOutput? result,
    final String? error,
  }) = _$GenerationJobImpl;

  factory _GenerationJob.fromJson(Map<String, dynamic> json) =
      _$GenerationJobImpl.fromJson;

  @override
  String get jobId;
  @override
  String get status; // pending, running, completed, failed
  @override
  int get progress;
  @override
  int get currentStep;
  @override
  int get totalSteps;
  @override
  String get stepLabel;
  @override
  GeneratedOutput? get result;
  @override
  String? get error;

  /// Create a copy of GenerationJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerationJobImplCopyWith<_$GenerationJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
