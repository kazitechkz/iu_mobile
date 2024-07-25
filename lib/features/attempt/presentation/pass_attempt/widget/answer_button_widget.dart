import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tex/flutter_tex.dart';
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
            Html(
              data: MathJaxHelper.toMathJax(answer ?? ""),
              extensions: [
                TagExtension(
                  tagsToExtend: {"pre"},
                  builder: (extensionContext) => Math.tex(
                    extensionContext.innerHtml,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                )
              ],
              style: {
                'pre': Style(color: Colors.white),
                'tex': Style(color: Colors.white),
                'p': Style(color: Colors.white),
                'b': Style(color: Colors.white),
                'li': Style(color: Colors.white),
                'h1': Style(color: Colors.white),
                'h2': Style(color: Colors.white),
                'h3': Style(color: Colors.white),
                'h4': Style(color: Colors.white),
                'h5': Style(color: Colors.white),
                'h6': Style(color: Colors.white),
                "div": Style(color: Colors.white)
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
