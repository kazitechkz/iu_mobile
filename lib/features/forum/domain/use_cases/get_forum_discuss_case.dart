import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_forum_discuss_entity.dart';
import '../interface/forum_interface.dart';
import '../parameters/get_forum_discuss_parameter.dart';

class GetForumDiscussCase extends UseCaseWithParams<GetForumDiscussEntity,GetForumDiscussParameter>{
  final ForumInterface _forumInterface;
  const GetForumDiscussCase(this._forumInterface);

  @override
  ResultFuture<GetForumDiscussEntity> call(GetForumDiscussParameter params) {
    return this._forumInterface.getForumDiscuss(params);
  }

}