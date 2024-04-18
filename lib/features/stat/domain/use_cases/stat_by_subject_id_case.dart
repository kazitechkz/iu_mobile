import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import '../entities/stat_by_subject_id_entity.dart';
import '../interface/stat_interface.dart';

class StatBySubjectIdCase
    extends UseCaseWithParams<StatBySubjectIdEntity, int> {
  final StatInterface _statInterface;

  const StatBySubjectIdCase(this._statInterface);

  @override
  ResultFuture<StatBySubjectIdEntity> call(int params) {
    return this._statInterface.statBySubjectId(params);
  }
}
