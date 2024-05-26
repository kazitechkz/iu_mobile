part of 'subscription_bloc.dart';

sealed class SubscriptionState extends Equatable {
  const SubscriptionState();
}

final class SubscriptionInitial extends SubscriptionState {
  @override
  List<Object> get props => [];
}

class SubscriptionLoading extends SubscriptionState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SubscriptionLoaded extends SubscriptionState {
  final List<SubscriptionEntity> subs;
  const SubscriptionLoaded(this.subs);
  @override
  // TODO: implement props
  List<Object?> get props => [subs];
}