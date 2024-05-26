part of 'subscription_bloc.dart';

sealed class SubscriptionEvent extends Equatable {
  const SubscriptionEvent();
}

class GetSubscriptionsEvent extends SubscriptionEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SelectSubscriptionEvent extends SubscriptionEvent {
  final int period;
  const SelectSubscriptionEvent(this.period);
  @override
  // TODO: implement props
  List<Object?> get props => [period];
}