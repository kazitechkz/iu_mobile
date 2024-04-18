import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel(
      {required super.id,
      required super.title,
      required super.subtitle,
      required super.imageUrl,
      required super.localeId,
      required super.description,
      required super.isActive,
      required super.isImportant,
      super.publishedAt,
      super.publishedBy,
      super.deletedAt,
      super.createdAt,
      super.updatedAt,
      FileModel? super.poster,
      FileModel? super.image,
      LocaleModel? super.locale,
      OrdinaryUserModel? super.user});

  NewsModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          title: map["title"],
          subtitle: map["subtitle"],
          imageUrl: map["image_url"],
          localeId: map["locale_id"],
          description: map["description"],
          isActive: map["is_active"],
          isImportant: map["is_important"],
          publishedAt: map["published_at"],
          publishedBy: map["published_by"],
          deletedAt: map["deleted_at"],
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
          poster:
              map["poster"] != null ? FileModel.fromMap(map["poster"]) : null,
          image: map["image"] != null ? FileModel.fromMap(map["image"]) : null,
          locale:
              map["locale"] != null ? LocaleModel.fromMap(map["locale"]) : null,
          user: map["user"] != null
              ? OrdinaryUserModel.fromMap(map["user"])
              : null,
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel.fromMap(json);
  }

  static List<NewsModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => NewsModel.fromMap(map)).toList();
  }
}
