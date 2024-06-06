import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/helpers/html_helper.dart';
import '../../../../../core/helpers/mathjax_helper.dart';
import '../../../../attempt/domain/entities/question_entity.dart';

Widget getQuestionCard(BuildContext context, QuestionEntity entity, int index) {
  String cleanedHtml = HtmlHelper.fixHtml(entity.text);
  String numberQuestion = (index + 1).toString();
  return Container(
      margin: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorConstant.darkOrangeColor,
                ColorConstant.appBarColor,
              ])
      ),
    child: ListTile(
      leading: Text(numberQuestion, style: const TextStyle(color: Colors.white)),
      title: HtmlWidget(
        MathJaxHelper.clearText(cleanedHtml),
        textStyle: const TextStyle(color: Colors.white),
        customWidgetBuilder: (element) {
          if (element.localName == 'math' || element.localName == 'pre') {
            return Math.tex(element.text, textStyle: const TextStyle(color: Colors.white));
          }
          return null;
        },
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('A:', style: TextStyle(color: Colors.white)),
              HtmlWidget(entity.answerA, textStyle: const TextStyle(color: Colors.white),
                  customWidgetBuilder: (element) {
                    if (element.localName == 'math' || element.localName == 'pre') {
                      return Math.tex(element.text, textStyle: const TextStyle(color: Colors.white));
                    }
                    return null;
                  })
            ],
          ),
          Row(
            children: [
              const Text('B:', style: TextStyle(color: Colors.white)),
              HtmlWidget(entity.answerB, textStyle: const TextStyle(color: Colors.white),
                  customWidgetBuilder: (element) {
                    if (element.localName == 'math' || element.localName == 'pre') {
                      return Math.tex(element.text, textStyle: const TextStyle(color: Colors.white));
                    }
                    return null;
                  })
            ],
          ),
          Row(
            children: [
              const Text('C:', style: TextStyle(color: Colors.white)),
              HtmlWidget(entity.answerC, textStyle: const TextStyle(color: Colors.white),
                  customWidgetBuilder: (element) {
                    if (element.localName == 'math' || element.localName == 'pre') {
                      return Math.tex(element.text, textStyle: const TextStyle(color: Colors.white));
                    }
                    return null;
                  })
            ],
          ),
          Row(
            children: [
              const Text('D:', style: TextStyle(color: Colors.white)),
              HtmlWidget(entity.answerD, textStyle: const TextStyle(color: Colors.white),
                  customWidgetBuilder: (element) {
                    if (element.localName == 'math' || element.localName == 'pre') {
                      return Math.tex(element.text, textStyle: const TextStyle(color: Colors.white));
                    }
                    return null;
                  })
            ],
          )
        ],
      ),
    ),
  );
}