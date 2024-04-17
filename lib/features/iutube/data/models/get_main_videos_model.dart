import 'package:equatable/equatable.dart';
import 'package:iu/features/iutube/data/models/iutube_video_model.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_main_videos_entity.dart';

class GetMainVideosModel extends GetMainVideosEntity {
  const GetMainVideosModel(
      {required List<IUTubeVideoModel> super.publicVideos,
      required List<IUTubeVideoModel> super.recommended});

  GetMainVideosModel.fromMap(DataMap map)
      : this(
          publicVideos: IUTubeVideoModel.fromMapList(
              map["public_videos"].cast<Map<String, dynamic>>()),
          recommended: IUTubeVideoModel.fromMapList(
              map["recommended"].cast<Map<String, dynamic>>()),
        );

  factory GetMainVideosModel.fromJson(Map<String, dynamic> json) {
    return GetMainVideosModel.fromMap(json);
  }

  static List<GetMainVideosModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetMainVideosModel.fromMap(map)).toList();
  }
}
