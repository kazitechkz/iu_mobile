import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/stat/data/models/subject_stat_model.dart';
import 'package:iu/features/stat/data/models/subject_sub_category_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/full_stat_entity.dart';

class FullStatModel extends FullStatEntity {
  const FullStatModel(
      {Map<String,Map<String, SubjectStatModel?>>? super.subjects,
      required super.count,
      super.average,
      super.min,
      super.max,
      super.questionQuantity});

  FullStatModel.fromMap(DataMap map)
      : this(
          subjects: map["subjects"] != null
              ? getSubjects(map)
              : null,
          count:  map["count"] != null ? map["count"] : 0,
          average: map["average"] != null ? double.parse(map["average"]) : 0,
          min:   map["min"] != null ? map["min"] : 0,
          max: map["max"] != null ? map["max"] : 0,
          questionQuantity: map["question_quantity"] != null ? map["question_quantity"] : 0,
        );

  factory FullStatModel.fromJson(Map<String, dynamic> json) {
    return FullStatModel.fromMap(json);
  }

  static List<FullStatModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => FullStatModel.fromMap(map)).toList();
  }

  static Map<String,Map<String, SubjectStatModel?>>? getSubjects(DataMap map){
    final rawData = map["subjects"];
    final Map<String,Map<String, SubjectStatModel?>> result = {};
    if(rawData != null){
      if(rawData.length > 0){
        rawData.forEach((mainCategoryKey, mainCategoryValue) {
          result[mainCategoryKey] = {};
          if(mainCategoryValue != null){
            Map<String, dynamic> subCategories = mainCategoryValue as Map<String, dynamic>;
            subCategories.forEach((subCategoryKey, subCategoryDetails) {
              if(subCategoryDetails['sub_category'] != null){
                result[mainCategoryKey]?[subCategoryKey] =  SubjectStatModel.fromMap(subCategoryDetails);
              }
            });
          }
        });
      }
    }
    return result;
  }
}
