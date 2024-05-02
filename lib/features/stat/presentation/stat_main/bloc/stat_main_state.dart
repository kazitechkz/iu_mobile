part of 'stat_main_bloc.dart';

@immutable
sealed class StatMainState extends Equatable {}

final class StatMainInitialState extends StatMainState {
  @override
  List<Object?> get props => [];
}

final class StatMainLoadingState extends StatMainState {
  @override
  List<Object?> get props => [];
}

final class StatMainSuccessState extends StatMainState {
  final PaginationData<List<AttemptEntity>>? allAttempts;
  final UntStatEntity untStatEntity;

  StatMainSuccessState({this.allAttempts, required this.untStatEntity});

  StatMainSuccessState copyWith({
    PaginationData<List<AttemptEntity>>? allAttempts,
    UntStatEntity? untStatEntity,
  }) {
    return StatMainSuccessState(
      allAttempts: allAttempts ?? this.allAttempts,
      untStatEntity: untStatEntity ?? this.untStatEntity,
    );
  }

  @override
  List<Object?> get props => [allAttempts, untStatEntity];
}

final class StatMainFailedState extends StatMainState {
  final FailureData failureData;

  StatMainFailedState(this.failureData);

  @override
  List<Object?> get props => [failureData.message, failureData.statusCode];
}
