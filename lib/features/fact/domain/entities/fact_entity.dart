import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/subject.dart';

class FactEntity extends Equatable {
  final int id;
  final int subjectId;
  final SubjectEntity subject;
  final String text_kk;
  final String text_ru;

  const FactEntity({required this.id, required this.subjectId, required this.subject, required this.text_kk, required this.text_ru});

  @override
  List<Object?> get props => [id, subjectId, subject, text_kk, text_ru];
}