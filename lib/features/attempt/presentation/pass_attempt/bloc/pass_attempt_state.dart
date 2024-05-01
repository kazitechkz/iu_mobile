import 'package:equatable/equatable.dart';
import '../../../../../core/common/models/failure_data.dart';
import '../../../domain/entities/answer_result_entity.dart';
import '../../../domain/entities/answered_result_entity.dart';
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

class PassAttemptSuccessState extends PassAttemptState {
  final AttemptCommonEntity attempt;
  final int? subjectId;
  final Map<int,List<String>> answeredQuestions;
  final AnswerResultEntity? answerResult;
  final AnsweredResultEntity? answeredResult;
  final List<int> answeredQuestionsID;
  PassAttemptSuccessState(this.attempt, {this.subjectId = 0,this.answeredQuestions = const {},this.answerResult,this.answeredQuestionsID = const[],this.answeredResult});

  @override
  List<Object?> get props => [attempt, subjectId,answeredQuestions,answerResult,answeredQuestionsID,answeredResult];

  PassAttemptSuccessState copyWith({
    AttemptCommonEntity? attempt,
    int? subjectId,
    Map<int,List<String>>? answeredQuestions,
    AnswerResultEntity? answerResult,
    List<int>? answeredQuestionsID,
    AnsweredResultEntity? answeredResult,
  }) {
    return PassAttemptSuccessState(
      attempt ?? this.attempt,
      subjectId: subjectId ?? this.subjectId,
      answeredQuestions: answeredQuestions ?? this.answeredQuestions,
      answerResult: answerResult ?? this.answerResult,
      answeredQuestionsID: answeredQuestionsID ?? this.answeredQuestionsID,
      answeredResult: answeredResult ?? this.answeredResult,
    );
  }
}

final class PassAttemptFailedState extends PassAttemptState {
  final FailureData failureData;
  PassAttemptFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData.message, failureData.statusCode];
}
