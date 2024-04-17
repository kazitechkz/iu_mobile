import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/common/models/response_data.dart';
import 'package:iu/features/iutube/data/models/iutube_author_model.dart';
import 'package:iu/features/iutube/data/models/iutube_video_model.dart';
import 'package:iu/features/iutube/domain/entities/iutube_author_entity.dart';
import 'package:iu/features/iutube/domain/entities/iutube_video_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_video_author_detail_entity.dart';

class GetVideoAuthorDetailModel extends GetVideoAuthorDetailEntity {
  const GetVideoAuthorDetailModel(
      {required IUTubeAuthorModel super.author,
      required PaginationData<List<IUTubeVideoModel>> super.videos});

  GetVideoAuthorDetailModel.fromMap(DataMap map) : this(
    author: IUTubeAuthorModel.fromMap(map["author"]),
    videos: handleData(map),
  );

  factory GetVideoAuthorDetailModel.fromJson(Map<String, dynamic> json) {
    return GetVideoAuthorDetailModel.fromMap(json);
  }

  static List<GetVideoAuthorDetailModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList
        .map((map) => GetVideoAuthorDetailModel.fromMap(map))
        .toList();
  }

  static PaginationData<List<IUTubeVideoModel>> handleData(DataMap map){
    PaginationData paginationData = PaginationData.fromMap(map["videos"]);
    List<IUTubeVideoModel> data = IUTubeVideoModel.fromMapList(paginationData.data.cast<Map<String, dynamic>>());
    final result = PaginationData.fromType(paginationData, data);
    return result;
  }
}
