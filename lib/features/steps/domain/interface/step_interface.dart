import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/auth/domain/parameters/forget_parameter.dart';
import 'package:iu/features/auth/domain/parameters/reset_parameter.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';
import 'package:iu/features/auth/domain/parameters/sign_up_parameter.dart';
import 'package:iu/features/auth/domain/parameters/verify_parameter.dart';

import '../entities/step_entity.dart';

abstract class StepInterface {
  ResultFuture<List<StepEntity>> getAll();
}
