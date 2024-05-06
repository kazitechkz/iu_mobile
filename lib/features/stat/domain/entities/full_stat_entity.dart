import 'package:equatable/equatable.dart';
import 'package:iu/features/stat/domain/entities/subject_sub_category_entity.dart';

import '../../data/models/subject_stat_model.dart';

class FullStatEntity extends Equatable{
  final Map<int,Map<String, SubjectStatModel?>>? subjects;
  final int count;
  final double? average;
  final int? min;
  final int? max;
  final int? questionQuantity;

  const FullStatEntity({
    required this.subjects, required this.count, this.average, this.min, this.max,
    this.questionQuantity
});
  @override
  List<Object?> get props => [subjects,count,average,min,max,questionQuantity];

}