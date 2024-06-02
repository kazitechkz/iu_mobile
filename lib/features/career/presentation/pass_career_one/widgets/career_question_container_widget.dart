import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/color_constant.dart';

import '../../../domain/entities/career_quiz_answer_entity.dart';
import '../../../domain/entities/career_quiz_entity.dart';
import '../../../domain/entities/career_quiz_question_entity.dart';
import 'career_question_answer_card_widget.dart';

class CareerQuestionContainerWidget extends StatelessWidget {
  const CareerQuestionContainerWidget(
      {super.key,
      this.careerQuestionEntity,
      required this.answers,
      required this.type});
  final CareerQuizQuestionEntity? careerQuestionEntity;
  final List<CareerQuizAnswerEntity> answers;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        border: Border.all(color: ColorConstant.peachColor),
      ),
      child: careerQuestionEntity != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  textAlign: TextAlign.center,
                  "${careerQuestionEntity?.questionRu}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ...answers
                    .map((answer) => CareerQuestionAnswerCardWidget(
                          questionId: careerQuestionEntity?.id ?? 0,
                          answerEntity: answer,
                          type: type,
                        ))
                    .toList()
              ],
            )
          : SizedBox(),
    );
  }
}
