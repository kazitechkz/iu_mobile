import 'package:equatable/equatable.dart';

import 'get_category_question_count_model_options_entity.dart';

class GetCategoryQuestionCountEntity extends Equatable {
  final Map<String, GetCategoryQuestionCountModelOptionsEntity> items;

  const GetCategoryQuestionCountEntity({required this.items});

  @override
  List<Object?> get props => [items];
}
