import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/features/forum/data/models/discuss_model.dart';
import 'package:iu/features/forum/data/models/forum_model.dart';
import 'package:iu/features/forum/domain/entities/discuss_entity.dart';
import 'package:iu/features/forum/domain/entities/forum_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/dicuss_rating_entity.dart';

class DiscussRatingModel extends DiscussRatingEntity {
  const DiscussRatingModel(
      {required super.id,
      required super.userId,
      super.discussId,
      super.forumId,
      super.rating,
      OrdinaryUserModel? super.user,
      DiscussModel? super.discuss,
      ForumModel? super.forum,
      super.createdAt,
      super.updatedAt});
  DiscussRatingModel.fromMap(DataMap map)
      : this(
    id:map["id"],
    userId:map["user_id"],
    discussId:map["discuss_id"],
    forumId:map["forum_id"],
    rating:map["rating"],
    user:map["user"] != null ? OrdinaryUserModel.fromMap(map["user"]) : null,
    discuss:map["discuss"] != null ? DiscussModel.fromMap(map["discuss"]) : null,
    forum:map["forum"] != null ? ForumModel.fromMap(map["forum"]) : null,
    createdAt:map["created_at"],
    updatedAt:map["updated_at"],

  );

  factory DiscussRatingModel.fromJson(Map<String, dynamic> json) {
    return DiscussRatingModel.fromMap(json);
  }

  static List<DiscussRatingModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => DiscussRatingModel.fromMap(map)).toList();
  }
}
