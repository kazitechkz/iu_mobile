import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:iu/core/common/models/sub_category.dart';
import 'package:iu/core/helpers/color_helper.dart';

import '../../../../../core/app_constants/color_constant.dart';

class SubjectStatBodyWidget extends StatefulWidget {
  const SubjectStatBodyWidget(
      {super.key,
      required this.subjectId,
      this.subCategory,
      required this.right,
      required this.notRight});

  final SubCategoryEntity? subCategory;
  final int subjectId;
  final int right;
  final int notRight;

  @override
  State<SubjectStatBodyWidget> createState() => _SubjectStatBodyWidgetState();
}

class _SubjectStatBodyWidgetState extends State<SubjectStatBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      constraints: BoxConstraints(minHeight: 120.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorHelper.getSecondSubjectColor(widget.subjectId),
                ColorConstant.appBarColor
              ]),
          border: Border.all(color: ColorConstant.grayColor),
          borderRadius: BorderRadius.circular(20.w)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  toBeginningOfSentenceCase(
                          "${widget.subCategory?.title_ru ?? "Нет категории"}"
                              .toLowerCase()) ??
                      "${widget.subCategory?.title_ru ?? "Нет категории"}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.circleQuestion,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "${widget.right + widget.notRight}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Всего",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.circleCheck,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "${widget.right}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Верно",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.circleXmark,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "${widget.notRight}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Неверно",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp),
                        ),
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.appBarColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.w),
                                side: BorderSide(
                                    color: Colors.white, width: 1.0))),
                        onPressed: () {},
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Пройти обучение",
                              style: TextStyle(
                                color: ColorHelper.getSecondSubjectColor(
                                    widget.subjectId),
                                fontSize: 12.sp,
                              ),
                            ),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: ColorHelper.getSecondSubjectColor(
                                        widget.subjectId),
                                    size: 12.sp,
                                  ),
                                ))
                          ]),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
