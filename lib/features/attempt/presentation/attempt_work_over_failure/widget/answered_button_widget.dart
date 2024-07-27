import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:iu/core/app_constants/color_constant.dart';

import '../../../../../core/helpers/mathjax_helper.dart';

class AnsweredButton extends StatelessWidget {
  final String? answer;
  final String answerType;
  final String? correctAnswer;
  final String? userAnswer;

  const AnsweredButton({
    super.key,
    required this.answer,
    required this.answerType,
    required this.correctAnswer,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: getColorStyle(),
          borderRadius: BorderRadius.circular(10.w),
          border: getBorderStyle()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HtmlWidget(
            textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
            MathJaxHelper.clearText(answer ?? ""),
            customWidgetBuilder: (element) {
              if (element.localName == 'math' || element.localName == 'pre') {
                return Math.tex(element.text,
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold));
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Border getBorderStyle() {
    List<String> rightAnswerList = correctAnswer?.split(",") ?? [];
    List<String> userAnswerList = userAnswer?.split(",") ?? [];
    if (userAnswerList.contains(answerType)) {
      if (rightAnswerList.contains(answerType)) {
        return Border.all(color: ColorConstant.chemistryOne, width: 2);
      } else {
        return Border.all(color: ColorConstant.redColor, width: 2);
      }
    } else {
      if (rightAnswerList.contains(answerType)) {
        return Border.all(color: ColorConstant.chemistryOne, width: 3);
      } else {
        return Border.all(color: ColorConstant.redColor, width: 2);
      }
    }
    return Border.all(color: Colors.white, width: 2);
  }

  Color getColorStyle() {
    List<String> rightAnswerList = correctAnswer?.split(",") ?? [];
    List<String> userAnswerList = userAnswer?.split(",") ?? [];
    if (userAnswerList.contains(answerType)) {
      if (rightAnswerList.contains(answerType)) {
        return ColorConstant.chemistryOne;
      } else {
        return ColorConstant.redColor;
      }
    } else {
      if (rightAnswerList.contains(answerType)) {
        return Colors.transparent;
      } else {
        return Colors.transparent;
      }
    }
    return Colors.transparent;
  }
}
