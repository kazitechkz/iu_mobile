part of 'attempt_by_promo_bloc.dart';

sealed class AttemptByPromoState extends Equatable {
  const AttemptByPromoState();
}

final class AttemptByPromoInitial extends AttemptByPromoState {
  @override
  List<Object> get props => [];
}

final class AttemptByPromoLoading extends AttemptByPromoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class AttemptByPromoLoaded extends AttemptByPromoState {
  final AttemptEntity attemptEntity;
  const AttemptByPromoLoaded(this.attemptEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [attemptEntity];
}

final class AttemptByPromoFailure extends AttemptByPromoState {
  final FailureData failureData;
  const AttemptByPromoFailure(this.failureData);
  @override
  // TODO: implement props
  List<Object?> get props => [failureData];
}