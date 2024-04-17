import 'package:equatable/equatable.dart';

import 'iutube_video_entity.dart';

class GetMainVideosEntity extends Equatable {
  final List<IUTubeVideoEntity> recommended;
  final List<IUTubeVideoEntity> publicVideos;

  const GetMainVideosEntity(
      {required this.publicVideos, required this.recommended});

  @override
  List<Object?> get props => [recommended, publicVideos];
}
