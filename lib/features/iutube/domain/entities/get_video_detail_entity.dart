import 'package:equatable/equatable.dart';
import 'package:iu/features/iutube/domain/entities/iutube_video_entity.dart';

class GetVideoDetailEntity extends Equatable {
  final IUTubeVideoEntity video;
  final List<IUTubeVideoEntity> alsoRecommended;

  const GetVideoDetailEntity(
      {required this.video, required this.alsoRecommended});

  @override
  List<Object?> get props => [video, alsoRecommended];
}
