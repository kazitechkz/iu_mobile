import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/discuss_entity.dart';

class DiscussModel extends DiscussEntity {
  const DiscussModel(
      {required super.id,
      required super.userId,
      required super.forumId,
      required super.text,
      super.discussRatingsSumRating,
      OrdinaryUserModel? super.user,
      super.createdAt,
      super.updatedAt});

  DiscussModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          userId: map["user_id"],
          forumId: map["forum_id"],
          text: map["text"],
          discussRatingsSumRating: map["discuss_ratings_sum_rating"] != null ? int.parse(map["discuss_ratings_sum_rating"]) : 0,
          user: map["user"] != null
              ? OrdinaryUserModel.fromMap(map["user"])
              : null,
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
        );

  factory DiscussModel.fromJson(Map<String, dynamic> json) {
    return DiscussModel.fromMap(json);
  }

  static List<DiscussModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => DiscussModel.fromMap(map)).toList();
  }
}
