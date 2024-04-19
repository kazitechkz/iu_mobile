import 'package:equatable/equatable.dart';

import '../../../attempt/domain/entities/context_entity.dart';

class SubStepExamQuestionEntity extends Equatable {
  final int id;
  final String text;
  final String answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final String? answerE;
  final String? answerF;
  final String? answerG;
  final String? answerH;
  final int localeId;
  final int? contextId;
  final ContextEntity? context;

  const SubStepExamQuestionEntity({
    required this.id,
    required this.text,
    required this.answerA,
    required this.answerB,
    required this.answerC,
    required this.answerD,
    this.answerE,
    this.answerF,
    this.answerG,
    this.answerH,
    required this.localeId,
    this.contextId,
    this.context,
});
  @override
  List<Object?> get props => [id, text, answerA, answerB, answerC, answerD, answerE, answerF, answerG, answerH, localeId, contextId, context];
}