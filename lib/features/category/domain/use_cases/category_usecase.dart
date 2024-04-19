import 'package:iu/core/common/models/categories.dart';
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/category/domain/interface/category_interface.dart';
import 'package:iu/features/category/domain/parameters/category_params.dart';

class CategoryUseCase extends UseCaseWithParams<List<CategoryEntity>, CategoryParams> {
  final CategoryInterface categoryInterface;
  CategoryUseCase(this.categoryInterface);
  @override
  ResultFuture<List<CategoryEntity>> call(CategoryParams params) {
    return categoryInterface.getCategories(params);
  }

}