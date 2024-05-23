part of 'kundelik_bloc.dart';

sealed class KundelikState extends Equatable {
  const KundelikState();
}

final class KundelikInitial extends KundelikState {
  @override
  List<Object> get props => [];
}

class KundelikLoading extends KundelikState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class KundelikLoadingCanceled extends KundelikState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class KundelikLoaded extends KundelikState {
  final AuthUserEntity user;
  const KundelikLoaded(this.user);
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class KundelikError extends KundelikState {
  final FailureData failureData;
  const KundelikError(this.failureData);
  @override
  List<Object> get props => [failureData];
}
