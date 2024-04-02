part of 'unt_bloc.dart';

abstract class UntEvent extends Equatable {
  const UntEvent();
}

class UntGetSubjectsEvent extends UntEvent{
  @override
  List<Object?> get props => [];
}