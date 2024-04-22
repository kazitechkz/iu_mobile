import 'package:dartz/dartz.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/open_ai/data/datasources/open_ai_datasource.dart';
import 'package:iu/features/open_ai/domain/interfaces/open_ai_interface.dart';
import 'package:iu/features/open_ai/domain/parameters/open_ai_params.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class OpenAiRepository implements OpenAiInterface {
  final OpenAiDatasourceInterface openAiDatasourceInterface;
  OpenAiRepository(this.openAiDatasourceInterface);
  @override
  ResultFuture<String> getAiAnswer(OpenAiParams params) async {
    try {
      final result = await openAiDatasourceInterface.getAiAnswer(params);
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