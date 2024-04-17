import 'package:equatable/equatable.dart';
import 'package:iu/features/iutube/data/models/iutube_video_model.dart';
import 'package:iu/features/iutube/domain/entities/iutube_video_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_video_detail_entity.dart';

class GetVideoDetailModel extends GetVideoDetailEntity {
  const GetVideoDetailModel(
      {required IUTubeVideoModel super.video,
      required List<IUTubeVideoModel> super.alsoRecommended});

  GetVideoDetailModel.fromMap(DataMap map)
      : this(
          video: IUTubeVideoModel.fromMap(map["video"]),
          alsoRecommended: IUTubeVideoModel.fromMapList(
              map["also_recommended"].cast<Map<String, dynamic>>()),
        );

  factory GetVideoDetailModel.fromJson(Map<String, dynamic> json) {
    return GetVideoDetailModel.fromMap(json);
  }

  static List<GetVideoDetailModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetVideoDetailModel.fromMap(map)).toList();
  }
}
