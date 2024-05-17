import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/app_constants/route_constant.dart';
import '../../../../../core/common/models/subject.dart';
import '../../../../attempt/domain/entities/attempt_entity.dart';

class StatCardWidget extends StatelessWidget {
  const StatCardWidget({super.key, required this.attemptEntity});

  final AttemptEntity? attemptEntity;

  @override
  Widget build(BuildContext context) {
    return (attemptEntity != null
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            constraints: BoxConstraints(minHeight: 120.h),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ColorConstant.appBarColor,
                      ColorConstant.darkOrangeColor,
                    ]),
                borderRadius: BorderRadius.circular(20.w)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "${attemptEntity?.attemptType?.titleRu}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Wrap(
                  children: _generateSubjectWidget(attemptEntity?.subjects),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _generateTimerWidget(),
                    SizedBox(
                      height: 50.w,
                      width: 50.w,
                      child: InkWell(
                        onTap: () {},
                        child: ElevatedButton(
                          onPressed: () {
                            if(attemptEntity?.endAt == null){
                              context.go(
                                  '/${RouteConstant.passAttemptById}/${attemptEntity?.id}');
                            }
                            else{
                              context.go(
                                  '/${RouteConstant.attemptResultByAttemptIdName}/${attemptEntity?.id}');
                            }

                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.bottomBarColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(50.w), // <-- Radius
                              ),
                              padding: EdgeInsets.all(10)),
                          child: Icon(FontAwesomeIcons.chevronRight,
                              color: Colors.white, size: 22.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : SizedBox());
  }

  List<Widget> _generateSubjectWidget(List<SubjectEntity>? subjects) {
    List<Widget> widgets = [];
    if (subjects != null) {
      widgets = subjects
          .map((subjectItem) => Container(
                margin: EdgeInsets.only(top: 5.h, left: 5.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                    color: ColorConstant.appBarColor,
                    borderRadius: BorderRadius.circular(20.w)),
                child: Text(
                  "${subjectItem.title_ru}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500),
                ),
              ))
          .toList();
    }
    return widgets;
  }

  Widget _generateTimerWidget() {
    DateFormat formatter = DateFormat("dd/MM/yyyy HH:mm");
    String timeFormat = formatter.format(DateTime.parse(
        attemptEntity?.endAt ?? DateTime.now().toIso8601String()));
    return Container(
        margin: EdgeInsets.only(top: 5.h, left: 5.w),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        decoration: BoxDecoration(
            color: ColorConstant.appBarColor,
            borderRadius: BorderRadius.circular(20.w)),
        child: (attemptEntity?.endAt == null
            ? TimerCountdown(
          spacerWidth: 5,
                colonsTextStyle:
                    TextStyle(color: ColorConstant.redColor, fontSize: 10.sp),
                timeTextStyle: TextStyle(color: ColorConstant.redColor, fontSize: 10.sp),
                descriptionTextStyle:
                    TextStyle(color: ColorConstant.redColor, fontSize: 10.sp),
                enableDescriptions: false,
                format: CountDownTimerFormat.hoursMinutesSeconds,
                endTime: DateTime.now().add(
                  Duration(milliseconds: attemptEntity?.timeLeft ?? 0),
                ),
                onEnd: () {},
              )
            : Text(
                "${timeFormat}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500),
              )));
  }
}
