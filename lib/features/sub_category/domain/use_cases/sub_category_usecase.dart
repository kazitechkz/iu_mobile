import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_category/domain/interface/sub_category_interface.dart';
import 'package:iu/features/sub_category/domain/parameters/sub_category_params.dart';

class SubCategoryUseCase extends UseCaseWithParams<List<SubCategoryEntity>, SubCategoryParams> {
  final SubCategoryInterface subCategoryInterface;
  SubCategoryUseCase(this.subCategoryInterface);
  @override
  ResultFuture<List<SubCategoryEntity>> call(SubCategoryParams params) {
    return subCategoryInterface.getSubCategories(params);
  }

}