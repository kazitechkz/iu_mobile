import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_constants/color_constant.dart';
import '../../domain/entities/WelcomeEntity.dart';

class OnWelcomeWidget extends StatelessWidget {
  const OnWelcomeWidget(
      {super.key,
      required this.data,
      required this.pageController,
      required this.index,
      required this.isLast});
  final WelcomeEntity data;
  final PageController pageController;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 320.w,
          height: 250.w,
          child: Image.asset(
            data.image,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          data.title,
          style: TextStyle(
              color: ColorConstant.mainDarkColor,
              fontSize: 28.sp,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          alignment: Alignment.center,
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorConstant.grayDarkColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
