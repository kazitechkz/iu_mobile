import 'package:equatable/equatable.dart';

import '../../../../core/common/models/file_entity.dart';

class TechSupportFileEntity extends Equatable {
  final int id;
  final int messageId;
  final int fileUrl;
  final FileEntity file;
  final String? createdAt;
  final String? updatedAt;

  const TechSupportFileEntity(
      {required this.id,
      required this.messageId,
      required this.fileUrl,
      required this.file,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props =>
      [id, messageId, fileUrl, file, createdAt, updatedAt];
}
