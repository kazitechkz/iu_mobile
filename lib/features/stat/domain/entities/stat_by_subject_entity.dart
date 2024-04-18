import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/sub_category.dart';

class StatBySubjectEntity extends Equatable {
  final SubCategoryEntity? subCategory;
  final int subjectId;
  final int right;
  final int notRight;
  final int total;

  const StatBySubjectEntity(
      {this.subCategory,
      required this.subjectId,
      required this.right,
      required this.notRight,
      required this.total});

  @override
  List<Object?> get props => [subCategory, subjectId, right, notRight, total];
}
