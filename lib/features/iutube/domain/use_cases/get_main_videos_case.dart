import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_main_videos_entity.dart';
import '../interface/iutube_interface.dart';

class GetMainVideosCase extends UseCaseWithoutParams<GetMainVideosEntity>{
  final IUTubeInterface _iuTubeInterface;
  const GetMainVideosCase(this._iuTubeInterface);

  @override
  ResultFuture<GetMainVideosEntity> call() {
    return this._iuTubeInterface.getMainVideos();
  }


}