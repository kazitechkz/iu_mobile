import '../../../../core/common/models/file_entity.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/tech_support_file_entity.dart';

class TechSupportFileModel extends TechSupportFileEntity {
  const TechSupportFileModel(
      {required super.id,
      required super.messageId,
      required super.fileUrl,
      required FileModel super.file,
      super.createdAt,
      super.updatedAt});

  TechSupportFileModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          messageId: map["message_id"],
          fileUrl: map["file_url"],
          file: FileModel.fromMap(map["file"]),
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
        );

  factory TechSupportFileModel.fromJson(Map<String, dynamic> json) {
    return TechSupportFileModel.fromMap(json);
  }

  static List<TechSupportFileModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => TechSupportFileModel.fromMap(map)).toList();
  }
}
