part of 'stat_attempt_bloc.dart';

abstract class StatAttemptState extends Equatable {}

final class StatAttemptInitialState extends StatAttemptState {
  @override
  List<Object?> get props => [];
}

final class StatAttemptLoadingState extends StatAttemptState {
  @override
  List<Object?> get props => [];
}

final class StatAttemptFailedState extends StatAttemptState {
  final FailureData failureData;
  StatAttemptFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class StatAttemptSuccessState extends StatAttemptState {
  final StatByAttemptIdEntity stat;
  StatAttemptSuccessState({required this.stat});
  @override
  List<Object?> get props => [];
}
