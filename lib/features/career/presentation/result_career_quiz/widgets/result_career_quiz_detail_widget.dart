import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/types/gf_progress_type.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/services/image_service.dart';
import '../../../domain/entities/career_quiz_attempt_result_entity.dart';

class ResultCareerQuizDetailWidget extends StatelessWidget {
  const ResultCareerQuizDetailWidget({super.key,required this.resultEntity});
  final CareerQuizAttemptResultEntity resultEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal:10.w, vertical: 10.h),
      constraints: BoxConstraints(
        minHeight: 220.h
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        border: Border.all(color: ColorConstant.peachColor),
        color: ColorConstant.appBarColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 240.h,
            child: GFProgressBar(
              circleWidth: 20,
              percentage: resultEntity.percentage/100,
              radius: 220.h,
              type: GFProgressType.circular,
              backgroundColor: ColorConstant.blackColor,
              progressBarColor: ColorConstant.peachColor,
              child: Text(
                '${resultEntity.percentage}%',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 22.sp,
                    color: ColorConstant.peachColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                      getImageFromString(resultEntity.careerQuizFeature?.file?.url),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              Expanded(flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          wrapWords: false,
                          "${resultEntity.careerQuizFeature?.titleRu}".toUpperCase(),
                          maxLines: 3,
                          style: TextStyle(
                              color: ColorConstant.peachColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                      ],
                    ),
                  )
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Divider(height: 2,color: Colors.white.withOpacity(0.8),),
          ),
          SizedBox(height: 10.h,),
          AutoSizeText(
            "Описание:",
            maxLines: 2,
            style: TextStyle(
                fontSize: 18.sp,
                color: ColorConstant.peachColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h,),
          Html(
              data: resultEntity.careerQuizFeature?.descriptionRu,
              style: {
                "p":Style(
                  color: Colors.white,
                  fontSize: FontSize(12),
                  padding: HtmlPaddings.zero
                ),
                "ul":Style(
                    color: Colors.white,
                    fontSize: FontSize(12),
                    padding: HtmlPaddings.zero
                )
              },
          ),
          SizedBox(height: 10.h,),
          AutoSizeText(
            "Перспективы:",
            maxLines: 2,
            style: TextStyle(
                fontSize: 18.sp,
                color: ColorConstant.peachColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h,),
          Html(
            data: resultEntity.careerQuizFeature?.prospectRu,
            style: {
              "p":Style(
                  color: Colors.white,
                  fontSize: FontSize(12),
                  padding: HtmlPaddings.zero
              ),
              "ul":Style(
                  color: Colors.white,
                  fontSize: FontSize(12),
                  padding: HtmlPaddings.zero
              )
            },
          ),
          SizedBox(height: 10.h,),
          AutoSizeText(
            "Значение:",
            maxLines: 2,
            style: TextStyle(
                fontSize: 18.sp,
                color: ColorConstant.peachColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h,),
          Html(
            data: resultEntity.careerQuizFeature?.meaningRu,
            style: {
              "p":Style(
                  color: Colors.white,
                  fontSize: FontSize(12),
                  padding: HtmlPaddings.zero
              ),
              "ul":Style(
                  color: Colors.white,
                  fontSize: FontSize(12),
                  padding: HtmlPaddings.zero
              )
            },
          ),
          SizedBox(height: 10.h,),
          AutoSizeText(
            "Направление деятельности:",
            maxLines: 2,
            style: TextStyle(
                fontSize: 18.sp,
                color: ColorConstant.peachColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h,),
          Html(
            data: resultEntity.careerQuizFeature?.activityRu,
            style: {
              "p":Style(
                  color: Colors.white,
                  fontSize: FontSize(12),
                  padding: HtmlPaddings.zero
              ),
              "ul":Style(
                  color: Colors.white,
                  fontSize: FontSize(12),
                  padding: HtmlPaddings.zero
              )
            },
          )
        ],
      ),
    );
  }
}
