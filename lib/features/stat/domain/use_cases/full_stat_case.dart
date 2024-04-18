import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/stat/domain/interface/stat_interface.dart';
import '../entities/full_stat_entity.dart';
import '../parameters/full_stat_parameter.dart';

class FullStatCase extends UseCaseWithParams<FullStatEntity,FullStatParameter>{
  final StatInterface _statInterface;
  const FullStatCase(this._statInterface);
  @override
  ResultFuture<FullStatEntity> call(FullStatParameter params) {
    return this._statInterface.fullStat(params);
  }

}