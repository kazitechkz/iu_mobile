import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/forum/domain/interface/forum_interface.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../entities/forum_entity.dart';
import '../parameters/all_forum_parameter.dart';

class AllForumCase extends UseCaseWithParams<PaginationData<List<ForumEntity>>,AllForumParameter>{
  final ForumInterface _forumInterface;
  const AllForumCase(this._forumInterface);

  @override
  ResultFuture<PaginationData<List<ForumEntity>>> call(AllForumParameter params) {
    return this._forumInterface.allForum(params);
  }
}