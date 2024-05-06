import 'package:dio/dio.dart';
import 'package:iu/features/stat/data/models/full_stat_model.dart';
import 'package:iu/features/stat/data/models/result_by_attempt_id_model.dart';
import 'package:iu/features/stat/data/models/stat_by_attempt_id_model.dart';
import 'package:iu/features/stat/data/models/stat_by_subject_id_model.dart';
import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/hive_utils.dart';
import '../../../../core/utils/http_utils.dart';
import '../../domain/entities/full_stat_entity.dart';
import '../../domain/entities/result_by_attempt_id_entity.dart';
import '../../domain/entities/stat_by_attempt_id_entity.dart';
import '../../domain/entities/stat_by_subject_id_entity.dart';
import '../../domain/parameters/full_stat_parameter.dart';

abstract class StatDataSourceInterface {
  Future<FullStatEntity> fullStat(FullStatParameter parameter);
  // Future<SubStepEntity> passSubStep(PassSubStepParameter parameter);
  Future<ResultByAttemptIdEntity> resultByAttemptId(int parameter);
  Future<StatByAttemptIdEntity> statByAttemptId(int parameter);
  Future<StatBySubjectIdEntity> statBySubjectId(int parameter);
}

class StatDataSourceImpl extends StatDataSourceInterface {
  final httpUtils = HttpUtil();
  final hiveUtils = HiveUtils();

  @override
  Future<FullStatEntity> fullStat(FullStatParameter parameter) async {
    try {
      final response =
          await HttpUtil().get(ApiConstant.fullStat, data: parameter.toMap());
      final responseData = ResponseData.fromJson(response);
      final result = FullStatModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<ResultByAttemptIdEntity> resultByAttemptId(int parameter) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.resultByAttemptId + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = ResultByAttemptIdModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<StatByAttemptIdEntity> statByAttemptId(int parameter) async {
    try {
      final response = await HttpUtil()
          .get(ApiConstant.statByAttemptId + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = StatByAttemptIdModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<StatBySubjectIdEntity> statBySubjectId(int parameter) async {
    try {
      final response = await HttpUtil()
          .post(ApiConstant.statBySubjectId + parameter.toString());
      final responseData = ResponseData.fromJson(response);
      final result = StatBySubjectIdModel.fromMap(responseData.data);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
