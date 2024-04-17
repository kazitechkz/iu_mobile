import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/forum/domain/entities/discuss_entity.dart';
import 'package:iu/features/forum/domain/entities/forum_entity.dart';

class DiscussRatingEntity extends Equatable {
  final int id;
  final int userId;
  final int? discussId;
  final int? forumId;
  final int? rating;
  final OrdinaryUserModel? user;
  final DiscussEntity? discuss;
  final ForumEntity? forum;
  final String? createdAt;
  final String? updatedAt;

  const DiscussRatingEntity(
      {required this.id,
      required this.userId,
      this.discussId,
      this.forumId,
      this.rating,
      this.user,
      this.discuss,
      this.forum,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        userId,
        discussId,
        forumId,
        rating,
        user,
        discuss,
        forum,
        createdAt,
        updatedAt
      ];
}
