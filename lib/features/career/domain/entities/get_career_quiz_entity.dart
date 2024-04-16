import 'package:equatable/equatable.dart';
import 'career_quiz_entity.dart';

class GetCareerQuizEntity extends Equatable {
  final CareerQuizEntity quiz;
  final bool isPurchased;

  const GetCareerQuizEntity({
    required this.quiz,
    required this.isPurchased
  });

  @override
  List<Object?> get props => [quiz, isPurchased];
}