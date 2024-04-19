import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/categories.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/category/data/datasources/category_datasources.dart';
import 'package:iu/features/category/domain/interface/category_interface.dart';
import 'package:iu/features/category/domain/parameters/category_params.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class CategoryRepository implements CategoryInterface {
  final CategoryDatasourceInterface categoryDatasourceInterface;
  CategoryRepository(this.categoryDatasourceInterface);
  @override
  ResultFuture<List<CategoryEntity>> getCategories(CategoryParams params) async {
    try {
      final result = await categoryDatasourceInterface.getCategories(params);
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