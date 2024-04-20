import 'package:equatable/equatable.dart';
import 'package:iu/features/appeal/domain/entities/appeal_type_entity.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';

class AppealEntity extends Equatable {
  final int id;
  final int userId;
  final int typeId;
  final int questionId;
  final String message;
  final int status;
  final String? createdAt;
  final String? updatedAt;
  final AppealTypeEntity? appealType;
  final QuestionEntity? question;

  const AppealEntity({
    required this.id,
    required this.userId,
    required this.typeId,
    required this.questionId,
    required this.message,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.appealType,
    this.question
  });

  @override
  List<Object?> get props => [id, userId, typeId, questionId, question, message, status, createdAt, updatedAt, appealType];
}