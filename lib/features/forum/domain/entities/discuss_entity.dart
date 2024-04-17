import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';

class DiscussEntity extends Equatable {
  final int id;
  final int userId;
  final int forumId;
  final String text;
  final int? discussRatingsSumRating;
  final OrdinaryUserEntity? user;
  final String? createdAt;
  final String? updatedAt;

  const DiscussEntity(
      {required this.id,
      required this.userId,
      required this.forumId,
      required this.text,
      this.discussRatingsSumRating,
      this.user,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        userId,
        forumId,
        text,
        discussRatingsSumRating,
        user,
        createdAt,
        updatedAt
      ];
}
