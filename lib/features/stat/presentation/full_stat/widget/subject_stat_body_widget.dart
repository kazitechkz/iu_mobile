import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/common/models/sub_category.dart';

import '../../../../../core/app_constants/color_constant.dart';

class SubjectStatBodyWidget extends StatefulWidget {
  const SubjectStatBodyWidget({super.key,this.subCategory, required this.right,required this.notRight});
  final SubCategoryEntity? subCategory;
  final int right;
  final int notRight;
  @override
  State<SubjectStatBodyWidget> createState() => _SubjectStatBodyWidgetState();
}

class _SubjectStatBodyWidgetState extends State<SubjectStatBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          border: Border.all(color: Colors.white)),
      child: Column(
        children: [
          Row(children: [
            Flexible(
              child: Text(
                widget.subCategory?.title_ru ??
                    "Нет категории",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5.w),
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                    color: ColorConstant.lightViolet,
                    borderRadius: BorderRadius.circular(30.h)),
                child: Icon(
                  FontAwesomeIcons.circleQuestion,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              Text(
                "Всего вопросов:",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " ${widget.right + widget.notRight}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5.w),
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30.h)),
                child: Icon(
                  FontAwesomeIcons.check,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              Text(
                "Верно:",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " ${widget.right}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5.w),
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.h)),
                child: Icon(
                  FontAwesomeIcons.xmark,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              Text(
                "Неверно:",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                " ${widget.notRight}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(50.w),
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.w),
                color: ColorConstant.lightViolet,
              ),
              height: 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Пройти обучение",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
