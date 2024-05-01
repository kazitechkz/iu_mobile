import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/domain/entities/attempt_question_entity.dart';
import 'package:iu/features/attempt/domain/entities/context_entity.dart';

class QuestionEntity extends Equatable{
  final int id;
  final String text;
  final String answerA;
  final String answerB;
  final String answerC;
  final String? answerD;
  final String? answerE;
  final String? answerF;
  final String? answerG;
  final String? answerH;
  final String? correctAnswers;
  final String? prompt;
  final String? explanation;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int subjectId;
  final int localeId;
  final int typeId;
  final int? groupId;
  final int? contextId;
  final int? subCategoryId;
  final ContextEntity? context;
  final SubjectEntity? subject;
  final SubCategoryEntity? subcategory;
  final List<AttemptQuestionEntity>? attemptQuestions;

  const QuestionEntity({
      required this.id,
      required this.text,
      required this.answerA,
      required this.answerB,
      required this.answerC,
      this.answerD,
      this.answerE,
      this.answerF,
      this.answerG,
      this.answerH,
      this.correctAnswers,
      this.prompt,
      this.explanation,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      required this.subjectId,
      required this.localeId,
      required this.typeId,
      this.groupId,
      this.contextId,
      this.subCategoryId,
      this.context,
      this.subject,
      this.subcategory,
      this.attemptQuestions,
  });

  @override
  List<Object?> get props => [id,text,answerA,answerB,answerC,answerD,subjectId,localeId,typeId];
}