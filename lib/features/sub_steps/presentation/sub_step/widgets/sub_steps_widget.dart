import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iu/features/sub_steps/domain/entities/sub_step_entity.dart';
import 'package:collection/collection.dart';

Widget subSteps(BuildContext context, List<SubStepEntity> subSteps) {
  return Column(
    children: subSteps.mapIndexed((index, step) =>
        GestureDetector(
            onTap: () => {},
            child: Text('123321')
        )).toList(),
  );
}