import '../../../../core/utils/typedef.dart';

class CreateAttemptParameter {
  final List<int> subjects;
  final int locale_id;
  final int attempt_type_id;

  const CreateAttemptParameter(
      {required this.subjects,
      required this.locale_id,
      required this.attempt_type_id});
  CreateAttemptParameter copyWith({
    List<int>? subjects,
    int? locale_id,
    int? attempt_type_id,
  }) {
    return CreateAttemptParameter(
      subjects: subjects ?? this.subjects,
      locale_id: locale_id ?? this.locale_id,
      attempt_type_id: attempt_type_id ?? this.attempt_type_id,
    );
  }
  DataMap toMap() {
    return {
      "subjects": subjects,
      "locale_id": locale_id,
      "attempt_type_id": attempt_type_id
    };
  }
}
