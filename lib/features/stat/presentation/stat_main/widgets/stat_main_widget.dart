import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/str_helper.dart';

class StatMainStatCard extends StatelessWidget {
  final IconData icon;
  final int stat;
  final String name;

  const StatMainStatCard(
      {super.key, required this.icon, required this.stat, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorConstant.appBarColor,
            ColorConstant.darkOrangeColor,
          ]
        )
      ),
      constraints: BoxConstraints(minHeight: 120.h),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              color: Colors.white,
              size: 22.sp,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              this.name + ":",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              StrHelper.beautifulInteger(stat),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp),
            )
          ],
        ),
      ),
    );
  }
}
