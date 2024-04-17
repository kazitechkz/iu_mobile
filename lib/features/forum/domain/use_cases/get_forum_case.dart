import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_forum_entity.dart';
import '../interface/forum_interface.dart';

class GetForumCase extends UseCaseWithParams<GetForumEntity,int>{
  final ForumInterface _forumInterface;
  const GetForumCase(this._forumInterface);

  @override
  ResultFuture<GetForumEntity> call(int params) {
    return this._forumInterface.getForum(params);
  }

}