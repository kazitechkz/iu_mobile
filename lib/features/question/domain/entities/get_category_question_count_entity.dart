import 'package:equatable/equatable.dart';

import 'get_category_question_count_model_options_entity.dart';

class GetCategoryQuestionCountEntity extends Equatable {
  final Map<int, GetCategoryQuestionCountModelOptionsEntity> items;

  const GetCategoryQuestionCountEntity(this.items);

  @override
  List<Object?> get props => [items];
}
