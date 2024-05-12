import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/alert/gf_alert.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_progress_type.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';
import 'package:collection/collection.dart';
import 'package:iu/features/sub_steps/presentation/sub_step/bloc/sub_step_bloc.dart';

import '../../../../../core/services/injection_main.container.dart';

Widget subSteps(BuildContext context, List<SubStepEntity> subSteps) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7.0),
      child: Column(
        children:
        subSteps.mapIndexed((index, step) =>
            GestureDetector(
                onTap: () {
                  if (step.isFree) {
                    context.goNamed(RouteConstant.subStepDetailScreenName,
                        pathParameters: {'subStepID': step.id.toString()});
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const GFAlert(
                            title: 'Welcome !',
                            content:
                                'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
                          );
                        });
                  }
                },
                child: ListTile(
                    title: Text(step.titleKk, style: const TextStyle(fontSize: 20),),
                    leading: SizedBox(
                      width: 50,
                      child: step.isFree ? GFProgressBar(
                          percentage: step.progressKk!/100,
                          circleWidth: 3,
                          radius: 50,
                          type: GFProgressType.circular,
                          progressBarColor: GFColors.SUCCESS,
                          child: Center(
                            child: Text('${step.progressKk}%', textAlign: TextAlign.end,
                              style: const TextStyle(fontSize: 10, color: Colors.black),
                            ),
                        ),
                      ) : const Icon(Icons.lock),
                    ),
                    trailing: GestureDetector(
                        onTap: () {
                          if (step.isFree) {
                            print(step.progressKk);
                            // context.goNamed(RouteConstant.subStepDetailScreenName, pathParameters: {'subStepID': step.id.toString()});
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const GFAlert(
                                    title: 'Welcome !',
                                    content: 'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
                                  );
                                }
                            );
                          }
                        },
                        child: const Icon(Icons.chevron_right)
                    ),
                )
            )).toList(),
      ),
    ),
  );
}