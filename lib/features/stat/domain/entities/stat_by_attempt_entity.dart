import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';

class StatByAttemptEntity extends Equatable {
  final SubCategoryEntity? subCategory;
  final int subjectId;
  final int right;
  final int notRight;
  final int total;
  final List<QuestionEntity>? questions;

  const StatByAttemptEntity({
    this.subCategory, required this.subjectId, required this.right,
    required this.notRight, required this.total, this.questions
});

  @override
  List<Object?> get props => [
    subCategory,
    subjectId,
    right,
    notRight,
    total,
    questions,
  ];
}