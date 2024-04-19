import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_category/domain/parameters/sub_category_params.dart';

abstract class SubCategoryInterface {
  ResultFuture<List<SubCategoryEntity>> getSubCategories(SubCategoryParams params);
}