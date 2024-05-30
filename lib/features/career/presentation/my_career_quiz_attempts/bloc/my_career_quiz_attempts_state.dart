part of 'my_career_quiz_attempts_bloc.dart';

@immutable
abstract class MyCareerQuizAttemptsState extends Equatable {}

class MyCareerQuizAttemptsInitialState extends MyCareerQuizAttemptsState {
  @override
  List<Object?> get props => [];
}

class MyCareerQuizAttemptsLoadingState extends MyCareerQuizAttemptsState {
  @override
  List<Object?> get props => [];
}

class MyCareerQuizAttemptsFailedState extends MyCareerQuizAttemptsState {
  final FailureData failureData;

  MyCareerQuizAttemptsFailedState(this.failureData);

  @override
  List<Object?> get props => [failureData];
}

class MyCareerQuizAttemptsSuccessState extends MyCareerQuizAttemptsState {
  final PaginationData<List<CareerQuizAttemptEntity>> careerQuizPagination;
  final List<CareerQuizAttemptEntity> careerQuizzes;

  MyCareerQuizAttemptsSuccessState(
      {required this.careerQuizPagination, required this.careerQuizzes});

  MyCareerQuizAttemptsSuccessState copyWith(
      {PaginationData<List<CareerQuizAttemptEntity>>? CareerQuizPagination,
      List<CareerQuizAttemptEntity>? CareerQuizzes}) {
    return MyCareerQuizAttemptsSuccessState(
        careerQuizPagination: CareerQuizPagination ?? careerQuizPagination,
        careerQuizzes: CareerQuizzes ?? careerQuizzes);
  }

  @override
  List<Object?> get props => [careerQuizPagination, careerQuizzes];
}
