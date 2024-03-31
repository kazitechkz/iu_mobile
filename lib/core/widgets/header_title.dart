import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/color_constant.dart';

class HeaderTitle extends StatelessWidget {
  final String title;

  const HeaderTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: ColorConstant.mainDarkColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.bold),
    );
  }
}
