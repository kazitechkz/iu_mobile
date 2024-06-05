import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iu/core/app_constants/color_constant.dart';
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
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 15.h),
      constraints: BoxConstraints(minHeight: 100.h),
      decoration: BoxDecoration(
          color: ColorConstant.appBarColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: ColorConstant.peachColor)),
      child: Column(
        children: [
          ListTile(
              leading: GFAvatar(
                backgroundColor: ColorConstant.peachColor,
                backgroundImage: getImageProviderFromServer(
                    attemptSettingStudentEntity.owner?.file?.url),
              ),
              title: Text(
                "Учитель:",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              subtitle: Text(
                "${attemptSettingStudentEntity.owner?.name}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              trailing: Text(
                "${StrHelper.toDateTimeString(attemptSettingStudentEntity.createdAt)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
