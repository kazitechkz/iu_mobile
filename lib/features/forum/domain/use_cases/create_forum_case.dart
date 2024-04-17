import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import '../entities/forum_entity.dart';
import '../interface/forum_interface.dart';
import '../parameters/create_forum_parameter.dart';

class CreateForumCase extends UseCaseWithParams<ForumEntity,CreateForumParameter>{
  final ForumInterface _forumInterface;
  const CreateForumCase(this._forumInterface);
  @override
  ResultFuture<ForumEntity> call(CreateForumParameter params) {
    return this._forumInterface.createForum(params);
  }

}