part of 'result_career_quiz_bloc.dart';

@immutable
abstract class ResultCareerQuizState extends Equatable {}

class ResultCareerQuizInitialState extends ResultCareerQuizState {
  @override
  List<Object?> get props => [];
}

class ResultCareerQuizLoadingState extends ResultCareerQuizState {
  @override
  List<Object?> get props => [];
}

class ResultCareerQuizFailedState extends ResultCareerQuizState {
  final FailureData failureData;
  ResultCareerQuizFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}


class ResultCareerQuizSuccessState extends ResultCareerQuizState {
  final CareerQuizAttemptEntity careerQuizAttempt;
  ResultCareerQuizSuccessState(this.careerQuizAttempt);
  @override
  List<Object?> get props => [careerQuizAttempt];
}