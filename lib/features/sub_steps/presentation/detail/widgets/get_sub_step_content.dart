import 'package:html/dom.dart' as dom;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' show parseFragment;
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_constants/route_constant.dart';
import '../../../../../core/helpers/mathjax_helper.dart';
import '../bloc/check_sub_step_exam_result_bloc.dart';
import '../bloc/sub_step_detail_bloc.dart';

Widget getSubStepContent(SubStepDetailLoaded state, BuildContext context) {
  String cleanedHtml = fixHtml(state.entity.subStepContentEntity!.text_kk);
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(
          left: 7, right: 7, top: 5, bottom: 20),
      child: Column(
        children: [
          Html(
            data: MathJaxHelper.clearText(
                cleanedHtml),
            shrinkWrap: true,
            extensions: [
              TagExtension(
                tagsToExtend: {"pre"},
                builder: (extensionContext) =>
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.black12,
                        child: Math.tex(
                          extensionContext.innerHtml,
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
              ),
              TagWrapExtension(
                  tagsToWrap: {"table"},
                  builder: (child) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: child,
                    );
                  }),
            ],
            onLinkTap: (url, _, __) {
              debugPrint("Opening $url...");
            },
            onCssParseError: (css, messages) {
              debugPrint("css that errored: $css");
              debugPrint("error messages:");
              for (var element in messages) {
                debugPrint(element.toString());
              }
              return '';
            },
            style: {
              'pre': Style(color: Colors.white),
              'img': Style(width: Width(0.9.sw)),
              'p': Style(width: Width(0.9.sw)),
              "table": Style(
                height: Height.auto(),
                width: Width.auto(),
              ),
              "tr": Style(
                height: Height.auto(),
                width: Width.auto(),
              ),
              "th": Style(
                padding: HtmlPaddings.all(6),
                height: Height.auto(),
                border: const Border(
                  left: BorderSide(color: Colors.black, width: 0.5),
                  bottom: BorderSide(color: Colors.black, width: 0.5),
                  top: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              "td": Style(
                padding: HtmlPaddings.all(6),
                height: Height.auto(),
                border: const Border(
                  left: BorderSide(color: Colors.black, width: 0.5),
                  bottom: BorderSide(color: Colors.black, width: 0.5),
                  top: BorderSide(color: Colors.black, width: 0.5),
                  right: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              "col": Style(
                height: Height.auto(),
                width: Width.auto(),
              ),
            },
          ),
          SizedBox(height: 10.h,),
          BlocBuilder<CheckSubStepExamResultBloc, CheckSubStepExamResultState>(
            builder: (context, checkState) {
              if (checkState is CheckResultLoaded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (checkState.result)
                      GFButton(
                        onPressed: () {
                          context.goNamed(RouteConstant
                              .subStepExamResultScreenName, pathParameters: {
                            'subStepID': state.entity.id.toString(),
                            'localeID': '1'
                          });
                        },
                        text: "Просмотреть результат",
                        shape: GFButtonShape.pills,
                        size: GFSize.LARGE,
                      ),
                    SizedBox(width: 5.w,),
                    checkState.result ? GFButton(
                      onPressed: () {
                        context.goNamed(RouteConstant.subStepExamScreenName,
                            pathParameters: {
                              'subStepID': state.entity.id.toString(),
                              'localeID': '1'
                            });
                      },
                      text: "Пройти снова",
                      shape: GFButtonShape.pills,
                      color: GFColors.SUCCESS,
                      size: GFSize.LARGE,
                    ) : GFButton(
                      onPressed: () {
                        context.goNamed(RouteConstant.subStepExamScreenName,
                            pathParameters: {
                              'subStepID': state.entity.id.toString(),
                              'localeID': '1'
                            });
                      },
                      text: "Начать тест",
                      shape: GFButtonShape.pills,
                      color: GFColors.SUCCESS,
                      size: GFSize.LARGE,
                    ),
                  ],
                );
              }
              return const Center(child: GFLoader(
                  type: GFLoaderType.ios
              ));
            },
          )
        ],
      ),
    ),
  );
}

String fixHtml(String html) {
  var inputHtml = parseFragment(html);

  // Заменяем все <p> внутри <th> и <td> на <span>
  inputHtml.querySelectorAll("th p, td p").forEach((element) {
    element.replaceWith(replaceElementWithTag(element, "span"));
  });

  // Перемещаем все <li> внутри <th> и <td> в <span>
  inputHtml.querySelectorAll("th > ul > li, th > ol > li, td > ul > li, td > ol > li").forEach((element) {
    element.replaceWith(replaceElementWithTag(element, "span"));
  });

  // Перемещаем все <ul> и <ol> внутри <th> и <td> в <span>
  inputHtml.querySelectorAll("th > ul, th > ol, td > ul, td > ol").forEach((element) {
    element.replaceWith(replaceElementWithTag(element, "span"));
  });

  return inputHtml.outerHtml;
}

dom.Element replaceElementWithTag(dom.Element element, String replacement) {
  var newElement = dom.Element.tag(replacement);
  newElement.innerHtml = element.innerHtml;
  return newElement;
}