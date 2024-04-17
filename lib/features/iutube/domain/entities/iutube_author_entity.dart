import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';

class IUTubeAuthorEntity extends Equatable {
  final int id;
  final int? imageUrl;
  final String name;
  final String? description;
  final String? instagramUrl;
  final String? vkUrl;
  final String? linkedinUrl;
  final String? facebookUrl;
  final String? tiktokUrl;
  final String? phone;
  final String? email;
  final bool isActive;
  final String? createdAt;
  final String? updatedAt;
  final FileModel? file;

  const IUTubeAuthorEntity(
      {required this.id,
      this.imageUrl,
      required this.name,
      this.description,
      this.instagramUrl,
      this.vkUrl,
      this.linkedinUrl,
      this.facebookUrl,
      this.tiktokUrl,
      this.phone,
      this.email,
      required this.isActive,
      this.createdAt,
      this.updatedAt,
      this.file});

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        name,
        description,
        instagramUrl,
        vkUrl,
        linkedinUrl,
        facebookUrl,
        tiktokUrl,
        phone,
        email,
        isActive,
        createdAt,
        updatedAt,
        file
      ];
}
