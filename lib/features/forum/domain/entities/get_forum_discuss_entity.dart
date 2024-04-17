import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/features/forum/domain/entities/dicuss_rating_entity.dart';
import 'package:iu/features/forum/domain/entities/discuss_entity.dart';

class GetForumDiscussEntity extends Equatable{
  final PaginationData<List<DiscussEntity>> discusses;
  final List<DiscussRatingEntity> ratings;

  const GetForumDiscussEntity({
    required this.discusses,
    required this.ratings,
});

  @override
  List<Object?> get props => [discusses,ratings];
}