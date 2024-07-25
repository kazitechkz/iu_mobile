part of 'attempt_work_over_failure_bloc.dart';

@immutable
sealed class AttemptWorkOverFailureState extends Equatable {}

final class AttemptWorkOverFailureInitialState
    extends AttemptWorkOverFailureState {
  @override
  List<Object?> get props => [];
}

final class AttemptWorkOverFailureLoadingState
    extends AttemptWorkOverFailureState {
  @override
  List<Object?> get props => [];
}

final class AttemptWorkOverFailureSuccessState
    extends AttemptWorkOverFailureState {
  final List<AttemptQuestionEntity> attemptQuestions;
  final AttemptCommonEntity attempt;
  final AttemptEntity result;
  final int? subjectId;
  final int activeSlider;
  final Map<int, List<String>> answeredQuestions;
  final List<int> savedQuestionId;
  AttemptWorkOverFailureSuccessState({
    required this.attemptQuestions,
    required this.attempt,
    required this.result,
    this.subjectId = 0,
    this.answeredQuestions = const {},
    this.activeSlider = 0,
    this.savedQuestionId = const [],
  });
  AttemptWorkOverFailureSuccessState copyWith({
    List<AttemptQuestionEntity>? AttemptQuestions,
    AttemptCommonEntity? Attempt,
    AttemptEntity? Result,
    int? SubjectId,
    int? ActiveSlider,
    Map<int, List<String>>? AnsweredQuestions,
    List<int>? SavedQuestionId,
  }) {
    return AttemptWorkOverFailureSuccessState(
      attemptQuestions: AttemptQuestions ?? this.attemptQuestions,
      attempt: Attempt ?? this.attempt,
      result: Result ?? this.result,
      subjectId: SubjectId ?? this.subjectId,
      answeredQuestions: AnsweredQuestions ?? this.answeredQuestions,
      activeSlider: ActiveSlider ?? this.activeSlider,
      savedQuestionId: SavedQuestionId ?? this.savedQuestionId,
    );
  }

  @override
  List<Object?> get props => [
        attemptQuestions,
        attempt,
        result,
        subjectId,
        answeredQuestions,
        activeSlider,
        savedQuestionId
      ];
}

final class AttemptWorkOverFailureFailedState
    extends AttemptWorkOverFailureState {
  final FailureData failureData;
  AttemptWorkOverFailureFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData.message, failureData.statusCode];
}
