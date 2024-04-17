import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_video_author_detail_entity.dart';
import '../interface/iutube_interface.dart';
import '../parameters/get_video_author_detail_parameter.dart';

class GetVideoAuthorCase extends UseCaseWithParams<GetVideoAuthorDetailEntity,GetVideoAuthorDetailParameter>{
  final IUTubeInterface _iuTubeInterface;
  const GetVideoAuthorCase(this._iuTubeInterface);
  @override
  ResultFuture<GetVideoAuthorDetailEntity> call(GetVideoAuthorDetailParameter params) {
    return this._iuTubeInterface.getVideoAuthor(params);
  }

}