import 'package:equatable/equatable.dart';

class SubjectResultEntity extends Equatable {
  final int subjectId;
  final int right;
  final int notRight;
  final int total;
  final String point;

  const SubjectResultEntity(
      {required this.subjectId,
      required this.right,
      required this.notRight,
      required this.total,
      required this.point});

  @override
  List<Object?> get props => [subjectId, right, notRight, total];
}
