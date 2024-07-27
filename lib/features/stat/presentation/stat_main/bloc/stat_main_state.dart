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
  final List<AttemptEntity>? allAttemptsData;
  final UntStatEntity untStatEntity;
  final bool isLoadingPagination;

  StatMainSuccessState(
      {this.allAttempts,
      this.allAttemptsData,
      required this.untStatEntity,
      this.isLoadingPagination = false});

  StatMainSuccessState copyWith({
    PaginationData<List<AttemptEntity>>? allAttempts,
    List<AttemptEntity>? AllAttemptsData,
    UntStatEntity? untStatEntity,
    bool? IsLoadingPagination,
  }) {
    return StatMainSuccessState(
      allAttempts: allAttempts ?? this.allAttempts,
      allAttemptsData: AllAttemptsData ?? this.allAttemptsData,
      untStatEntity: untStatEntity ?? this.untStatEntity,
      isLoadingPagination: IsLoadingPagination ?? this.isLoadingPagination,
    );
  }

  @override
  List<Object?> get props =>
      [allAttempts.hashCode, untStatEntity, allAttemptsData];
}

final class StatMainFailedState extends StatMainState {
  final FailureData failureData;

  StatMainFailedState(this.failureData);

  @override
  List<Object?> get props => [failureData.message, failureData.statusCode];
}
