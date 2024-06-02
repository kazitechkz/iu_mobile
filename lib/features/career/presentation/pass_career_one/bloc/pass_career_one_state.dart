part of 'pass_career_one_bloc.dart';

@immutable
abstract class PassCareerOneState extends Equatable {}

class PassCareerOneInitialState extends PassCareerOneState {
  @override
  List<Object?> get props => [];
}

class PassCareerOneLoadingState extends PassCareerOneState {
  @override
  List<Object?> get props => [];
}

class PassCareerOneFailedState extends PassCareerOneState {
  final FailureData failureData;
  PassCareerOneFailedState(this.failureData);
  @override
  List<Object?> get props => [];
}

class PassCareerOneSuccessState extends PassCareerOneState {
  final CareerQuizEntity careerQuizEntity;
  final Map<int, int> givenAnswer;
  final Map<int, int> answers;
  PassCareerOneSuccessState(
      {required this.careerQuizEntity,
      this.givenAnswer = const {},
      this.answers = const {}});

  PassCareerOneSuccessState copyWith({
    CareerQuizEntity? CareerQuizEntity,
    Map<int, int>? GivenAnswer,
    Map<int, int>? Answers,
  }) {
    return PassCareerOneSuccessState(
        careerQuizEntity: CareerQuizEntity ?? careerQuizEntity,
        givenAnswer: GivenAnswer ?? givenAnswer,
        answers: Answers ?? answers);
  }

  @override
  List<Object?> get props => [careerQuizEntity, givenAnswer.hashCode, answers];
}

class PassCareerOneFinishedState extends PassCareerOneState {
  final int resultId;
  PassCareerOneFinishedState({required this.resultId});
  @override
  List<Object?> get props => [resultId];
}
