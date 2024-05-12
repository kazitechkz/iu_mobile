import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/forum_entity.dart';

class ForumModel extends ForumEntity {
  const ForumModel(
      {required super.id,
      required super.userId,
      required super.subjectId,
      required super.text,
      required super.attachment,
      super.discussRatingSumRating,
      super.discussesCount,
      SubjectModel? super.subject,
      OrdinaryUserModel? super.user,
      super.createdAt,
      super.updatedAt});

  ForumModel.fromMap(DataMap map)
      : this(
          id: map["id"],
          userId: map["user_id"],
          subjectId: map["subject_id"],
          text: map["text"],
          attachment: map["attachment"],
          discussRatingSumRating: map["discuss_rating_sum_rating"] != null
              ? int.parse(map["discuss_rating_sum_rating"])
              : 0,
          discussesCount:
              map["discusses_count"] != null ? map["discusses_count"] : 0,
          subject: map["subject"] != null
              ? SubjectModel.fromMap(map["subject"])
              : null,
          user: map["user"] != null
              ? OrdinaryUserModel.fromMap(map["user"])
              : null,
          createdAt: map["created_at"],
          updatedAt: map["updated_at"],
        );

  factory ForumModel.fromJson(Map<String, dynamic> json) {
    return ForumModel.fromMap(json);
  }

  static List<ForumModel> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => ForumModel.fromMap(map)).toList();
  }
}
