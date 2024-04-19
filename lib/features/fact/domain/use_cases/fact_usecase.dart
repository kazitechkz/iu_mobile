import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/fact/domain/entities/fact_entity.dart';
import 'package:iu/features/fact/domain/interface/fact_interface.dart';

class FactUseCase extends UseCaseWithParams<FactEntity, String> {
  final FactInterface _factInterface;
  const FactUseCase(this._factInterface);

  @override
  ResultFuture<FactEntity> call(String params) {
    return _factInterface.getFact(params);
  }

}