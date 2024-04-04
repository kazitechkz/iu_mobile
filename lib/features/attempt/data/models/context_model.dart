import 'package:iu/features/attempt/domain/entities/context_entity.dart';

import '../../../../core/utils/typedef.dart';

class ContextModel extends ContextEntity{
  const ContextModel({required super.id, required super.subjectId, required super.context,super.createdAt, super.updatedAt, super.deletedAt});

  factory ContextModel.fromJson(Map<String, dynamic> json){
    return ContextModel.fromMap(json);
  }

  ContextModel.fromMap(DataMap map)
      : this(
    id:map["id"],
    subjectId:map["subject_id"],
    context:map["context"],
    createdAt:map["created_at"],
    updatedAt:map["updated_at"],
    deletedAt:map["deleted_at"],
  );

  static List<ContextModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => ContextModel.fromMap(map)).toList();
  }

}