import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/ordinary_user.dart';
import 'package:iu/core/common/models/subject.dart';

class ForumEntity extends Equatable {
  final int id;
  final int userId;
  final int subjectId;
  final String text;
  final String attachment;
  final int? discussRatingSumRating;
  final SubjectEntity? subject;
  final OrdinaryUserEntity? user;
  final String? createdAt;
  final String? updatedAt;

  const ForumEntity(
      {required this.id,
      required this.userId,
      required this.subjectId,
      required this.text,
      required this.attachment,
      this.discussRatingSumRating,
      this.subject,
      this.user,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props => [
        id,
        userId,
        subjectId,
        text,
        attachment,
        discussRatingSumRating,
        subject,
        user,
        createdAt,
        updatedAt
      ];
}
