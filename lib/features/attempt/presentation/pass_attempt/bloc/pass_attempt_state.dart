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
  final int activeSlider;
  final Map<int,List<String>> answeredQuestions;
  final AnswerResultEntity? answerResult;
  final AnsweredResultEntity? answeredResult;
  final int timeLeftMS;
  final Map<int,List<String>> answeredQuestionsID;
  PassAttemptSuccessState(this.attempt,{required this.timeLeftMS,this.subjectId = 0,this.answeredQuestions = const {},this.answerResult,this.activeSlider = 0,this.answeredQuestionsID = const{},this.answeredResult});

  @override
  List<Object?> get props => [attempt, subjectId,activeSlider,answeredQuestions,answerResult,answeredQuestionsID,answeredResult,timeLeftMS];

  PassAttemptSuccessState copyWith({
    AttemptCommonEntity? attempt,
    int? timeLeft,
    int? subjectId,
    Map<int,List<String>>? answeredQuestions,
    AnswerResultEntity? answerResult,
    Map<int,List<String>>? answeredQuestionsID,
    AnsweredResultEntity? answeredResult,
    int? activeSlider,
  }) {
    return PassAttemptSuccessState(
      attempt ?? this.attempt,
      timeLeftMS: timeLeft ?? this.timeLeftMS,
      activeSlider: activeSlider ?? this.activeSlider,
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

final class PassAttemptFinishedState extends PassAttemptState{
  @override
  List<Object?> get props => [];

}
