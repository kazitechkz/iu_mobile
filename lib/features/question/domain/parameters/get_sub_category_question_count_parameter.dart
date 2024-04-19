import '../../../../core/utils/typedef.dart';

class GetSubCategoryQuestionCountParameter {
  final int sub_category_id;
  final int locale_id;

  const GetSubCategoryQuestionCountParameter(
      {required this.sub_category_id, required this.locale_id});

  DataMap toMap() {
    return {
      "sub_category_id": sub_category_id.toString(),
      "locale_id": locale_id.toString(),
    };
  }
}
