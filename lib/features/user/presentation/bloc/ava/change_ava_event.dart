part of 'change_ava_bloc.dart';

sealed class ChangeAvaEvent extends Equatable {
  const ChangeAvaEvent();
}

class AvaPickFile extends ChangeAvaEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AvaUploadEvent extends ChangeAvaEvent {
  final String path;
  final BuildContext context;
  const AvaUploadEvent(this.path, this.context);
  @override
  // TODO: implement props
  List<Object?> get props => [path, context];
}
