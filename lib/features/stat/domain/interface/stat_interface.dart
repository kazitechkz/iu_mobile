import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/stat/domain/entities/full_stat_entity.dart';
import 'package:iu/features/stat/domain/entities/stat_by_subject_id_entity.dart';
import 'package:iu/features/stat/domain/parameters/pass_sub_step_parameter.dart';

import '../entities/result_by_attempt_id_entity.dart';
import '../entities/stat_by_attempt_id_entity.dart';
import '../parameters/full_stat_parameter.dart';

abstract class StatInterface{
    ResultFuture<FullStatEntity> fullStat(FullStatParameter parameter);
    // ResultFuture<SubStepEntity> passSubStep(PassSubStepParameter parameter);
    ResultFuture<ResultByAttemptIdEntity> resultByAttemptId(int parameter);
    ResultFuture<StatByAttemptIdEntity> statByAttemptId(int parameter);
    ResultFuture<StatBySubjectIdEntity> statBySubjectId(int parameter);
}