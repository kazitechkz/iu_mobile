import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_constants/color_constant.dart';

class SubjectStatFullCardWidget extends StatefulWidget {
  const SubjectStatFullCardWidget({super.key, required this.listOfWidget});
  final List<Widget> listOfWidget;
  @override
  State<SubjectStatFullCardWidget> createState() =>
      _SubjectStatFullCardWidgetState();
}

class _SubjectStatFullCardWidgetState extends State<SubjectStatFullCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: ColorConstant.appBarColor,
          borderRadius: BorderRadius.circular(10.w)),
      constraints: BoxConstraints(
        minHeight: 120.h,
        minWidth: 320.w,
      ),
      child: Column(
        children: widget.listOfWidget,
      ),
    );
    ;
  }
}
