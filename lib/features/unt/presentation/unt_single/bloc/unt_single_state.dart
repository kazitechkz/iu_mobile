import 'package:equatable/equatable.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../../../core/common/models/subject.dart';
import '../../../../attempt/domain/parameters/create_attempt_parameter.dart';

abstract class UntSingleState extends Equatable {
  final CreateAttemptParameter? parameter;
  const UntSingleState({this.parameter = null});
}

class UntSingleInitialState extends UntSingleState {
  @override
  List<Object> get props => [];
}

class UntSingleLoadingState extends UntSingleState {
  @override
  List<Object> get props => [];
}

class UntSingleSubjectLoadedState extends UntSingleState {
  final List<SubjectEntity> subjects;
  const UntSingleSubjectLoadedState(this.subjects,
      {super.parameter = const CreateAttemptParameter(
          subjects: [], locale_id: 1, attempt_type_id: 2)});
  // Updated copyWith method
  UntSingleSubjectLoadedState copyWith({
    List<SubjectEntity>? Subjects,
    List<int>? subjects,
    int? localeId,
    int? attemptTypeId,
  }) {
    return UntSingleSubjectLoadedState(
      Subjects ??
          this.subjects, // Use the new subjects list if provided, otherwise use the current list
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

class UntSingleFailedState extends UntSingleState {
  final FailureData failureData;
  const UntSingleFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData.message, failureData.statusCode];
}

class UntSingleAttemptCreatedState extends UntSingleState {
  final int attemptId;
  const UntSingleAttemptCreatedState(this.attemptId);
  @override
  List<Object?> get props => [attemptId];
}
