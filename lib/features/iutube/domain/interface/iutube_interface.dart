import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/iutube/domain/entities/get_main_videos_entity.dart';
import 'package:iu/features/iutube/domain/entities/get_video_author_detail_entity.dart';
import 'package:iu/features/iutube/domain/entities/get_video_detail_entity.dart';
import 'package:iu/features/iutube/domain/entities/iutube_video_entity.dart';
import 'package:iu/features/iutube/domain/parameters/get_all_videos_parameter.dart';
import 'package:iu/features/iutube/domain/parameters/get_video_author_detail_parameter.dart';
import 'package:iu/features/iutube/domain/parameters/get_video_detail_parameter.dart';

import '../../../../core/common/models/pagination_data.dart';

abstract class IUTubeInterface{
  ResultFuture<PaginationData<List<IUTubeVideoEntity>>> getAllVideos(GetAllVideosParameter parameter);
  ResultFuture<GetMainVideosEntity> getMainVideos();
  ResultFuture<GetVideoAuthorDetailEntity> getVideoAuthor(GetVideoAuthorDetailParameter parameter);
  ResultFuture<GetVideoDetailEntity> getVideoDetail(GetVideoDetailParameter parameter);
}