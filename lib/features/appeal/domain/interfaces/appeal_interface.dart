import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/appeal/domain/entities/appeal_entity.dart';
import 'package:iu/features/appeal/domain/entities/appeal_type_entity.dart';
import 'package:iu/features/appeal/domain/parameters/appeal_params.dart';
import 'package:iu/features/appeal/domain/parameters/create_appeal_params.dart';

import '../../../../core/common/models/pagination_data.dart';

abstract class AppealInterface {
  ResultFuture<List<AppealTypeEntity>> getAppealTypes();
  ResultFuture<bool> createAppeal(CreateAppealParams params);
  ResultFuture<PaginationData<List<AppealEntity>>> getMyAppeals(AppealParams params);
  ResultFuture<AppealEntity> getMyAppealById(int appealId);
}