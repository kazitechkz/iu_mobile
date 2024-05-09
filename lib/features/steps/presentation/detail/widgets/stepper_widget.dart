import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/border/gf_border.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/types/gf_border_type.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';
import 'package:collection/collection.dart';
import '../../../../../core/services/injection_main.container.dart';
import '../../../../sub_steps/presentation/sub_step/bloc/sub_step_bloc.dart';
import '../../../../sub_steps/presentation/sub_step/screen/sub_step_screen.dart';

Widget ownStepper(BuildContext context, List<StepEntity> steps, {int activeStep = 0}) {
  activeStep = steps.length;
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: steps.mapIndexed((index, step) =>
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
                alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return FractionallySizedBox(
                                    heightFactor: 0.8,
                                    widthFactor: 1,
                                    child: BlocProvider.value(
                                      value: sl<SubStepBloc>(),
                                      child: SubStepScreen(stepID: step.id.toString()),
                                    ),
                                  );
                                },
                              );
                            },
                    child: _buildStep(step)
                )
            ),
          )).toList(),
    ),
  );
}

Widget _buildStep(StepEntity step) {
  return Column(
    children: [
      Container(
        width: 70.w,
        height: 70.w,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          // image: const DecorationImage(
          //     image: AssetImage('assets/images/thinking.webp')
          // ),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: GFBorder(
          dashedLine: const [4, 6],
          type: GFBorderType.circle,
          color: const Color(0xFF19CA4B),
          child: Image.asset(
            'assets/images/thinking.webp',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      SizedBox(
        width: 150.w,
        child: Text(step.title_ru, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center,)
      ),
      const SizedBox(height: 10,),
      SizedBox(
        width: 130.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: GFProgressBar(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            percentage: step.progress_kk!/100,
            lineHeight: 12,
            alignment: MainAxisAlignment.spaceBetween,
            // leading  : const Icon( Icons.sentiment_dissatisfied, color: GFColors.DANGER),
            // trailing: const Icon( Icons.sentiment_satisfied, color: GFColors.SUCCESS),
            backgroundColor: Colors.black26,
            progressBarColor: GFColors.INFO,
            child: Text('${step.progress_kk}%', textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 9, color: Colors.white),
            ),
          ),
        ),
      )
    ],
  );
}
