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

class PassCareerOneSuccessState extends PassCareerOneState{
  final CareerQuizEntity careerQuizEntity;
  final Map<int,int> givenAnswer;
  PassCareerOneSuccessState({required this.careerQuizEntity, this.givenAnswer = const {}});

  PassCareerOneSuccessState copyWith({CareerQuizEntity? CareerQuizEntity, Map<int,int>? GivenAnswer}){
    return PassCareerOneSuccessState(careerQuizEntity: CareerQuizEntity?? careerQuizEntity, givenAnswer: GivenAnswer?? givenAnswer);
  }

  @override
  List<Object?> get props => [careerQuizEntity,givenAnswer];
}

class PassCareerOneFinishedState extends PassCareerOneState {
  final int resultId;
  PassCareerOneFinishedState({required this.resultId});
  @override
  List<Object?> get props => [resultId];
}