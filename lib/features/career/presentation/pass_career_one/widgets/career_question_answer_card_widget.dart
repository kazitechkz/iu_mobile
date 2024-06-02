import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_radio_type.dart';
import 'package:iu/core/app_constants/app_constant.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../domain/entities/career_quiz_answer_entity.dart';
import '../bloc/pass_career_one_bloc.dart';

class CareerQuestionAnswerCardWidget extends StatelessWidget {
  const CareerQuestionAnswerCardWidget(
      {super.key,
      required this.questionId,
      required this.answerEntity,
      required this.type});
  final int questionId;
  final CareerQuizAnswerEntity answerEntity;
  final String type;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassCareerOneBloc, PassCareerOneState>(
      builder: (context, state) {
        if (state is PassCareerOneSuccessState) {
          return InkWell(
            onTap: () {
              _handleActiveButton(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              constraints: BoxConstraints(minHeight: 50.h),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.w),
                  border: _getValue(state) == _getGroupValue(state)
                      ? Border.all(color: Colors.white)
                      : Border.all(color: ColorConstant.peachColor),
                  color: _getValue(state) == _getGroupValue(state)
                      ? ColorConstant.peachColor
                      : ColorConstant.appBarColor),
              child: Row(
                children: [
                  GFRadio(
                    type: GFRadioType.basic,
                    size: GFSize.MEDIUM,
                    activeBorderColor: Colors.white,
                    value: _getValue(state),
                    groupValue: _getGroupValue(state),
                    onChanged: (val) {
                      _handleActiveButton(context);
                    },
                    radioColor: _getValue(state) == _getGroupValue(state)
                        ? Colors.white
                        : Colors.white,
                    activeBgColor: ColorConstant.peachColor,
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: AutoSizeText(
                      maxLines: 3,
                      answerEntity.titleRu,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }

  void _handleActiveButton(
    BuildContext context,
  ) {
    context.read<PassCareerOneBloc>().add(PassCareerOneGiveAnswerEvent(
        questionId: questionId,
        answerId: type == AppConstant.QUESTIONS_AND_ANSWERS
            ? answerEntity.id
            : answerEntity.value,
        answerValue: type == AppConstant.QUESTIONS_AND_ANSWERS
            ? answerEntity.value
            : answerEntity.id));
  }

  int _getGroupValue(PassCareerOneSuccessState state) {
    return type == AppConstant.QUESTIONS_AND_ANSWERS
        ? state.givenAnswer[questionId] ?? -1
        : state.answers[questionId] ?? -1;
  }

  int _getValue(PassCareerOneSuccessState state) {
    return type == AppConstant.QUESTIONS_AND_ANSWERS
        ? answerEntity.id
        : answerEntity.value + answerEntity.id + questionId;
  }
}
