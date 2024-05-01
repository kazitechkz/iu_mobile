import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/data/models/attempt_question_model.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';

import '../../../../core/utils/typedef.dart';
import 'context_model.dart';

class QuestionModel extends QuestionEntity {
  const QuestionModel({
    required super.id,
    required super.text,
    required super.answerA,
    required super.answerB,
    required super.answerC,
    super.answerD,
    super.answerE,
    super.answerF,
    super.answerG,
    super.answerH,
    super.correctAnswers,
    super.prompt,
    super.explanation,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    required super.subjectId,
    required super.localeId,
    required super.typeId,
    super.groupId,
    super.contextId,
    super.subCategoryId,
    ContextModel? super.context,
    SubjectModel? super.subject,
    SubCategoryModel? super.subcategory,
    List<AttemptQuestionModel>? super.attemptQuestions,
  });

  QuestionModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          text: map["text"],
          answerA: map["answer_a"],
          answerB: map["answer_b"],
          answerC: map["answer_c"],
          answerD: map["answer_d"],
          answerE: map["answer_e"],
          answerF: map["answer_f"],
          answerG: map["answer_g"],
          answerH: map["answer_h"],
          correctAnswers: map["correct_answers"],
          prompt: map["prompt"],
          explanation: map["explanation"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          deletedAt: map["deleted_at"],
          subjectId: map["subject_id"],
          localeId: map["locale_id"],
          typeId: map["type_id"],
          groupId: map["group_id"],
          contextId: map["context_id"],
          subCategoryId: map["sub_category_id"],
          context: map["context"] != null
              ? ContextModel.fromJson(map["context"])
              : null,
          subject: map["subject"] != null ? SubjectModel.fromJson(map['subject']) : null,
          subcategory: map["subcategory"] != null
              ? SubCategoryModel.fromJson(map['subcategory'])
              : null,
          attemptQuestions: map["attempt_questions"] != null
              ? AttemptQuestionModel.fromMapList(map["attempt_questions"])
              : null,
        );

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel.fromMap(json);
  }

  static List<QuestionModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => QuestionModel.fromMap(map)).toList();
  }
}
