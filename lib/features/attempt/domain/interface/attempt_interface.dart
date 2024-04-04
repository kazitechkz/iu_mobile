import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/domain/entities/answered_result_entity.dart';
import 'package:iu/features/attempt/domain/entities/attempt_entity.dart';
import 'package:iu/features/attempt/domain/entities/finish_attempt_entity.dart';
import 'package:iu/features/attempt/domain/entities/get_stat_entity.dart';
import 'package:iu/features/attempt/domain/entities/unt_stat_entity.dart';
import 'package:iu/features/attempt/domain/parameters/all_attempts_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/answer_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/answered_result_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/create_attempt_parameter.dart';
import 'package:iu/features/attempt/domain/parameters/save_question_parameter.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../entities/answer_result_entity.dart';
import '../entities/attempt_common_entity.dart';

abstract class AttemptInterface{
    ResultFuture<PaginationData<List<AttemptEntity>>> allAttempts(AllAttemptsParameter allAttemptsParameter);
    ResultFuture<List<AttemptEntity>> allAttemptTypes();
    ResultFuture<AnswerResultEntity> answer(AnswerParameter answerParameter);
    ResultFuture<AnsweredResultEntity> answeredResult(AnsweredResultParameter answeredParameter);
    ResultFuture<int> createAttempt(CreateAttemptParameter createAttemptParameter);
    ResultFuture<FinishAttemptEntity> finishAttempt(int attemptId);
    ResultFuture<AttemptCommonEntity> getAttempt(dynamic data);
    ResultFuture<AttemptEntity> getAttemptByPromoCode(String promoCode);
    ResultFuture<GetStatEntity> getAttemptStat(String attemptId);
    ResultFuture<UntStatEntity> getUNTStat();
    ResultFuture<bool> saveQuestion(SaveQuestionParameter parameter);

}