import 'package:freezed_annotation/freezed_annotation.dart';
import 'generated_output.dart';

part 'generation_job.freezed.dart';
part 'generation_job.g.dart';

/// Status of a generation job
enum GenerationJobStatus {
  pending,
  running,
  completed,
  failed,
}

/// Generation job with progress tracking
@freezed
class GenerationJob with _$GenerationJob {
  const factory GenerationJob({
    required String jobId,
    required String status, // pending, running, completed, failed
    @Default(0) int progress,
    @Default(0) int currentStep,
    @Default(6) int totalSteps,
    @Default('Starting...') String stepLabel,
    GeneratedOutput? result,
    String? error,
  }) = _GenerationJob;

  factory GenerationJob.fromJson(Map<String, dynamic> json) =>
      _$GenerationJobFromJson(json);
}

extension GenerationJobX on GenerationJob {
  bool get isPending => status == 'pending';
  bool get isRunning => status == 'running';
  bool get isCompleted => status == 'completed';
  bool get isFailed => status == 'failed';
  bool get isInProgress => isPending || isRunning;
}
