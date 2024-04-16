import 'package:equatable/equatable.dart';
import 'package:iu/core/common/models/pagination_data.dart';
import 'package:iu/features/career/domain/entities/career_quiz_entity.dart';

class GetCareerQuizzesEntity extends Equatable{
  final PaginationData<List<CareerQuizEntity>> quizzes;
  final List<int> purchased;

  const GetCareerQuizzesEntity({required this.quizzes,required this.purchased});


  @override
  List<Object?> get props => [quizzes,purchased];

}