import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/get_video_detail_entity.dart';
import '../interface/iutube_interface.dart';
import '../parameters/get_video_detail_parameter.dart';

class GetVideoDetailCase extends UseCaseWithParams<GetVideoDetailEntity,GetVideoDetailParameter>{
  final IUTubeInterface _iuTubeInterface;
  const GetVideoDetailCase(this._iuTubeInterface);

  @override
  ResultFuture<GetVideoDetailEntity> call(GetVideoDetailParameter params) {
    return this._iuTubeInterface.getVideoDetail(params);
  }
}