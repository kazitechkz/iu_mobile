import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/features/forum/data/models/dicuss_rating_model.dart';
import 'package:iu/features/forum/data/models/discuss_model.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/get_forum_discuss_entity.dart';

class GetForumDiscussModel extends GetForumDiscussEntity {
  const GetForumDiscussModel({
    required PaginationData<List<DiscussModel>> super.discusses,
    required List<DiscussRatingModel> super.ratings,
  });
  GetForumDiscussModel.fromMap(DataMap map)
      : this(
      discusses:handle(map),
      ratings:DiscussRatingModel.fromMapList(map["ratings"].cast<Map<String, dynamic>>())
  );

  factory GetForumDiscussModel.fromJson(Map<String, dynamic> json) {
    return GetForumDiscussModel.fromMap(json);
  }

  static List<GetForumDiscussModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => GetForumDiscussModel.fromMap(map)).toList();
  }

  static PaginationData<List<DiscussModel>> handle(DataMap map){
    PaginationData paginationData = PaginationData.fromMap(map["discusses"]);
    List<DiscussModel> data = DiscussModel.fromMapList(paginationData.data.cast<Map<String, dynamic>>());
    final result = PaginationData.fromType(paginationData, data);
    return result;
  }
}
