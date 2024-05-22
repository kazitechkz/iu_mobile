part of 'change_ava_bloc.dart';

sealed class ChangeAvaState extends Equatable {
  const ChangeAvaState();
}

final class ChangeAvaInitial extends ChangeAvaState {
  @override
  List<Object> get props => [];
}

final class AvaPicked extends ChangeAvaState {
  final String path;
  const AvaPicked(this.path);
  @override
  // TODO: implement props
  List<Object?> get props => [path];
}

class AvaUploading extends  ChangeAvaState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AvaUploaded extends ChangeAvaState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AvaUploadError extends ChangeAvaState {
  final FailureData failureData;
  const AvaUploadError(this.failureData);
  @override
  List<Object> get props => [failureData];
}
