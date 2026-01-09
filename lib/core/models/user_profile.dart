import 'package:freezed_annotation/freezed_annotation.dart';
import 'character.dart';
import 'assessment_answer.dart';
import 'generated_output.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required List<Character> characters,
    @Default([]) List<AssessmentAnswer> answers,
    GeneratedOutput? cachedOutput,
    DateTime? lastUpdated,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
