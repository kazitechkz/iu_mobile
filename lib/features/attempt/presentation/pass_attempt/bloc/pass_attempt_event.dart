import 'package:equatable/equatable.dart';

abstract class PassAttemptEvent extends Equatable {}

class PassAttemptGetByAttemptIdEvent extends PassAttemptEvent {
  final int attemptId;
  PassAttemptGetByAttemptIdEvent(this.attemptId);
  @override
  List<Object?> get props => [];
}
