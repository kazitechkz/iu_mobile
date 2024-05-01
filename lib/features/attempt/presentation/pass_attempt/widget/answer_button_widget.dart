import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:iu/core/app_constants/color_constant.dart';

import '../../../../../core/helpers/mathjax_helper.dart';

class AnswerButton extends StatelessWidget {
  final String? answer;
  final bool isChecked;
  final Function(String) onSelected;
  const AnswerButton(
      {super.key, required this.answer, required this.isChecked,required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isChecked ? ColorConstant.orangeColorDark : Colors.transparent,
          borderRadius: BorderRadius.circular(10.w),
          border: isChecked
              ? Border.all(color: ColorConstant.orangeColorDark, width: 2)
              : Border.all(color: Colors.white, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TeXView(
            loadingWidgetBuilder:(context) => const Center(
              child: CircularProgressIndicator(),
            ),
              renderingEngine: const TeXViewRenderingEngine.mathjax(),
              child: TeXViewColumn(children: [
                TeXViewInkWell(
                  onTap: (answerType)=>onSelected(answerType),
                    child:
                        TeXViewDocument(MathJaxHelper.toMathJax(answer ?? "")),
                    style: TeXViewStyle(
                        contentColor: Colors.white,
                        fontStyle: TeXViewFontStyle(
                            fontWeight: TeXViewFontWeight.bold)),
                    id: answer.toString())
              ])),
        ],
      ),
    );
  }
}
