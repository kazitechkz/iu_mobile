import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/career/data/models/rating_title_model.dart';

import '../../../domain/entities/career_quiz_answer_entity.dart';
import '../bloc/pass_career_drag_drop_bloc.dart';

class PassCareerAnswersWidget extends StatelessWidget {
  const PassCareerAnswersWidget(
      {super.key, required this.questionId, required this.answers});

  final List<CareerQuizAnswerEntity> answers;
  final int questionId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassCareerDragDropBloc, PassCareerDragDropState>(
        builder: (BuildContext context, PassCareerDragDropState state) {
      if (state is PassCareerDragDropSuccessState) {
        Map<int, RatingTitle> ratingTitles =
            RatingTitles.getRatingTitle(answers.length);
        return Row(
          children: [],
        );
      }
      return SizedBox();
    });
  }

  int? _getActiveAnswerId(
      Map<int, Map<int, int>> givenAnswers, int questionId, int answerId) {
    if (givenAnswers.containsKey(questionId)) {
      if (givenAnswers[questionId]!.containsKey(answerId)) {
        return givenAnswers[questionId]![answerId];
      }
    }
  }

  List<int> _getAnsweredOptions(
      Map<int, Map<int, int>> givenAnswers, int questionId) {
    if (givenAnswers.containsKey(questionId)) {
      return givenAnswers[questionId]?.keys.toList() ?? [];
    }
    return [];
  }
}
