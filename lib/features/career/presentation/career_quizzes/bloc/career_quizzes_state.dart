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
  final bool isLoadingPagination;
  CareerQuizzesSuccessState(
      {required this.careerQuizzesEntity,
      required this.careerQuizzes,
      this.isLoadingPagination = false});

  CareerQuizzesSuccessState copyWith(
      {GetCareerQuizzesEntity? CareerQuizzesEntity,
      List<CareerQuizEntity>? CareerQuizzes,
      bool? IsLoadingPagination}) {
    return CareerQuizzesSuccessState(
      careerQuizzesEntity: CareerQuizzesEntity ?? careerQuizzesEntity,
      careerQuizzes: CareerQuizzes ?? careerQuizzes,
      isLoadingPagination: IsLoadingPagination ?? isLoadingPagination,
    );
  }

  @override
  List<Object?> get props =>
      [careerQuizzesEntity, careerQuizzes, isLoadingPagination];
}
