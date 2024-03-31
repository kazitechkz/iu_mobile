part of 'welcome_bloc.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();
}

class WelcomeInitialState extends WelcomeState {
  int currentPage;
  WelcomeInitialState(this.currentPage);
  @override
  List<Object> get props => [currentPage];
}

class WelcomeLoadingState extends WelcomeState {
  @override
  List<Object> get props => [];
}

class WelcomeCheckedState extends WelcomeState {
  final bool isVisited;
  const WelcomeCheckedState(this.isVisited);

  @override
  List<bool> get props => [isVisited];
}

class WelcomeCachedState extends WelcomeState {
  @override
  List<Object> get props => [];
}

class WelcomeFailedState extends WelcomeState {
  final FailureData fail;
  const WelcomeFailedState(this.fail);

  @override
  List<FailureData> get props => [fail];
}
