part of 'career_quiz_detail_bloc.dart';

@immutable
abstract class CareerQuizDetailState extends Equatable {}

class CareerQuizDetailInitialState extends CareerQuizDetailState {
  @override
  List<Object?> get props => [];
}

class CareerQuizDetailLoadingState extends CareerQuizDetailState {
  @override
  List<Object?> get props => [];
}

class CareerQuizDetailFailedState extends CareerQuizDetailState {
  final FailureData failureData;
  CareerQuizDetailFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

class CareerQuizDetailSuccessState extends CareerQuizDetailState{
  final GetCareerQuizEntity careerQuizEntity;
  CareerQuizDetailSuccessState(this.careerQuizEntity);
  @override
  List<Object?> get props => [careerQuizEntity];
}