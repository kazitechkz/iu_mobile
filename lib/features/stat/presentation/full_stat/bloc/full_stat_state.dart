part of 'full_stat_bloc.dart';

abstract class FullStatState extends Equatable {}

final class FullStatInitialState extends FullStatState {
  @override
  List<Object?> get props => [];
}

final class FullStatLoadingState extends FullStatState {
  @override
  List<Object?> get props => [];
}

final class FullStatFailedState extends FullStatState {
  final FailureData failureData;

  FullStatFailedState(this.failureData);

  @override
  List<Object?> get props => [failureData];
}

final class FullStatSuccessState extends FullStatState {
  final FullStatEntity stat;
  final List<SubjectEntity>? subjects;
  final List<AttemptTypeEntity>? attemptTypes;

  FullStatSuccessState({required this.stat, this.subjects, this.attemptTypes});

  FullStatSuccessState copyWith(
      {FullStatEntity? statEntity,
      List<SubjectEntity>? subjectsEntity,
      List<AttemptTypeEntity>? attemptType}) {
    return FullStatSuccessState(
        stat: statEntity ?? stat,
        subjects: subjectsEntity ?? subjects,
        attemptTypes: attemptType ?? attemptTypes);
  }

  @override
  List<Object?> get props => [];
}
