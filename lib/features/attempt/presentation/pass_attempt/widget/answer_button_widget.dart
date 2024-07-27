import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:iu/core/app_constants/color_constant.dart';

import '../../../../../core/helpers/mathjax_helper.dart';

class AnswerButton extends StatelessWidget {
  final String? answer;
  final bool isChecked;
  final bool? isAlreadyAnswered;
  final Function(String) onSelected;
  final String answerType;
  const AnswerButton(
      {super.key,
      required this.answer,
      required this.isChecked,
      required this.onSelected,
      required this.answerType,
      this.isAlreadyAnswered});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isAlreadyAnswered == null ? onSelected(answerType) : (),
      child: Container(
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
      ),
    );
  }

  Border getBorderStyle() {
    if (this.isAlreadyAnswered == true) {
      return Border.all(color: ColorConstant.violetColor, width: 2);
    }
    if (this.isChecked) {
      return Border.all(color: Colors.white, width: 2);
    }
    return Border.all(color: Colors.white, width: 2);
  }

  Color getColorStyle() {
    if (this.isAlreadyAnswered == true) {
      return ColorConstant.violetColor;
    }
    if (this.isChecked) {
      return ColorConstant.darkOrangeColor;
    }
    return Colors.transparent;
  }
}
