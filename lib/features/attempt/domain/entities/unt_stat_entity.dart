import 'package:equatable/equatable.dart';

class UntStatEntity extends Equatable{
  final int attemptCount;
  final int attemptCountUnfinished;
  final int attemptQuestionCount;
  final int average;
  final StatByWeek statByWeek;

  const UntStatEntity({
      required this.attemptCount,
      required this.attemptCountUnfinished,
      required this.attemptQuestionCount,
      required this.average,
      required this.statByWeek,
    });

  @override
  List<Object?> get props => [attemptCount,attemptCountUnfinished,attemptQuestionCount,average,statByWeek];

}

class StatByWeek extends Equatable{
  final Map<String, String> data;

  const StatByWeek(this.data);

  @override
  List<Object?> get props => [data];
}