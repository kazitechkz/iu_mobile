part of 'career_quizzes_bloc.dart';

@immutable
abstract class CareerQuizzesState extends Equatable {}

class CareerQuizzesInitialState extends CareerQuizzesState {
  @override
  List<Object?> get props => [];
}

class CareerQuizzesLoadingState extends CareerQuizzesState {
  @override
  List<Object?> get props => [];
}

class CareerQuizzesFailureState extends CareerQuizzesState {
  final FailureData failureData;
  CareerQuizzesFailureState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

class CareerQuizzesSuccessState extends CareerQuizzesState {
  final GetCareerQuizzesEntity careerQuizzesEntity;
  final List<CareerQuizEntity> careerQuizzes;
  CareerQuizzesSuccessState({required this.careerQuizzesEntity,required this.careerQuizzes});

  CareerQuizzesSuccessState copyWith({
    GetCareerQuizzesEntity? CareerQuizzesEntity,
    List<CareerQuizEntity>? CareerQuizzes
  }){
    return CareerQuizzesSuccessState(
        careerQuizzesEntity: CareerQuizzesEntity ?? careerQuizzesEntity,
        careerQuizzes: CareerQuizzes ?? careerQuizzes
    );
  }

  @override
  List<Object?> get props => [careerQuizzesEntity];
}