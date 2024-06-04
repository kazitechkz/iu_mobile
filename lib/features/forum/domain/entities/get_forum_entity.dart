import 'package:equatable/equatable.dart';
import 'package:iu/features/forum/domain/entities/dicuss_rating_entity.dart';
import 'package:iu/features/forum/domain/entities/forum_entity.dart';

class GetForumEntity extends Equatable {
  final ForumEntity forum;
  final DiscussRatingEntity? rating;

  const GetForumEntity({required this.forum, required this.rating});

  @override
  List<Object?> get props => [forum,rating];

}
