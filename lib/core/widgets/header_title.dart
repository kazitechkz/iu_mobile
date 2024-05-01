import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/color_constant.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;

  HeaderTitle({super.key, required this.title, this.fontSize = 28,this.color = ColorConstant.mainDarkColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: color,
          fontSize: fontSize.sp,
          fontWeight: FontWeight.bold),
    );
  }
}
