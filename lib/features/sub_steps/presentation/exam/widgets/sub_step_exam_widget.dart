import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/radio_list_tile/gf_radio_list_tile.dart';
import 'package:getwidget/types/gf_radio_type.dart';
import 'package:collection/collection.dart';
import 'package:iu/features/sub_steps/presentation/exam/bloc/radio_bloc/exam_radio_bloc.dart';
import '../../../../../core/helpers/mathjax_helper.dart';
import '../../../domain/entities/sub_step_exam_entity.dart';
import '../../../domain/parameters/pass_sub_step_exam_params.dart';

Widget getSubStepExamTests(List<SubStepExamEntity> exams) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: BlocConsumer<ExamRadioBloc, ExamRadioInitial>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
            itemCount: exams.length,
            itemBuilder: (context, index) {
              final question = exams[index];
              return _getTestCard(context, question, index, state);
            });
      },
    ),
  );
}
Widget _getTestCard(BuildContext context, SubStepExamEntity entity, int index, ExamRadioInitial state) {
  return BlocBuilder<ExamRadioBloc, ExamRadioInitial>(
    builder: (context, state) {
      String currentAnswer = (index < state.answers.length) ? state.answers[index].answer : '';

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
            activeBorderColor: Colors.green,
            focusColor: Colors.green,
            type: GFRadioType.basic,
            value: 'a',
            groupValue: currentAnswer,
            onChanged: (value) {
              _handleAnswerSelected(value, index, entity.id, context);
            },
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
            activeBorderColor: Colors.green,
            focusColor: Colors.green,
            type: GFRadioType.basic,
            value: 'b',
            groupValue: currentAnswer,
            onChanged: (value) {
              _handleAnswerSelected(value, index, entity.id, context);
            },
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
            activeBorderColor: Colors.green,
            focusColor: Colors.green,
            type: GFRadioType.basic,
            value: 'c',
            groupValue: currentAnswer,
            onChanged: (value) {
              _handleAnswerSelected(value, index, entity.id, context);
            },
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
            activeBorderColor: Colors.green,
            focusColor: Colors.green,
            type: GFRadioType.basic,
            value: 'd',
            groupValue: currentAnswer,
            onChanged: (value) {
              _handleAnswerSelected(value, index, entity.id, context);
            },
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
              activeBorderColor: Colors.green,
              focusColor: Colors.green,
              type: GFRadioType.basic,
              value: 'e',
              groupValue: currentAnswer,
              onChanged: (value) {
                _handleAnswerSelected(value, index, entity.id, context);
              },
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
              activeBorderColor: Colors.green,
              focusColor: Colors.green,
              type: GFRadioType.basic,
              value: 'f',
              groupValue: currentAnswer,
              onChanged: (value) {
                _handleAnswerSelected(value, index, entity.id, context);
              },
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
              activeBorderColor: Colors.green,
              focusColor: Colors.green,
              type: GFRadioType.basic,
              value: 'g',
              groupValue: currentAnswer,
              onChanged: (value) {
                _handleAnswerSelected(value, index, entity.id, context);
              },
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
              activeBorderColor: Colors.green,
              focusColor: Colors.green,
              type: GFRadioType.basic,
              value: 'h',
              groupValue: currentAnswer,
              onChanged: (value) {
                _handleAnswerSelected(value, index, entity.id, context);
              },
              inactiveIcon: null,
            ),
          // Другие GFRadioListTile с подобной структурой...
        ],
      );
    },
  );
}
void _handleAnswerSelected(String value, int index, int questionId, BuildContext context) {
  // Если индекс больше или равен длине списка, добавляем недостающие элементы
  if (index >= context.read<ExamRadioBloc>().state.answers.length) {
    context.read<ExamRadioBloc>().add(
        AnswerSelected(
          PassSubStepExamParams(answer: value, localeId: 1, subStepTestId: questionId), index
        )
    );
  } else {
    // Или обновляем существующий элемент
    var updatedAnswers = List<PassSubStepExamParams>.from(context.read<ExamRadioBloc>().state.answers);
    updatedAnswers[index] = PassSubStepExamParams(answer: value, localeId: 1, subStepTestId: questionId);
    context.read<ExamRadioBloc>().add(
        UpdateAnswers(updatedAnswers)
    );
  }
}
// Widget _getTestCard(BuildContext context, SubStepExamEntity entity, int index, ExamRadioInitial state) {
//   String groupValue = '';
//   return Column(
//     children: [
//       Html(
//         data: MathJaxHelper.clearText(entity.question.text),
//         extensions: [
//           TagExtension(
//             tagsToExtend: {"pre"},
//             builder: (extensionContext) =>
//                 Math.tex(extensionContext.innerHtml),
//           )
//         ],
//         style: {
//           'pre': Style(color: Colors.white),
//           'img': Style(width: Width(0.9.sw))
//         },
//       ),
//       const SizedBox(height: 20),
//       GFRadioListTile(
//         avatar: Container(
//           width: 30,
//           height: 30,
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 2),
//               shape: BoxShape.circle),
//           child: const Center(child: Text('A')),
//         ),
//         title: Html(
//           data: MathJaxHelper.clearText(entity.question.answerA),
//           extensions: [
//             TagExtension(
//               tagsToExtend: {"pre"},
//               builder: (extensionContext) =>
//                   Math.tex(extensionContext.innerHtml),
//             )
//           ],
//           style: {
//             'pre': Style(color: Colors.white),
//             'img': Style(width: Width(0.9.sw))
//           },
//         ),
//         size: 20,
//         activeBorderColor: Colors.green,
//         focusColor: Colors.green,
//         type: GFRadioType.basic,
//         value: 'a',
//         groupValue: state.answers[index]?.answer,
//         onChanged: (value) {
//           context.read<ExamRadioBloc>().add(
//             AnswerSelected(
//               PassSubStepExamParams(
//                 answer: value,
//                 localeId: 1, // Assuming a static localeId
//                 subStepTestId: entity
//                     .question_id, // Assuming each question has an id
//               ),
//             ),
//           );
//         },
//         inactiveIcon: null,
//       ),
//       GFRadioListTile(
//         avatar: Container(
//           width: 30,
//           height: 30,
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 2),
//               shape: BoxShape.circle),
//           child: const Center(child: Text('B')),
//         ),
//         title: Html(
//           data: MathJaxHelper.clearText(entity.question.answerB),
//           extensions: [
//             TagExtension(
//               tagsToExtend: {"pre"},
//               builder: (extensionContext) =>
//                   Math.tex(extensionContext.innerHtml),
//             )
//           ],
//           style: {
//             'pre': Style(color: Colors.white),
//             'img': Style(width: Width(0.9.sw))
//           },
//         ),
//         size: 20,
//         activeBorderColor: Colors.green,
//         focusColor: Colors.green,
//         type: GFRadioType.basic,
//         value: 'b',
//         groupValue: state.answers[index]?.answer,
//         onChanged: (value) {
//           context.read<ExamRadioBloc>().add(
//             AnswerSelected(
//               PassSubStepExamParams(
//                 answer: value,
//                 localeId: 1, // Assuming a static localeId
//                 subStepTestId: entity
//                     .question_id, // Assuming each question has an id
//               ),
//             ),
//           );
//         },
//         inactiveIcon: null,
//       ),
//       GFRadioListTile(
//         avatar: Container(
//           width: 30,
//           height: 30,
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 2),
//               shape: BoxShape.circle),
//           child: const Center(child: Text('C')),
//         ),
//         title: Html(
//           data: MathJaxHelper.clearText(entity.question.answerC),
//           extensions: [
//             TagExtension(
//               tagsToExtend: {"pre"},
//               builder: (extensionContext) =>
//                   Math.tex(extensionContext.innerHtml),
//             )
//           ],
//           style: {
//             'pre': Style(color: Colors.white),
//             'img': Style(width: Width(0.9.sw))
//           },
//         ),
//         size: 20,
//         activeBorderColor: Colors.green,
//         focusColor: Colors.green,
//         type: GFRadioType.basic,
//         value: 'c',
//         groupValue: state.answers[index]?.answer,
//         onChanged: (value) {
//           context.read<ExamRadioBloc>().add(
//             AnswerSelected(
//               PassSubStepExamParams(
//                 answer: value,
//                 localeId: 1, // Assuming a static localeId
//                 subStepTestId: entity
//                     .question_id, // Assuming each question has an id
//               ),
//             ),
//           );
//         },
//         inactiveIcon: null,
//       ),
//       GFRadioListTile(
//         avatar: Container(
//           width: 30,
//           height: 30,
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 2),
//               shape: BoxShape.circle),
//           child: const Center(child: Text('D')),
//         ),
//         title: Html(
//           data: MathJaxHelper.clearText(entity.question.answerD),
//           extensions: [
//             TagExtension(
//               tagsToExtend: {"pre"},
//               builder: (extensionContext) =>
//                   Math.tex(extensionContext.innerHtml),
//             )
//           ],
//           style: {
//             'pre': Style(color: Colors.white),
//             'img': Style(width: Width(0.9.sw))
//           },
//         ),
//         size: 20,
//         activeBorderColor: Colors.green,
//         focusColor: Colors.green,
//         type: GFRadioType.basic,
//         value: 'd',
//         groupValue: state.answers[index]?.answer,
//         onChanged: (value) {
//           context.read<ExamRadioBloc>().add(
//             AnswerSelected(
//               PassSubStepExamParams(
//                 answer: value,
//                 localeId: 1, // Assuming a static localeId
//                 subStepTestId: entity
//                     .question_id, // Assuming each question has an id
//               ),
//             ),
//           );
//         },
//         inactiveIcon: null,
//       ),
//       if (entity.question.answerE != null)
//         GFRadioListTile(
//           avatar: Container(
//             width: 30,
//             height: 30,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 2),
//                 shape: BoxShape.circle),
//             child: const Center(child: Text('E')),
//           ),
//           title: Html(
//             data: MathJaxHelper.clearText(entity.question.answerE!),
//             extensions: [
//               TagExtension(
//                 tagsToExtend: {"pre"},
//                 builder: (extensionContext) =>
//                     Math.tex(extensionContext.innerHtml),
//               )
//             ],
//             style: {
//               'pre': Style(color: Colors.white),
//               'img': Style(width: Width(0.9.sw))
//             },
//           ),
//           size: 20,
//           activeBorderColor: Colors.green,
//           focusColor: Colors.green,
//           type: GFRadioType.basic,
//           value: 'e',
//           groupValue: state.answers[index]?.answer,
//           onChanged: (value) {
//             context.read<ExamRadioBloc>().add(
//               AnswerSelected(
//                 PassSubStepExamParams(
//                   answer: value,
//                   localeId: 1, // Assuming a static localeId
//                   subStepTestId: entity
//                       .question_id, // Assuming each question has an id
//                 ),
//               ),
//             );
//           },
//           inactiveIcon: null,
//         ),
//       if (entity.question.answerF != null)
//         GFRadioListTile(
//           avatar: Container(
//             width: 30,
//             height: 30,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 2),
//                 shape: BoxShape.circle),
//             child: const Center(child: Text('F')),
//           ),
//           title: Html(
//             data: MathJaxHelper.clearText(entity.question.answerF!),
//             extensions: [
//               TagExtension(
//                 tagsToExtend: {"pre"},
//                 builder: (extensionContext) =>
//                     Math.tex(extensionContext.innerHtml),
//               )
//             ],
//             style: {
//               'pre': Style(color: Colors.white),
//               'img': Style(width: Width(0.9.sw))
//             },
//           ),
//           size: 20,
//           activeBorderColor: Colors.green,
//           focusColor: Colors.green,
//           type: GFRadioType.basic,
//           value: 'f',
//           groupValue: state.answers[index]?.answer,
//           onChanged: (value) {
//             context.read<ExamRadioBloc>().add(
//               AnswerSelected(
//                 PassSubStepExamParams(
//                   answer: value,
//                   localeId: 1, // Assuming a static localeId
//                   subStepTestId: entity
//                       .question_id, // Assuming each question has an id
//                 ),
//               ),
//             );
//           },
//           inactiveIcon: null,
//         ),
//       if (entity.question.answerG != null)
//         GFRadioListTile(
//           avatar: Container(
//             width: 30,
//             height: 30,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 2),
//                 shape: BoxShape.circle),
//             child: const Center(child: Text('G')),
//           ),
//           title: Html(
//             data: MathJaxHelper.clearText(entity.question.answerG!),
//             extensions: [
//               TagExtension(
//                 tagsToExtend: {"pre"},
//                 builder: (extensionContext) =>
//                     Math.tex(extensionContext.innerHtml),
//               )
//             ],
//             style: {
//               'pre': Style(color: Colors.white),
//               'img': Style(width: Width(0.9.sw))
//             },
//           ),
//           size: 20,
//           activeBorderColor: Colors.green,
//           focusColor: Colors.green,
//           type: GFRadioType.basic,
//           value: 'g',
//           groupValue: state.answers[index]?.answer,
//           onChanged: (value) {
//             context.read<ExamRadioBloc>().add(
//               AnswerSelected(
//                 PassSubStepExamParams(
//                   answer: value,
//                   localeId: 1, // Assuming a static localeId
//                   subStepTestId: entity
//                       .question_id, // Assuming each question has an id
//                 ),
//               ),
//             );
//           },
//           inactiveIcon: null,
//         ),
//       if (entity.question.answerH != null)
//         GFRadioListTile(
//           avatar: Container(
//             width: 30,
//             height: 30,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 2),
//                 shape: BoxShape.circle),
//             child: const Center(child: Text('H')),
//           ),
//           title: Html(
//             data: MathJaxHelper.clearText(entity.question.answerH!),
//             extensions: [
//               TagExtension(
//                 tagsToExtend: {"pre"},
//                 builder: (extensionContext) =>
//                     Math.tex(extensionContext.innerHtml),
//               )
//             ],
//             style: {
//               'pre': Style(color: Colors.white),
//               'img': Style(width: Width(0.9.sw))
//             },
//           ),
//           size: 20,
//           activeBorderColor: Colors.green,
//           focusColor: Colors.green,
//           type: GFRadioType.basic,
//           value: 'h',
//           groupValue: state.answers[index]?.answer,
//           onChanged: (value) {
//             context.read<ExamRadioBloc>().add(
//               AnswerSelected(
//                 PassSubStepExamParams(
//                   answer: value,
//                   localeId: 1, // Assuming a static localeId
//                   subStepTestId: entity
//                       .question_id, // Assuming each question has an id
//                 ),
//               ),
//             );
//           },
//           inactiveIcon: null,
//         ),
//     ],
//   );
// }
