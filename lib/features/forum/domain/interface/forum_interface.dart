import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/forum/domain/entities/dicuss_rating_entity.dart';
import 'package:iu/features/forum/domain/entities/forum_entity.dart';
import 'package:iu/features/forum/domain/entities/get_forum_discuss_entity.dart';
import 'package:iu/features/forum/domain/entities/get_forum_entity.dart';
import 'package:iu/features/forum/domain/parameters/all_forum_parameter.dart';
import 'package:iu/features/forum/domain/parameters/create_discuss_parameter.dart';
import 'package:iu/features/forum/domain/parameters/create_forum_parameter.dart';
import 'package:iu/features/forum/domain/parameters/rating_forum_parameter.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../entities/discuss_entity.dart';
import '../parameters/get_forum_discuss_parameter.dart';

abstract class ForumInterface{
  ResultFuture<PaginationData<List<ForumEntity>>> allForum(AllForumParameter parameter);
  ResultFuture<DiscussEntity> createDiscuss(CreateDiscussParameter parameter);
  ResultFuture<ForumEntity> createForum(CreateForumParameter parameter);
  ResultFuture<GetForumEntity> getForum(int parameter);
  ResultFuture<GetForumDiscussEntity> getForumDiscuss(GetForumDiscussParameter parameter);
  ResultFuture<DiscussRatingEntity> ratingForum(RatingForumParameter parameter);
}