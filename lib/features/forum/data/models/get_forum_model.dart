import 'package:iu/features/forum/data/models/dicuss_rating_model.dart';
import 'package:iu/features/forum/data/models/forum_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_forum_entity.dart';

class GetForumModel extends GetForumEntity {
  const GetForumModel(
      {required ForumModel super.forum,
      required DiscussRatingModel? super.rating});

  GetForumModel.fromMap(DataMap map)
      : this(
          forum: ForumModel.fromMap(map["forum"]),
          rating: map["rating"] != null ?  DiscussRatingModel.fromMap(map["rating"]) : null,
        );

  factory GetForumModel.fromJson(Map<String, dynamic> json) {
    return GetForumModel.fromMap(json);
  }

  static List<GetForumModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetForumModel.fromMap(map)).toList();
  }
}
