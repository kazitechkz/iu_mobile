import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/app_constants/route_constant.dart';
import '../../../../../core/widgets/elevated_gradient_button.dart';

class AttemptResultButtons extends StatelessWidget {
  const AttemptResultButtons({super.key, required this.attemptId});
  final int attemptId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ElevatedGradientButton(
              onPressed: () {
                context.go(
                    "/${RouteConstant.statByAttemptIdName}/${attemptId.toString()}");
              },
              gradient: const LinearGradient(colors: [
                ColorConstant.darkOrangeColor,
                ColorConstant.orangeColor,
              ]),
              width: 320.w,
              height: 40.h,
              borderRadius: 20.0,
              child: AutoSizeText(
                "Статистика",
                maxLines: 1,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ElevatedGradientButton(
              onPressed: () {
                context.go(
                    "/${RouteConstant.attemptWorkOverFailureName}/${attemptId.toString()}");
              },
              gradient: const LinearGradient(colors: [
                ColorConstant.orangeColor,
                ColorConstant.darkOrangeColor,
              ]),
              width: 320.w,
              height: 40.h,
              borderRadius: 20.0,
              child: AutoSizeText(
                "Работа над ошибками",
                maxLines: 1,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
