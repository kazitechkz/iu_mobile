import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/iutube/domain/interface/iutube_interface.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../entities/iutube_video_entity.dart';
import '../parameters/get_all_videos_parameter.dart';

class GetAllVideosCase extends UseCaseWithParams<PaginationData<List<IUTubeVideoEntity>>,GetAllVideosParameter>{
  final IUTubeInterface _iuTubeInterface;
  const GetAllVideosCase(this._iuTubeInterface);

  @override
  ResultFuture<PaginationData<List<IUTubeVideoEntity>>> call(GetAllVideosParameter params) {
    return this._iuTubeInterface.getAllVideos(params);
  }

}