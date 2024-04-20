import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/domain/entities/appeal_entity.dart';
import 'package:iu/features/appeal/domain/interfaces/appeal_interface.dart';

import '../parameters/appeal_params.dart';

class AppealUseCase extends UseCaseWithParams<PaginationData<List<AppealEntity>>, AppealParams> {
  final AppealInterface appealInterface;
  AppealUseCase(this.appealInterface);
  @override
  ResultFuture<PaginationData<List<AppealEntity>>> call(AppealParams params) async {
    return await appealInterface.getMyAppeals(params);
  }

}