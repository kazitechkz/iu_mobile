import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/sub_steps/data/models/sub_step_exam_model.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_exam_entity.dart';
import 'package:iu/features/sub_steps/domain/parameters/pass_sub_step_exam_params.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';

import '../../../../core/app_constants/api_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/http_utils.dart';
import '../models/sub_step_model.dart';

abstract class SubStepDataSourceInterface {
  Future<List<SubStepEntity>> getSubSteps(String stepID);
  Future<SubStepEntity> getSubStepDetail(String subStepID);
  Future<List<SubStepExamEntity>> getSubStepExams(SubStepExamParameters params);
  Future<int> passSubStepExam(List<PassSubStepExamParams> params);
  Future<bool> checkExamResult(SubStepExamParameters params);
}

class SubStepDataSourceImpl extends SubStepDataSourceInterface {
  final httpUtils = HttpUtil();

  @override
  Future<List<SubStepEntity>> getSubSteps(String stepID) async {
    try {
      final response = await httpUtils.get(ApiConstant.getSubSteps + stepID);
      final responseData = ResponseData.fromJson(response);
      List<SubStepEntity> data = SubStepModel.fromMapList(
          responseData.data.cast<Map<String, dynamic>>());
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<SubStepEntity> getSubStepDetail(String subStepID) async {
    try {
      final response = await httpUtils.get(ApiConstant.getSubStepDetail + subStepID);
      final responseData = ResponseData.fromJson(response);
      SubStepEntity data = SubStepModel.fromJson(responseData.data);
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<List<SubStepExamEntity>> getSubStepExams(SubStepExamParameters params) async {
    try {
      final response = await httpUtils.get('${ApiConstant.getSubStepExams}${params.subStepId}/${params.localeId}');
      final responseData = ResponseData.fromJson(response);
      List<SubStepExamEntity> data = SubStepExamModel.fromMapList(responseData.data.cast<DataMap>());
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<int> passSubStepExam(List<PassSubStepExamParams> params) async {
    try {
      String paramsJson = jsonEncode(params.map((e) => e.toJson()).toList());
      final response = await httpUtils.post(ApiConstant.passSubStepExam, data: paramsJson);
      final responseData = ResponseData.fromJson(response);
      int data = responseData.data;
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> checkExamResult(SubStepExamParameters params) async {
    try {
      final response = await httpUtils.post(ApiConstant.checkSubStepExamResult, data: params);
      final responseData = ResponseData.fromJson(response);
      bool data = responseData.data;
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    } on Exception catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}