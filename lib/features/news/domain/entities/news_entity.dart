import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/ordinary_user.dart';

class NewsEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final int imageUrl;
  final int localeId;
  final String description;
  final bool isActive;
  final bool isImportant;
  final String? publishedAt;
  final int? publishedBy;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;
  final FileModel? poster;
  final FileModel? image;
  final LocaleModel? locale;
  final OrdinaryUserModel? user;

  const NewsEntity(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.imageUrl,
      required this.localeId,
      required this.description,
      required this.isActive,
      required this.isImportant,
      this.publishedAt,
      this.publishedBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.poster,
      this.image,
      this.locale,
      this.user});

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        imageUrl,
        localeId,
        description,
        isActive,
        isImportant,
        publishedAt,
        publishedBy,
        deletedAt,
        createdAt,
        updatedAt,
        poster,
        image,
        locale,
        user
      ];
}
