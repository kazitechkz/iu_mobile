part of 'my_saved_questions_bloc.dart';

sealed class MySavedQuestionsEvent extends Equatable {
  const MySavedQuestionsEvent();
}

class GetMySavedQuestionsEvent extends MySavedQuestionsEvent {
  final GetMySavedQuestionsParameter params;
  const GetMySavedQuestionsEvent(this.params);
  @override
  // TODO: implement props
  List<Object?> get props => [params];
}

class ResetMySavedQuestionsEvent extends MySavedQuestionsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}