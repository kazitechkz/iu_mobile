import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
import 'package:iu/core/helpers/html_helper.dart';

import '../../../../../core/app_constants/route_constant.dart';
import '../../../../../core/helpers/mathjax_helper.dart';
import '../../../../../core/services/injection_main.container.dart';
import '../bloc/check_sub_step_exam_result_bloc.dart';
import '../bloc/sub_step_detail_bloc.dart';

Widget getSubStepContent(SubStepDetailLoaded state, BuildContext context) {
  String cleanedHtml = HtmlHelper.fixHtml(state.entity.subStepContentEntity!.text_kk);
  return RefreshIndicator(
    onRefresh: () async { sl<SubStepDetailBloc>().addEvent(GetSubStepDetailEvent(state.entity.id.toString())); },
    child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 7, right: 7, top: 5, bottom: 20),
        child: Column(
          children: [
            HtmlWidget(
                MathJaxHelper.clearText(cleanedHtml),
              customWidgetBuilder: (element) {
                if (element.localName == 'math' || element.localName == 'pre') {
                  return Math.tex(element.text);
                }
                return null;
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
    ),
  );
}

