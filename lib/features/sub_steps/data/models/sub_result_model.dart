import '../../domain/entities/sub_result_entity.dart';

class SubResultModel extends SubResultEntity {
  const SubResultModel({required super.id, required super.locale_id, required super.sub_step_id, required super.user_id, required super.user_point});

  factory SubResultModel.fromJson(Map<String, dynamic> json) {
    return SubResultModel(
        id: json['id'] as int,
        locale_id: json['locale_id'] as int,
        sub_step_id: json['sub_step_id'] as int,
        user_id: json['user_id'] as int,
        user_point: json['user_point'] as String
    );
  }

  static List<SubResultModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => SubResultModel.fromJson(map)).toList();
  }
}