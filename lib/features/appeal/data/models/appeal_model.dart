import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/domain/entities/appeal_entity.dart';
import 'package:iu/features/attempt/data/models/question_model.dart';

import 'appeal_type_model.dart';

class AppealModel extends AppealEntity {
  const AppealModel({required super.id, required super.userId, required super.typeId, required super.questionId, required super.message, required super.status, super.question, super.appealType, super.createdAt, super.updatedAt});

  factory AppealModel.fromJson(DataMap map) {
    return AppealModel(
        id: map['id'] as int,
        userId: map['user_id'] as int,
        typeId: map['type_id'] as int,
        questionId: map['question_id'] as int,
        message: map['message'] as String,
        status: map['status'] as int,
        question: map['question'] != null ? QuestionModel.fromMap(map['question']) : null,
        appealType: map['appeal_type'] != null ? AppealTypeModel.fromJson(map['appeal_type']) : null,
        createdAt: map['created_at'] != null ? map['created_at'] as String : null,
        updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  static List<AppealModel> fromListJson(List<DataMap> mapList) {
    return mapList.map((e) => AppealModel.fromJson(e)).toList();
  }
}