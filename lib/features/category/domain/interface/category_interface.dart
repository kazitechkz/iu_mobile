import 'package:iu/core/common/models/categories.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/category/domain/parameters/category_params.dart';

abstract class CategoryInterface {
  ResultFuture<List<CategoryEntity>> getCategories(CategoryParams params);
}