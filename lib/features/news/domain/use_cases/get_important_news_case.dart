import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/news_entity.dart';
import '../interface/news_interface.dart';

class GetImportantNewsCase extends UseCaseWithoutParams<NewsEntity> {
  final NewsInterface _newsInterface;
  const GetImportantNewsCase(this._newsInterface);

  @override
  ResultFuture<NewsEntity> call() {
    return this._newsInterface.getImportantNews();
  }
}
