import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/color_helper.dart';
import 'package:iu/core/helpers/str_helper.dart';
import '../../../../../core/services/image_service.dart';
import '../../../domain/entities/attempt_setting_student_entity.dart';

class SingleUntCardWidget extends StatelessWidget {
  const SingleUntCardWidget(
      {super.key, required this.attemptSettingStudentEntity});
  final AttemptSettingStudentEntity attemptSettingStudentEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 15.h),
      constraints: BoxConstraints(minHeight: 100.h),
      decoration: BoxDecoration(
          color: ColorConstant.appBarColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorConstant.peachColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GFAvatar(
                backgroundImage: getImageProviderFromServer(attemptSettingStudentEntity.owner?.file?.url),
                backgroundColor: ColorConstant.peachColor,
                radius: 28,
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                "Учитель",
                                maxLines: 2,
                                style: TextStyle(color: Colors.white, fontSize: 13.sp),
                              ),
                            ),
                            Expanded(
                              child: AutoSizeText(
                                "${StrHelper.toDateTimeString(attemptSettingStudentEntity.createdAt)}",
                                maxLines: 2,
                                textAlign: TextAlign.end,
                                style: TextStyle(color: Colors.white, fontSize: 10.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h,),
                        AutoSizeText(
                            "${attemptSettingStudentEntity.owner?.name}",
                          maxLines: 2,
                          style: TextStyle(color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.h,),child: Divider(color: Colors.white.withOpacity(0.5),),),
          AutoSizeText(
            "Предметы:",
            maxLines: 2,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 18.sp,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            constraints: BoxConstraints(
                minHeight: 40.h
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                border: Border.all(color: Colors.white),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [ColorHelper.getMainSubjectColor(attemptSettingStudentEntity.subject!.id),ColorConstant.appBarColor]
                )
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: GFAvatar(
                    backgroundImage: getImageProviderFromServer(attemptSettingStudentEntity.subject?.image?.url),
                    backgroundColor: ColorConstant.peachColor,
                    radius: 16,
                  ),
                ),
                Text("${attemptSettingStudentEntity.subject?.title_ru}",style: TextStyle(color: Colors.white, fontSize: 16.sp),),
              ],
            )
          ),
          SizedBox(height: 20.h,),
          Row(
            children: [
              Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Icon(FontAwesomeIcons.clock,size: 14.sp, color: Colors.white,),
                      ),
                      AutoSizeText("${attemptSettingStudentEntity.time} (минут)",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),)
                    ],
                  )
              ),
              Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Icon(FontAwesomeIcons.globe,size: 14.sp, color: Colors.white,),
                      ),
                      AutoSizeText("${attemptSettingStudentEntity.locale?.title}",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),)
                    ],
                  )
              ),
              Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Icon(FontAwesomeIcons.slack,size: 14.sp, color: Colors.white,),
                      ),
                      AutoSizeText("${attemptSettingStudentEntity.promoCode}",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),)
                    ],
                  )
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      vertical: 10.h, horizontal: 15.w),
                  decoration: BoxDecoration(
                      color: ColorConstant.appBarColor,
                      border: Border.all(color: ColorConstant.peachColor),
                      borderRadius: BorderRadius.circular(30)),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Начать",
                        style: TextStyle(
                            color: Colors.white, fontSize: 16.sp),
                      ),
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              FontAwesomeIcons.play,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ))
                    ]),
                  ))
            ],
          )

        ],
      ),
    );
  }
}
