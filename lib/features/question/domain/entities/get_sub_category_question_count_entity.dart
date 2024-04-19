import 'package:equatable/equatable.dart';
import 'get_sub_category_question_count_model_options_entity.dart';

class GetSubCategoryQuestionCountEntity extends Equatable {
  final Map<int, GetSubCategoryQuestionCountModelOptionsEntity> items;

  const GetSubCategoryQuestionCountEntity(this.items);

  @override
  List<Object?> get props => [items];
}
