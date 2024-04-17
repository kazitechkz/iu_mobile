import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/iutube_author_entity.dart';

class IUTubeAuthorModel extends IUTubeAuthorEntity {


  const IUTubeAuthorModel(
      {required super.id,
      super.imageUrl,
      required super.name,
      super.description,
      super.instagramUrl,
      super.vkUrl,
      super.linkedinUrl,
      super.facebookUrl,
      super.tiktokUrl,
      super.phone,
      super.email,
      required super.isActive,
      super.createdAt,
      super.updatedAt,
      FileModel? super.file});

  IUTubeAuthorModel.fromMap(DataMap map)
      : this(
      id:map["id"],
      imageUrl:map["image_url"],
      name:map["name"],
      description:map["description"],
      instagramUrl:map["instagram_url"],
      vkUrl:map["vk_url"],
      linkedinUrl:map["linkedin_url"],
      facebookUrl:map["facebook_url"],
      tiktokUrl:map["tiktok_url"],
      phone:map["phone"],
      email:map["email"],
      isActive:map["is_active"],
      createdAt:map["created_at"],
      updatedAt:map["updated_at"],
      file: map["file"] != null ? FileModel.fromMap(map["file"]) : null
  );

  factory IUTubeAuthorModel.fromJson(Map<String, dynamic> json) {
      return IUTubeAuthorModel.fromMap(json);
  }

  static List<IUTubeAuthorModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
      return mapList.map((map) => IUTubeAuthorModel.fromMap(map)).toList();
  }
  
}
