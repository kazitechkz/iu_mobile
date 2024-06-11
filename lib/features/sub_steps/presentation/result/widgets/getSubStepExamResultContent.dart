import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/radio_list_tile/gf_radio_list_tile.dart';
import 'package:getwidget/types/gf_radio_type.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_result_exam_entity.dart';

import '../../../../../core/helpers/mathjax_helper.dart';
import '../../../domain/entities/sub_step_exam_entity.dart';

Widget getSubStepExamResultContent(SubStepExamResultEntity exams, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ListView(
      children: [
        _getAdditionalCard(exams.isRight, exams.count),
        ...exams.subStepExamEntity.asMap().entries.map((entry) {
          int index = entry.key;
          var question = entry.value;
          return _getTestCard(context, question, index);
        }),
      ],
    ),
  );
}

Widget _getAdditionalCard(int isRight, int count) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text('$isRight / $count', style: const TextStyle(fontSize: 20),)),
    ),
  );
}

Widget _getTestCard(BuildContext context, SubStepExamEntity entity, int index) {
  final colorRadio = entity.result != null ? (entity.result!.isRight ? Colors.green : Colors.red) : Colors.black;
  final groupValue = entity.result != null ? entity.result!.answer : '';
  return Column(
    children: [
      Html(
        data: MathJaxHelper.clearText(entity.question.text),
        extensions: [
          TagExtension(
            tagsToExtend: {"pre"},
            builder: (extensionContext) =>
                Math.tex(extensionContext.innerHtml),
          )
        ],
        style: {
          'pre': Style(color: Colors.white),
          'img': Style(width: Width(0.9.sw))
        },
      ),
      const SizedBox(height: 20),
      GFRadioListTile(
        avatar: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black,
                  width: 2
              ),
              shape: BoxShape.circle
          ),
          child: const Center(child: Text('A')),
        ),
        title: Html(
          data: MathJaxHelper.clearText(entity.question.answerA),
          extensions: [
            TagExtension(
              tagsToExtend: {"pre"},
              builder: (extensionContext) =>
                  Math.tex(extensionContext.innerHtml),
            )
          ],
          style: {
            'pre': Style(color: Colors.white),
            'img': Style(width: Width(0.9.sw))
          },
        ),
        size: 20,
        activeBorderColor: colorRadio,
        focusColor: colorRadio,
        radioColor: colorRadio,
        type: GFRadioType.basic,
        value: 'a',
        groupValue: groupValue,
        onChanged: (value) {},
        inactiveIcon: null,
      ),
      GFRadioListTile(
        avatar: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black,
                  width: 2
              ),
              shape: BoxShape.circle
          ),
          child: const Center(child: Text('B')),
        ),
        title: Html(
          data: MathJaxHelper.clearText(entity.question.answerB),
          extensions: [
            TagExtension(
              tagsToExtend: {"pre"},
              builder: (extensionContext) =>
                  Math.tex(extensionContext.innerHtml),
            )
          ],
          style: {
            'pre': Style(color: Colors.white),
            'img': Style(width: Width(0.9.sw))
          },
        ),
        size: 20,
        activeBorderColor: colorRadio,
        focusColor: colorRadio,
        radioColor: colorRadio,
        type: GFRadioType.basic,
        value: 'b',
        groupValue: groupValue,
        onChanged: (value) {},
        inactiveIcon: null,
      ),
      GFRadioListTile(
        avatar: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black,
                  width: 2
              ),
              shape: BoxShape.circle
          ),
          child: const Center(child: Text('C')),
        ),
        title: Html(
          data: MathJaxHelper.clearText(entity.question.answerC),
          extensions: [
            TagExtension(
              tagsToExtend: {"pre"},
              builder: (extensionContext) =>
                  Math.tex(extensionContext.innerHtml),
            )
          ],
          style: {
            'pre': Style(color: Colors.white),
            'img': Style(width: Width(0.9.sw))
          },
        ),
        size: 20,
        activeBorderColor: colorRadio,
        radioColor: colorRadio,
        focusColor: colorRadio,
        type: GFRadioType.basic,
        value: 'c',
        groupValue: groupValue,
        onChanged: (value) {},
        inactiveIcon: null,
      ),
      GFRadioListTile(
        avatar: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black,
                  width: 2
              ),
              shape: BoxShape.circle
          ),
          child: const Center(child: Text('D')),
        ),
        title: Html(
          data: MathJaxHelper.clearText(entity.question.answerD),
          extensions: [
            TagExtension(
              tagsToExtend: {"pre"},
              builder: (extensionContext) =>
                  Math.tex(extensionContext.innerHtml),
            )
          ],
          style: {
            'pre': Style(color: Colors.white),
            'img': Style(width: Width(0.9.sw))
          },
        ),
        size: 20,
        activeBorderColor: colorRadio,
        focusColor: colorRadio,
        radioColor: colorRadio,
        type: GFRadioType.basic,
        value: 'd',
        groupValue: groupValue,
        onChanged: (value) {},
        inactiveIcon: null,
      ),
      if (entity.question.answerE != null)
        GFRadioListTile(
          avatar: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 2
                ),
                shape: BoxShape.circle
            ),
            child: const Center(child: Text('E')),
          ),
          title: Html(
            data: MathJaxHelper.clearText(entity.question.answerE!),
            extensions: [
              TagExtension(
                tagsToExtend: {"pre"},
                builder: (extensionContext) =>
                    Math.tex(extensionContext.innerHtml),
              )
            ],
            style: {
              'pre': Style(color: Colors.white),
              'img': Style(width: Width(0.9.sw))
            },
          ),
          size: 20,
          activeBorderColor: colorRadio,
          focusColor: colorRadio,
          radioColor: colorRadio,
          type: GFRadioType.basic,
          value: 'e',
          groupValue: groupValue,
          onChanged: (value) {},
          inactiveIcon: null,
        ),
      if (entity.question.answerF != null)
        GFRadioListTile(
          avatar: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 2
                ),
                shape: BoxShape.circle
            ),
            child: const Center(child: Text('F')),
          ),
          title: Html(
            data: MathJaxHelper.clearText(entity.question.answerF!),
            extensions: [
              TagExtension(
                tagsToExtend: {"pre"},
                builder: (extensionContext) =>
                    Math.tex(extensionContext.innerHtml),
              )
            ],
            style: {
              'pre': Style(color: Colors.white),
              'img': Style(width: Width(0.9.sw))
            },
          ),
          size: 20,
          activeBorderColor: colorRadio,
          focusColor: colorRadio,
          radioColor: colorRadio,
          type: GFRadioType.basic,
          value: 'f',
          groupValue: groupValue,
          onChanged: (value) {},
          inactiveIcon: null,
        ),
      if (entity.question.answerG != null)
        GFRadioListTile(
          avatar: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 2
                ),
                shape: BoxShape.circle
            ),
            child: const Center(child: Text('G')),
          ),
          title: Html(
            data: MathJaxHelper.clearText(entity.question.answerG!),
            extensions: [
              TagExtension(
                tagsToExtend: {"pre"},
                builder: (extensionContext) =>
                    Math.tex(extensionContext.innerHtml),
              )
            ],
            style: {
              'pre': Style(color: Colors.white),
              'img': Style(width: Width(0.9.sw))
            },
          ),
          size: 20,
          activeBorderColor: colorRadio,
          focusColor: colorRadio,
          radioColor: colorRadio,
          type: GFRadioType.basic,
          value: 'g',
          groupValue: groupValue,
          onChanged: (value) {},
          inactiveIcon: null,
        ),
      if (entity.question.answerH != null)
        GFRadioListTile(
          avatar: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 2
                ),
                shape: BoxShape.circle
            ),
            child: const Center(child: Text('H')),
          ),
          title: Html(
            data: MathJaxHelper.clearText(entity.question.answerH!),
            extensions: [
              TagExtension(
                tagsToExtend: {"pre"},
                builder: (extensionContext) =>
                    Math.tex(extensionContext.innerHtml),
              )
            ],
            style: {
              'pre': Style(color: Colors.white),
              'img': Style(width: Width(0.9.sw))
            },
          ),
          size: 20,
          activeBorderColor: colorRadio,
          focusColor: colorRadio,
          radioColor: colorRadio,
          type: GFRadioType.basic,
          value: 'h',
          groupValue: groupValue,
          onChanged: (value) {},
          inactiveIcon: null,
        ),
      // Другие GFRadioListTile с подобной структурой...
    ],
  );
}