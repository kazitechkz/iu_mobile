import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/dicuss_rating_entity.dart';
import '../interface/forum_interface.dart';
import '../parameters/rating_forum_parameter.dart';

class RatingForumCase extends UseCaseWithParams<DiscussRatingEntity,RatingForumParameter>{
  final ForumInterface _forumInterface;
  const RatingForumCase(this._forumInterface);
  @override
  ResultFuture<DiscussRatingEntity> call(RatingForumParameter params) {
    return this._forumInterface.ratingForum(params);
  }
  
}