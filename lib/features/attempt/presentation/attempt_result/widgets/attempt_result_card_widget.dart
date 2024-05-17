import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/types/gf_progress_type.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/str_helper.dart';

import '../../../domain/entities/attempt_entity.dart';

class AttemptResultCardWidget extends StatelessWidget {
  const AttemptResultCardWidget({super.key, required this.attemptEntity});

  final AttemptEntity attemptEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      constraints: BoxConstraints(
        minHeight: 320.h,
      ),
      decoration: BoxDecoration(
          color: ColorConstant.bottomBarColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 240.h,
            child: GFProgressBar(
              circleWidth: 20,
              percentage: attemptEntity.points / attemptEntity.maxPoints,
              radius: 220.h,
              type: GFProgressType.circular,
              backgroundColor: ColorConstant.blackColor,
              progressBarColor: ColorConstant.orangeColor,
              child: Text(
                '${attemptEntity.points}/${attemptEntity.maxPoints}',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 22.sp,
                    color: ColorConstant.orangeColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text(
            '${attemptEntity.attemptType?.titleRu}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Язык сдачи:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${attemptEntity.locale?.title}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorConstant.orangeColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Время сдачи:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${StrHelper.toHourMinutesSeconds(attemptEntity.time, attemptEntity.timeLeft)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorConstant.orangeColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Итого:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${attemptEntity.points}/${attemptEntity.maxPoints}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: ColorConstant.orangeColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]
      ),
    );
  }


}
