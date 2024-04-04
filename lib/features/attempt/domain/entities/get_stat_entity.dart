import 'package:equatable/equatable.dart';
import 'package:iu/features/attempt/domain/entities/attempt_common_entity.dart';
import 'package:iu/features/attempt/domain/entities/attempt_entity.dart';
import 'package:iu/features/attempt/domain/entities/attempt_question_entity.dart';

class GetStatEntity extends Equatable{
  final List<AttemptQuestionEntity> attemptQuestions;
  final AttemptCommonEntity attempt;
  final AttemptEntity result;
  const GetStatEntity({
    required this.attemptQuestions,
    required this.attempt,
    required this.result
  });

  @override
  List<Object?> get props => [attemptQuestions,attempt,result];
}