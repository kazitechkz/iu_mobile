import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';

import '../entities/news_entity.dart';
import '../interface/news_interface.dart';

class GetSingleNewsCase extends UseCaseWithParams<NewsEntity, String> {
  final NewsInterface _newsInterface;
  const GetSingleNewsCase(this._newsInterface);

  @override
  ResultFuture<NewsEntity> call(String params) {
    return this._newsInterface.getSingleNews(params);
  }
}
