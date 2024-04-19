import 'package:equatable/equatable.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_exam_question_entity.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_result_exam_entity.dart';

import '../../../attempt/domain/entities/question_entity.dart';

class SubStepExamEntity extends Equatable {
  final int id;
  final int sub_step_id;
  final int question_id;
  final SubStepExamQuestionEntity question;
  final SubStepExamResultEntity? result;

  const SubStepExamEntity({required this.id, required this.sub_step_id, required this.question, required this.question_id, this.result});

  @override
  List<Object?> get props => [id, sub_step_id, question_id, question, result];
}