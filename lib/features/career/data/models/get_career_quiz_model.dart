import 'package:iu/features/career/data/models/career_quiz_model.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_career_quiz_entity.dart';

class GetCareerQuizModel extends GetCareerQuizEntity {
  const GetCareerQuizModel(
      {required CareerQuizModel super.quiz, required super.isPurchased});

  GetCareerQuizModel.fromMap(DataMap map)
      : this(
          quiz: CareerQuizModel.fromMap(map["quiz"]),
          isPurchased: map["is_purchased"],
        );

  factory GetCareerQuizModel.fromJson(Map<String, dynamic> json) {
    return GetCareerQuizModel.fromMap(json);
  }

  static List<GetCareerQuizModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetCareerQuizModel.fromMap(map)).toList();
  }
}
