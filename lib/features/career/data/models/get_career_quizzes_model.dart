import '../../../../core/common/models/pagination_data.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_career_quizzes_entity.dart';
import 'career_quiz_model.dart';

class GetCareerQuizzesModel extends GetCareerQuizzesEntity {
  const GetCareerQuizzesModel(
      {required PaginationData<List<CareerQuizModel>> super.quizzes,
      required List<int> super.purchased});
  
  GetCareerQuizzesModel.fromMap(DataMap map)
      : this(
        quizzes: _handleCareerQuiz(map),
        purchased: map["purchased"].cast<int>(),
  );

  factory GetCareerQuizzesModel.fromJson(Map<String, dynamic> json) {
    return GetCareerQuizzesModel.fromMap(json);
  }

  static List<GetCareerQuizzesModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetCareerQuizzesModel.fromMap(map)).toList();
  }
  
  static PaginationData<List<CareerQuizModel>> _handleCareerQuiz(DataMap map){
    final data = map["quizzes"];
    PaginationData paginationData = PaginationData.fromMap(map["quizzes"]);
    List<CareerQuizModel> quizzes = CareerQuizModel.fromMapList(paginationData.data.cast<Map<String, dynamic>>());
    PaginationData<List<CareerQuizModel>> result = PaginationData.fromType(paginationData, quizzes);
    return result;
  }
}
