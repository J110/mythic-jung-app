// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerationJobImpl _$$GenerationJobImplFromJson(Map<String, dynamic> json) =>
    _$GenerationJobImpl(
      jobId: json['jobId'] as String,
      status: json['status'] as String,
      progress: (json['progress'] as num?)?.toInt() ?? 0,
      currentStep: (json['currentStep'] as num?)?.toInt() ?? 0,
      totalSteps: (json['totalSteps'] as num?)?.toInt() ?? 6,
      stepLabel: json['stepLabel'] as String? ?? 'Starting...',
      result: json['result'] == null
          ? null
          : GeneratedOutput.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$GenerationJobImplToJson(_$GenerationJobImpl instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'status': instance.status,
      'progress': instance.progress,
      'currentStep': instance.currentStep,
      'totalSteps': instance.totalSteps,
      'stepLabel': instance.stepLabel,
      'result': instance.result,
      'error': instance.error,
    };
