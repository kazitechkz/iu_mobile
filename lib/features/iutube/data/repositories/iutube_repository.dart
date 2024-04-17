import 'package:dartz/dartz.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/iutube/data/datasources/iutube_datasource.dart';
import 'package:iu/features/iutube/domain/entities/get_main_videos_entity.dart';
import 'package:iu/features/iutube/domain/entities/get_video_author_detail_entity.dart';
import 'package:iu/features/iutube/domain/entities/get_video_detail_entity.dart';
import 'package:iu/features/iutube/domain/entities/iutube_video_entity.dart';
import 'package:iu/features/iutube/domain/interface/iutube_interface.dart';
import 'package:iu/features/iutube/domain/parameters/get_all_videos_parameter.dart';
import 'package:iu/features/iutube/domain/parameters/get_video_author_detail_parameter.dart';
import 'package:iu/features/iutube/domain/parameters/get_video_detail_parameter.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';

class IUTubeRepository implements IUTubeInterface{

  final IUTubeDataSourceInterface iuTubeDataSourceInterface;
  const IUTubeRepository(this.iuTubeDataSourceInterface);

  @override
  ResultFuture<PaginationData<List<IUTubeVideoEntity>>> getAllVideos(GetAllVideosParameter parameter) async {
    try {
      final result = await this.iuTubeDataSourceInterface.getAllVideosDS(parameter);
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

  @override
  ResultFuture<GetMainVideosEntity> getMainVideos() async {
    try {
      final result = await this.iuTubeDataSourceInterface.getMainVideosDS();
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

  @override
  ResultFuture<GetVideoAuthorDetailEntity> getVideoAuthor(GetVideoAuthorDetailParameter parameter) async {
    try {
      final result = await this.iuTubeDataSourceInterface.getVideoAuthorDS(parameter);
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

  @override
  ResultFuture<GetVideoDetailEntity> getVideoDetail(GetVideoDetailParameter parameter) async {
    try {
      final result = await this.iuTubeDataSourceInterface.getVideoDetailDS(parameter);
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