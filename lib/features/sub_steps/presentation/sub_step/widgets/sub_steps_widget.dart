import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/types/gf_progress_type.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';
import 'package:collection/collection.dart';

import '../../../../../core/services/injection_main.container.dart';
import '../bloc/sub_step_bloc.dart';
import '../screen/sub_step_screen.dart';

Widget subSteps(context, List<SubStepEntity> subSteps) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7.0),
      child: Column(
        children:
        subSteps.mapIndexed((index, step) =>
            GestureDetector(
                onTap: () => {},
                child: ListTile(
                    title: Text(step.titleKk, style: const TextStyle(fontSize: 20),),
                    leading: SizedBox(
                      width: 50,
                      child: GFProgressBar(
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
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                )
            )).toList(),
      ),
    ),
  );
}