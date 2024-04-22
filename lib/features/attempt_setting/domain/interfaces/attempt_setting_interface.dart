import 'package:iu/core/common/models/pagination_parameter.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_student_entity.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_unt_entity.dart';
import 'package:iu/features/attempt_setting/domain/parameters/create_attempt_setting_params.dart';
import '../../../../core/common/models/pagination_data.dart';
import '../entities/attempt_setting_entity.dart';

abstract class AttemptSettingInterface {
  ResultFuture<AttemptSettingEntity> createAttemptSetting(CreateAttemptSettingParams params);
  ResultFuture<PaginationData<List<AttemptSettingStudentEntity>>> myAttemptSettingSingle(
      PaginationParameter parameter);
  ResultFuture<PaginationData<List<AttemptSettingUntEntity>>> myAttemptSettingUnt(
      PaginationParameter parameter);
}