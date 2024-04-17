import 'package:iu/core/utils/typedef.dart';

class RatingForumParameter {
  final int rating;
  final int? forum_id;
  final int? discuss_id;

  const RatingForumParameter(
      {required this.rating, this.forum_id, this.discuss_id});

  DataMap toMap() {
    DataMap map = {
      "rating": rating.toString(),
    };
    if (forum_id != null) {
      map["forum_id"] = forum_id.toString();
    }
    if (discuss_id != null) {
      map["discuss_id"] = discuss_id.toString();
    }
    return map;
  }
}
