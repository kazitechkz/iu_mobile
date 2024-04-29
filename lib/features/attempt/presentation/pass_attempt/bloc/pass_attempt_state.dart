import 'package:equatable/equatable.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/attempt_common_entity.dart';

abstract class PassAttemptState extends Equatable {}

final class PassAttemptInitialState extends PassAttemptState {
  @override
  List<Object?> get props => [];
}

final class PassAttemptLoadingState extends PassAttemptState {
  @override
  List<Object?> get props => [];
}

final class PassAttemptSuccessState extends PassAttemptState {
  final AttemptCommonEntity attempt;
  PassAttemptSuccessState(this.attempt);
  @override
  List<Object?> get props => [attempt];
}

final class PassAttemptFailedState extends PassAttemptState {
  final FailureData failureData;
  PassAttemptFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData.message, failureData.statusCode];
}
