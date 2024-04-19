import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_category/data/datasources/sub_category_datasource.dart';
import 'package:iu/features/sub_category/domain/interface/sub_category_interface.dart';
import 'package:iu/features/sub_category/domain/parameters/sub_category_params.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class SubCategoryRepository implements SubCategoryInterface {
  final SubCategoryDatasourceInterface subCategoryDatasourceInterface;
  SubCategoryRepository(this.subCategoryDatasourceInterface);
  @override
  ResultFuture<List<SubCategoryEntity>> getSubCategories(SubCategoryParams params) async {
    try {
      final result = await subCategoryDatasourceInterface.getSubCategories(params);
      return Right(result);
    } on ApiException catch (e) {
      ApiFailure failure = ApiFailure.fromException(e);
      return Left(failure);
    } on Exception catch (e) {
      var exception = ApiException(message: e.toString());
      ApiFailure failure = ApiFailure.fromException(exception);
      return Left(failure);
    }
  }

}