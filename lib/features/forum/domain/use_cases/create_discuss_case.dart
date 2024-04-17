import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import '../entities/discuss_entity.dart';
import '../interface/forum_interface.dart';
import '../parameters/create_discuss_parameter.dart';

class CreateDiscussCase extends UseCaseWithParams<DiscussEntity,CreateDiscussParameter>{
  final ForumInterface _forumInterface;
  const CreateDiscussCase(this._forumInterface);

  @override
  ResultFuture<DiscussEntity> call(CreateDiscussParameter params) {
    return this._forumInterface.createDiscuss(params);
  }

}