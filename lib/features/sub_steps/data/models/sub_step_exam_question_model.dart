import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt/data/models/context_model.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_exam_question_entity.dart';

class SubStepExamQuestionModel extends SubStepExamQuestionEntity {
  const SubStepExamQuestionModel({
    required super.id,
    required super.text,
    required super.answerA,
    required super.answerB,
    required super.answerC,
    required super.answerD,
    super.answerE,
    super.answerF,
    super.answerG,
    super.answerH,
    super.contextId,
    super.context,
    required super.localeId
  });

  factory SubStepExamQuestionModel.fromJson(DataMap json) {
    return SubStepExamQuestionModel(
        id: json['id'] as int,
        text: json['text'] as String,
        answerA: json['answer_a'] as String,
        answerB: json['answer_b'] as String,
        answerC: json['answer_c'] as String,
        answerD: json['answer_d'] as String,
        answerE: json['answer_e'] != null ? json['answer_e'] as String : null,
        answerF: json['answer_f'] != null ? json['answer_f'] as String : null,
        answerG: json['answer_g'] != null ? json['answer_g'] as String : null,
        answerH: json['answer_h'] != null ? json['answer_h'] as String : null,
        localeId: json['locale_id'],
        contextId: json['context_id'] != null ? json['context_id'] as int : null,
        context: json['context'] != null ? ContextModel.fromMap(json['context']) : null,
    );
  }
}