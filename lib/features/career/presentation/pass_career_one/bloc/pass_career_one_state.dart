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
  final int pageIndex;
  PassCareerOneSuccessState(
      {required this.careerQuizEntity,
      this.givenAnswer = const {},
      this.answers = const {},
      this.pageIndex = 0});

  PassCareerOneSuccessState copyWith({
    CareerQuizEntity? CareerQuizEntity,
    Map<int, int>? GivenAnswer,
    Map<int, int>? Answers,
    int? PageIndex,
  }) {
    return PassCareerOneSuccessState(
      careerQuizEntity: CareerQuizEntity ?? careerQuizEntity,
      givenAnswer: GivenAnswer ?? givenAnswer,
      answers: Answers ?? answers,
      pageIndex: PageIndex ?? pageIndex,
    );
  }

  @override
  List<Object?> get props =>
      [careerQuizEntity, givenAnswer.hashCode, answers, pageIndex];
}

class PassCareerOneFinishedState extends PassCareerOneState {
  final int resultId;
  PassCareerOneFinishedState({required this.resultId});
  @override
  List<Object?> get props => [resultId];
}
