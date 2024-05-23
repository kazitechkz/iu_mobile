part of 'google_bloc.dart';

sealed class GoogleEvent extends Equatable {
  const GoogleEvent();
}

class GoogleLoadingEvent extends GoogleEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GoogleLoadingCanceledEvent extends GoogleEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GoogleSignInEvent extends GoogleEvent {
  final GoogleSignInParameter params;
  const GoogleSignInEvent(this.params);
  @override
  // TODO: implement props
  List<Object?> get props => [params];
}
