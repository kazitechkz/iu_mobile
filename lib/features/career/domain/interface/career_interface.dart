import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/pay_entity.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/career/domain/entities/career_quiz_attempt_entity.dart';
import 'package:iu/features/career/domain/entities/career_quiz_entity.dart';
import 'package:iu/features/career/domain/entities/get_career_quiz_entity.dart';
import 'package:iu/features/career/domain/entities/get_career_quiz_group_list_entity.dart';
import 'package:iu/features/career/domain/parameters/finish_career_quiz_parameter.dart';
import 'package:iu/features/career/domain/parameters/get_career_quizzes_parameter.dart';
import 'package:iu/features/career/domain/parameters/my_career_attempts_parameter.dart';
import 'package:iu/features/career/domain/parameters/pay_career_parameter.dart';

import '../entities/get_career_quizzes_entity.dart';

abstract class CareerInterface {
  ResultFuture<int> finishCareer(FinishCareerQuizParameter parameter);
  ResultFuture<GetCareerQuizEntity> getCareerQuiz(int parameter);
  ResultFuture<GetCareerQuizGroupListEntity> getCareerQuizGroupList();
  ResultFuture<GetCareerQuizzesEntity> getCareerQuizzes(GetCareerQuizzesParameter parameter);
  ResultFuture<PaginationData<List<CareerQuizAttemptEntity>>> myCareerAttempts(MyCareerAttemptsParameter parameter);
  ResultFuture<CareerQuizEntity> passCareerQuiz(int parameter);
  ResultFuture<PayModel> payCareer(PayCareerParameter parameter);
  ResultFuture<CareerQuizAttemptEntity> resultCareerQuiz(int parameter);
}
