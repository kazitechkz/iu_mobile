import 'package:iu/core/utils/typedef.dart';

import '../../../../core/usecases/use_case.dart';
import '../entities/tech_support_category_entity.dart';
import '../interface/tech_support_interface.dart';

class GetTechSupportCategoriesCase extends UseCaseWithoutParams<List<TechSupportCategoryEntity>>{
  final TechSupportInterface _techSupportInterface;
  const GetTechSupportCategoriesCase(this._techSupportInterface);

  @override
  ResultFuture<List<TechSupportCategoryEntity>> call() {
    return this._techSupportInterface.getTechSupportCategories();
  }
}