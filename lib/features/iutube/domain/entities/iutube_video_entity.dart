import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/file_entity.dart';
import 'package:iu/core/common/models/locale.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/iutube/domain/entities/iutube_author_entity.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';

//ADD SUBSTEPENTITY!
class IUTubeVideoEntity extends Equatable {
  final int id;
  final String alias;
  final String title;
  final String? description;
  final int? imageUrl;
  final int authorId;
  final int localeId;
  final int subjectId;
  final int? stepId;
  final int? subStepId;
  final String videoUrl;
  final int price;
  final bool isPublic;
  final bool isRecommended;
  final String? createdAt;
  final String? updatedAt;
  final IUTubeAuthorEntity? iutubeAuthor;
  final FileModel? file;
  final LocaleModel? locale;
  final SubjectEntity? subject;
  final StepEntity? step;

  // final SubStepEntity
  const IUTubeVideoEntity(
      {required this.id,
      required this.alias,
      required this.title,
      this.description,
      this.imageUrl,
      required this.authorId,
      required this.localeId,
      required this.subjectId,
      this.stepId,
      this.subStepId,
      required this.videoUrl,
      required this.price,
      required this.isPublic,
      required this.isRecommended,
      this.createdAt,
      this.updatedAt,
      this.iutubeAuthor,
      this.file,
      this.locale,
      this.subject,
      this.step});

  @override
  List<Object?> get props => [
        id,
        alias,
        title,
        description,
        imageUrl,
        authorId,
        localeId,
        subjectId,
        stepId,
        subStepId,
        videoUrl,
        videoUrl,
        price,
        isPublic,
        isRecommended,
        createdAt,
        updatedAt,
        iutubeAuthor,
        file,
        locale,
        subject,
        step
      ];
}
