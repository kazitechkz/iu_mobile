import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/helpers/color_helper.dart';
import 'package:iu/features/stat/domain/entities/subject_result_entity.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/services/image_service.dart';

class AttemptResultSubjectCard extends StatelessWidget {
  const AttemptResultSubjectCard(
      {super.key,
      required this.subjectEntity,
      required this.subjectResultEntity});

  final SubjectEntity subjectEntity;
  final SubjectResultEntity? subjectResultEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      constraints: BoxConstraints(
        minHeight: 280.h,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.1,
                0.7
              ],
              colors: [
                ColorHelper.getMainSubjectColor(subjectEntity.id),
                ColorConstant.appBarColor
              ]),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  '${subjectEntity.title_ru}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Center(
                          child: GFAvatar(
                            backgroundImage: getImageProviderFromServer(
                                subjectEntity.image?.url),
                            shape: GFAvatarShape.circle,
                            size: 90.w,
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            children: [
                              _getStatWidget(
                                  ColorConstant.violetColor,
                                  "Всего вопросов",
                                  "${subjectResultEntity?.total ?? 0}"),
                              SizedBox(
                                height: 10.h,
                              ),
                              _getStatWidget(ColorConstant.mathOne, "Верно",
                                  "${subjectResultEntity?.right ?? 0}"),
                              SizedBox(
                                height: 10.h,
                              ),
                              _getStatWidget(ColorConstant.redColor, "Неверно",
                                  "${subjectResultEntity?.notRight ?? 0}"),
                              SizedBox(
                                height: 10.h,
                              ),
                              _getStatWidget(
                                  ColorConstant.orangeColor,
                                  "Набранно баллов",
                                  "${subjectResultEntity?.point ?? 0}"),
                            ],
                          ),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getStatWidget(Color colorCircle, String title, String stat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: RichText(
          text: TextSpan(children: [
            WidgetSpan(
                child: Container(
              margin: EdgeInsets.only(right: 5.w),
              height: 20.w,
              width: 20.w,
              decoration: BoxDecoration(
                  color: colorCircle,
                  borderRadius: BorderRadius.circular(20.w)),
            )),
            TextSpan(
                text: title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp)),
          ]),
        )),
        Text(stat,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp))
      ],
    );
  }
}
