part of 'attempt_by_promo_bloc.dart';

sealed class AttemptByPromoEvent extends Equatable {
  const AttemptByPromoEvent();
}

class GetAttemptByPromoEvent extends AttemptByPromoEvent {
  final String promo;
  const GetAttemptByPromoEvent(this.promo);
  @override
  // TODO: implement props
  List<Object?> get props => [promo];
}