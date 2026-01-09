import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_answer.freezed.dart';
part 'assessment_answer.g.dart';

@freezed
class AssessmentAnswer with _$AssessmentAnswer {
  const factory AssessmentAnswer({
    required String assessmentType,
    required String questionId,
    required List<String> selectedCharacterIds,
    int? confidence,
    DateTime? updatedAt,
  }) = _AssessmentAnswer;

  factory AssessmentAnswer.fromJson(Map<String, dynamic> json) =>
      _$AssessmentAnswerFromJson(json);
}
