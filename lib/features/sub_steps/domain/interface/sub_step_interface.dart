import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';
import 'package:iu/features/sub_steps/domain/parameters/pass_sub_step_exam_params.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';

import '../../../../core/utils/typedef.dart';
import '../entities/sub_step_exam_entity.dart';

abstract class SubStepInterface {
  ResultFuture<List<SubStepEntity>> getSubSteps(String stepID);
  ResultFuture<SubStepEntity> getSubStepDetail(String subStepID);
  ResultFuture<List<SubStepExamEntity>> getSubStepExams(SubStepExamParameters params);
  ResultFuture<int> passSubStepExam(List<PassSubStepExamParams> params);
  ResultFuture<List<SubStepExamEntity>> getSubStepExamResult(SubStepExamParameters params);
  ResultFuture<bool> checkExamResult(SubStepExamParameters params);
}