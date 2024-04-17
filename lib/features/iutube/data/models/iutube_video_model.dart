import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/iutube/domain/entities/iutube_author_entity.dart';
import 'package:iu/features/steps/data/models/step_model.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/iutube_video_entity.dart';
import 'iutube_author_model.dart';

//ADD SUBSTEPENTITY!
class IUTubeVideoModel extends IUTubeVideoEntity {
  // final SubStepEntity
  const IUTubeVideoModel(
      {required super.id,
      required super.alias,
      required super.title,
      super.description,
      super.imageUrl,
      required super.authorId,
      required super.localeId,
      required super.subjectId,
      super.stepId,
      super.subStepId,
      required super.videoUrl,
      required super.price,
      required super.isPublic,
      required super.isRecommended,
      super.createdAt,
      super.updatedAt,
      IUTubeAuthorModel? super.iutubeAuthor,
      FileModel? super.file,
      LocaleModel? super.locale,
      SubjectModel? super.subject,
      StepModel? super.step});

  IUTubeVideoModel.fromMap(DataMap map) : this(
      id:map["id"],
    alias:map["alias"],
    title:map["title"],
    description:map["description"],
    imageUrl:map["image_url"],
    authorId:map["author_id"],
    localeId:map["locale_id"],
    subjectId:map["subject_id"],
    stepId:map["step_id"],
    subStepId:map["sub_step_id"],
    videoUrl:map["video_url"],
    price:map["price"],
    isPublic:map["is_public"],
    isRecommended:map["is_recommended"],
    createdAt:map["created_at"],
    updatedAt:map["updated_at"],
    iutubeAuthor:map["iutube_author"] != null ? IUTubeAuthorModel.fromMap(map["iutube_author"]) : null,
    file:map["file"] != null ? FileModel.fromMap(map["file"]) : null,
    locale:map["locale"] != null ? LocaleModel.fromMap(map["locale"]) : null,
    subject:map["subject"] != null ? SubjectModel.fromMap(map["subject"]) : null,
    // step:map["step"] != null ? StepModel.fromMap(map["step"]) : null,
  );

  factory IUTubeVideoModel.fromJson(Map<String, dynamic> json) {
    return IUTubeVideoModel.fromMap(json);
  }

  static List<IUTubeVideoModel> fromMapList(
      List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => IUTubeVideoModel.fromMap(map)).toList();
  }
}
