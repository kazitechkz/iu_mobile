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
  final PaginationData<List<QuestionEntity>> questions;
  const MySavedQuestionsLoaded(this.questions);
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