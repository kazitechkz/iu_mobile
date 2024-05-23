part of 'google_bloc.dart';

sealed class GoogleState extends Equatable {
  const GoogleState();
}

final class GoogleInitial extends GoogleState {
  @override
  List<Object> get props => [];
}

class GoogleLoading extends GoogleState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GoogleLoadingCanceled extends GoogleState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GoogleLoaded extends GoogleState {
  final AuthUserEntity user;
  const GoogleLoaded(this.user);
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class GoogleError extends GoogleState {
  final FailureData failureData;
  const GoogleError(this.failureData);
  @override
  List<Object> get props => [failureData];
}
