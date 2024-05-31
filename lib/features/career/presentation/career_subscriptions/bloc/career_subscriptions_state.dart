part of 'career_subscriptions_bloc.dart';

@immutable
abstract class CareerSubscriptionsState extends Equatable {}

class CareerSubscriptionsInitialState extends CareerSubscriptionsState {
  @override
  List<Object?> get props => [];
}

class CareerSubscriptionsLoadingState extends CareerSubscriptionsState {
  @override
  List<Object?> get props => [];
}

class CareerSubscriptionsFailedState extends CareerSubscriptionsState {
  final FailureData failureData;
  CareerSubscriptionsFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

class CareerSubscriptionsSuccessState extends CareerSubscriptionsState {
  final GetCareerQuizGroupListEntity careerQuizGroupListEntity;
  CareerSubscriptionsSuccessState({required this.careerQuizGroupListEntity});
  @override
  List<Object?> get props => [careerQuizGroupListEntity];
}