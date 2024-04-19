import '../../../../core/utils/typedef.dart';

class GetCategoryQuestionCountParameter {
  final int category_id;
  final int locale_id;

  const GetCategoryQuestionCountParameter(
      {required this.category_id, required this.locale_id});

  DataMap toMap() {
    return {
      "category_id": category_id.toString(),
      "locale_id": locale_id.toString(),
    };
  }
}
