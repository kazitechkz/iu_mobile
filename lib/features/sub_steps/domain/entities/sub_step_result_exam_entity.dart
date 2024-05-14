import 'package:equatable/equatable.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_exam_entity.dart';

class SubStepExamResultEntity extends Equatable {
  final int count;
  final int isRight;
  final List<SubStepExamEntity> subStepExamEntity;

  const SubStepExamResultEntity({required this.count, required this.isRight, required this.subStepExamEntity});
  @override
  List<Object?> get props => [count, isRight, subStepExamEntity];
}

class SubStepExamResultAnsweredEntity extends Equatable {
  final int id;
  final bool isRight;
  final String answer;

  const SubStepExamResultAnsweredEntity({required this.id, required this.isRight, required this.answer});

  @override
  List<Object?> get props => [id, isRight, answer];

}