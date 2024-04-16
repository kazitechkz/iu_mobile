import 'package:equatable/equatable.dart';
import 'career_quiz_group_entity.dart';


class GetCareerQuizGroupListEntity extends Equatable{
  final List<CareerQuizGroupEntity> group;
  final List<int> purchased;

  const GetCareerQuizGroupListEntity({required this.group, required this.purchased});

  @override
  List<Object?> get props => [group,purchased];
}