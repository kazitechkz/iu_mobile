import 'package:equatable/equatable.dart';
import 'package:iu/features/stat/domain/entities/subject_sub_category_entity.dart';

class FullStatEntity extends Equatable{
  final List<SubjectSubCategoryEntity>? subjects;
  final int count;
  final int? average;
  final int? min;
  final int? max;
  final int? questionQuantity;

  const FullStatEntity({
    this.subjects, required this.count, this.average, this.min, this.max,
    this.questionQuantity
});
  @override
  List<Object?> get props => [subjects,count,average,min,max,questionQuantity];

}