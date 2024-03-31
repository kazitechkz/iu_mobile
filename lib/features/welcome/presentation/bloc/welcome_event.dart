part of 'welcome_bloc.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();
}

class WelcomePageEvent extends WelcomeEvent {
  final int page;
  WelcomePageEvent(this.page);
  @override
  List<Object?> get props => [page];
}

class WelcomeCacheEvent extends WelcomeEvent {
  const WelcomeCacheEvent();

  @override
  List<Object?> get props => [];
}

class WelcomeCheckVisitEvent extends WelcomeEvent {
  const WelcomeCheckVisitEvent();

  @override
  List<Object?> get props => [];
}
