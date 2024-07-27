import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/career/presentation/pass_career_drag_drop/widgets/pass_career_answers_widget.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../domain/entities/career_quiz_answer_entity.dart';
import '../../../domain/entities/career_quiz_question_entity.dart';

class PassCareerContainerWidget extends StatelessWidget {
  const PassCareerContainerWidget(
      {super.key, required this.careerQuestionEntity, required this.answers});

  final CareerQuizQuestionEntity? careerQuestionEntity;
  final List<CareerQuizAnswerEntity> answers;

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
                PassCareerAnswersWidget(
                    questionId: careerQuestionEntity?.id ?? 0, answers: answers)
              ],
            )
          : SizedBox(),
    );
  }
}
