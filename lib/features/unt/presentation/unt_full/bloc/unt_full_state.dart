part of 'unt_full_bloc.dart';

abstract class UntFullState extends Equatable {
  final CreateAttemptParameter? parameter;
  const UntFullState({this.parameter = null});
}

class UntFullInitialState extends UntFullState {
  @override
  List<Object> get props => [];
}

class UntFullLoadingState extends UntFullState {
  @override
  List<Object> get props => [];
}

class UntFullSubjectLoadedState extends UntFullState {
  final List<SubjectEntity> subjects;
  final List<SubjectEntity> not_complusory_subjects;
  final List<SubjectEntity> complusory_subjects;
  const UntFullSubjectLoadedState(
      {required this.subjects,
      required this.complusory_subjects,
      required this.not_complusory_subjects,
      super.parameter = const CreateAttemptParameter(
          subjects: [], locale_id: 1, attempt_type_id: 1)});
  // Updated copyWith method
  UntFullSubjectLoadedState copyWith({
    List<SubjectEntity>? Subjects,
    List<SubjectEntity>? NCSubjects,
    List<SubjectEntity>? CSubjects,
    List<int>? subjects,
    int? localeId,
    int? attemptTypeId,
  }) {
    return UntFullSubjectLoadedState(
      subjects: Subjects ??
          this.subjects, // Use the new subjects list if provided, otherwise use the current list
      complusory_subjects: CSubjects ?? this.complusory_subjects,
      not_complusory_subjects: NCSubjects ?? this.not_complusory_subjects,
      parameter: parameter?.copyWith(
        subjects: subjects ?? parameter?.subjects,
        locale_id: localeId ?? parameter?.locale_id,
        attempt_type_id: attemptTypeId ?? parameter?.attempt_type_id,
      ),
    );
  }

  @override
  List<Object?> get props => [subjects, parameter];
}

class UntFullFailedState extends UntFullState {
  final FailureData failureData;
  const UntFullFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData.message, failureData.statusCode];
}

class UntFullAttemptCreatedState extends UntFullState {
  final int attemptId;
  const UntFullAttemptCreatedState(this.attemptId);
  @override
  List<Object?> get props => [attemptId];
}
