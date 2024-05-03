part of 'attempt_result_bloc.dart';

abstract class AttemptResultState extends Equatable {}

class AttemptResultInitialState extends AttemptResultState {
  @override
  List<Object?> get props => [];
}

class AttemptResultLoadingState extends AttemptResultState {
  @override
  List<Object?> get props => [];
}


class AttemptResultFailedState extends AttemptResultState {
  final FailureData failureData;
  AttemptResultFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class AttemptResultSuccessState extends AttemptResultState {
  final StatByAttemptIdEntity stats;
  AttemptResultSuccessState({required this.stats});
  @override
  List<Object?> get props => [stats];
}