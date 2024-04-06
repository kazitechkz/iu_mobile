import 'package:equatable/equatable.dart';

class FinishAttemptEntity extends Equatable {
  final int attemptId;
  final int points;
  const FinishAttemptEntity({required this.attemptId, required this.points});

  @override
  List<Object?> get props => [attemptId, points];
}
