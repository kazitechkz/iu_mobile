import 'package:iu/features/career/data/models/career_quiz_group_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_career_quiz_group_list_entity.dart';

class GetCareerQuizGroupListModel extends GetCareerQuizGroupListEntity {
  const GetCareerQuizGroupListModel(
      {required List<CareerQuizGroupModel> super.group,
      required List<int> super.purchased});

  GetCareerQuizGroupListModel.fromMap(DataMap map)
      : this(
          group: CareerQuizGroupModel.fromMapList(
              map["group"].cast<Map<String, dynamic>>()),
          purchased: map["purchased"].cast<int>(),
        );

  factory GetCareerQuizGroupListModel.fromJson(Map<String, dynamic> json) {
    return GetCareerQuizGroupListModel.fromMap(json);
  }

  static List<GetCareerQuizGroupListModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => GetCareerQuizGroupListModel.fromMap(map))
        .toList();
  }
}
