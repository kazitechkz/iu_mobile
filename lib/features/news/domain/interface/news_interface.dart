import 'package:iu/core/utils/typedef.dart';
import 'package:iu/features/news/domain/entities/news_entity.dart';
import 'package:iu/features/news/domain/parameters/all_news_parameter.dart';

import '../../../../core/common/models/pagination_data.dart';

abstract class NewsInterface {
  ResultFuture<PaginationData<List<NewsEntity>>> allNews(
      AllNewsParameter parameter);
  ResultFuture<NewsEntity> getImportantNews();
  ResultFuture<NewsEntity> getSingleNews(String parameter);
}
