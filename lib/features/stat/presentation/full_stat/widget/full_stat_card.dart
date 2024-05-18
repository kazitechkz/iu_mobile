import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/color_constant.dart';

class FullStatCard extends StatefulWidget {
  const FullStatCard(
      {super.key,
      required this.statNumber,
      required this.icon,
      required this.title});

  final String statNumber;
  final IconData icon;
  final String title;

  @override
  State<FullStatCard> createState() => _FullStatCardState();
}

class _FullStatCardState extends State<FullStatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: 220.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.8],
            colors: [ColorConstant.darkOrangeColor, ColorConstant.appBarColor]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          )),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.statNumber,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.sp)),
              SizedBox(
                width: 60.h,
                height: 60.h,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75.h),
                      color: ColorConstant.darkOrangeColor),
                  child: Center(
                    child: Icon(
                      widget.icon,
                      size: 24.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
