// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentAnswerImpl _$$AssessmentAnswerImplFromJson(
  Map<String, dynamic> json,
) => _$AssessmentAnswerImpl(
  assessmentType: json['assessmentType'] as String,
  questionId: json['questionId'] as String,
  selectedCharacterIds: (json['selectedCharacterIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  confidence: (json['confidence'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$AssessmentAnswerImplToJson(
  _$AssessmentAnswerImpl instance,
) => <String, dynamic>{
  'assessmentType': instance.assessmentType,
  'questionId': instance.questionId,
  'selectedCharacterIds': instance.selectedCharacterIds,
  'confidence': instance.confidence,
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
