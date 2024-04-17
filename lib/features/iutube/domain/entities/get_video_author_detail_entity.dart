import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/features/iutube/domain/entities/iutube_author_entity.dart';
import 'package:iu/features/iutube/domain/entities/iutube_video_entity.dart';

class GetVideoAuthorDetailEntity extends Equatable {
  final IUTubeAuthorEntity author;
  final PaginationData<List<IUTubeVideoEntity>> videos;

  const GetVideoAuthorDetailEntity(
      {required this.author, required this.videos});

  @override
  List<Object?> get props => [author, videos];
}
