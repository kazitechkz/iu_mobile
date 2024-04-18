import 'package:iu/core/usecases/use_case.dart';
import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/news/domain/interface/news_interface.dart';

import '../../../../core/common/models/pagination_data.dart';
import '../entities/news_entity.dart';
import '../parameters/all_news_parameter.dart';

class AllNewsCase extends UseCaseWithParams<PaginationData<List<NewsEntity>>,
    AllNewsParameter> {
  final NewsInterface _newsInterface;
  const AllNewsCase(this._newsInterface);

  @override
  ResultFuture<PaginationData<List<NewsEntity>>> call(AllNewsParameter params) {
    return this._newsInterface.allNews(params);
  }
}
