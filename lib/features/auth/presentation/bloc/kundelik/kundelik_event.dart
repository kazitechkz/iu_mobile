part of 'kundelik_bloc.dart';

sealed class KundelikEvent extends Equatable {
  const KundelikEvent();
}

class KundelikLoadingEvent extends KundelikEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class KundelikLoadingCanceledEvent extends KundelikEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class KundelikAuthEvent extends KundelikEvent {
  final KundelikSignInParameter params;
  const KundelikAuthEvent(this.params);
  @override
  // TODO: implement props
  List<Object?> get props => [params];
}
