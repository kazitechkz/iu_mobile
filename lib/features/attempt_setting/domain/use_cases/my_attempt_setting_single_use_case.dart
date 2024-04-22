import 'package:iu/core/common/models/pagination_parameter.dart';
import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/attempt_setting/domain/entities/attempt_setting_student_entity.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../interfaces/attempt_setting_interface.dart';

class MyAttemptSettingSingleUseCase extends UseCaseWithParams<PaginationData<List<AttemptSettingStudentEntity>>, PaginationParameter> {
  final AttemptSettingInterface attemptSettingInterface;
  MyAttemptSettingSingleUseCase(this.attemptSettingInterface);
  @override
  ResultFuture<PaginationData<List<AttemptSettingStudentEntity>>> call(PaginationParameter params) async {
    return await attemptSettingInterface.myAttemptSettingSingle(params);
  }
}