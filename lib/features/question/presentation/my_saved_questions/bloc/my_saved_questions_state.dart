part of 'my_saved_questions_bloc.dart';

sealed class MySavedQuestionsState extends Equatable {
  const MySavedQuestionsState();
}

final class MySavedQuestionsInitial extends MySavedQuestionsState {
  @override
  List<Object> get props => [];
}

class MySavedQuestionsLoading extends MySavedQuestionsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MySavedQuestionsLoaded extends MySavedQuestionsState {
  final List<QuestionEntity> questions;
  final bool hasReachedMax;

  const MySavedQuestionsLoaded({required this.questions, required this.hasReachedMax});

  MySavedQuestionsLoaded copyWith({
    List<QuestionEntity>? questions,
    bool? hasReachedMax,
  }) {
    return MySavedQuestionsLoaded(
      questions: questions ?? this.questions,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [questions];
}

class MySavedQuestionsError extends MySavedQuestionsState {
  final FailureData failureData;
  const MySavedQuestionsError(this.failureData);
  @override
  // TODO: implement props
  List<Object?> get props => [failureData];
}

class MySavedQuestionsReset extends MySavedQuestionsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}