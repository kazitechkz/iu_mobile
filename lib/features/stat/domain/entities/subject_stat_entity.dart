import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/sub_category.dart';

class SubjectStatEntity extends Equatable {
  final int right;
  final int notRight;
  final SubCategoryEntity? subCategory;

  const SubjectStatEntity({
    required this.right,
    required this.notRight,
    this.subCategory,
  });

  @override
  List<Object?> get props => [right, notRight, subCategory];
}
