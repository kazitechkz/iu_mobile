part of 'pass_career_drag_drop_bloc.dart';

@immutable
sealed class PassCareerDragDropState extends Equatable {}

final class PassCareerDragDropInitialState extends PassCareerDragDropState {
  @override
  List<Object?> get props => [];
}

final class PassCareerDragDropLoadingState extends PassCareerDragDropState {
  @override
  List<Object?> get props => [];
}

final class PassCareerDragDropSuccessState extends PassCareerDragDropState {
  final CareerQuizEntity passCareerQuiz;
  final Map<int, Map<int, int>> givenAnswer;
  final int pageIndex;

  PassCareerDragDropSuccessState(
      {required this.passCareerQuiz,
      this.givenAnswer = const {},
      this.pageIndex = 0});

  PassCareerDragDropSuccessState copyWith({
    CareerQuizEntity? PassCareerQuiz,
    Map<int, Map<int, int>>? GivenAnswer,
    int? PageIndex,
  }) {
    return PassCareerDragDropSuccessState(
      passCareerQuiz: PassCareerQuiz ?? passCareerQuiz,
      givenAnswer: GivenAnswer ?? givenAnswer,
      pageIndex: PageIndex ?? pageIndex,
    );
  }

  @override
  List<Object?> get props => [passCareerQuiz, givenAnswer.hashCode, pageIndex];
}

final class PassCareerDragDropFailedState extends PassCareerDragDropState {
  final FailureData failureData;
  PassCareerDragDropFailedState(this.failureData);
  @override
  List<Object?> get props => [];
}
