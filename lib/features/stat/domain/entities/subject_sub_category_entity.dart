import 'package:equatable/equatable.dart';
import 'package:iu/features/stat/domain/entities/subject_stat_entity.dart';

class SubjectSubCategoryEntity extends Equatable{
  final Map<String, Map<String, SubjectStatEntity?>> data;
  SubjectSubCategoryEntity({required this.data});
  @override
  List<Object?> get props => [data];
}