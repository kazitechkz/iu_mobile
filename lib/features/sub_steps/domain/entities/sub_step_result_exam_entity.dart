import 'package:equatable/equatable.dart';

class SubStepExamResultEntity extends Equatable {
  final int id;
  final bool is_right;
  final String user_answer;

  const SubStepExamResultEntity({required this.id, required this.is_right, required this.user_answer});
  @override
  List<Object?> get props => [id, is_right, user_answer];
}