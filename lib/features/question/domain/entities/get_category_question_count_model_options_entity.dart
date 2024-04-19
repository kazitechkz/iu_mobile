import 'package:equatable/equatable.dart';

class GetCategoryQuestionCountModelOptionsEntity extends Equatable {
  final int singleCount;
  final int contextCount;
  final int multipleCount;

  const GetCategoryQuestionCountModelOptionsEntity({
    required this.singleCount,
    required this.contextCount,
    required this.multipleCount,
  });

  @override
  List<Object?> get props => [singleCount, contextCount, multipleCount];
}
