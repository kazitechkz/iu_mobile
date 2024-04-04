class CreateAttemptParameter{
  final List<int> subjects;
  final int locale_id;
  final int attempt_type_id;

  const CreateAttemptParameter(
  {
    required this.subjects, required this.locale_id, required this.attempt_type_id
  });
}