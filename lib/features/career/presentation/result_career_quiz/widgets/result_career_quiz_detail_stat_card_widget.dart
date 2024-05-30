import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/services/image_service.dart';
import '../../../domain/entities/career_quiz_attempt_result_entity.dart';

class ResultCareerQuizDetailStatCardWidget extends StatelessWidget {
  const ResultCareerQuizDetailStatCardWidget({super.key,required this.resultEntity});
  final CareerQuizAttemptResultEntity resultEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal:10.w, vertical: 10.h),
      constraints: BoxConstraints(
          minHeight: 75.h
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          border: Border.all(color: ColorConstant.peachColor),
          color: ColorConstant.appBarColor
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 60.h,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      wrapWords: false,
                      "${resultEntity.careerQuizFeature?.titleRu}".toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                          color: ColorConstant.peachColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Expanded(child:  AutoSizeText(
                          textAlign: TextAlign.start,
                          wrapWords: false,
                          "${resultEntity.points} баллов",
                          maxLines: 1,
                          style: TextStyle(
                              color: ColorConstant.peachColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                        Expanded(child:  AutoSizeText(
                          textAlign: TextAlign.end,
                          wrapWords: false,
                          "${resultEntity.percentage} %",
                          maxLines: 1,
                          style: TextStyle(
                              color: ColorConstant.peachColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                      ],
                    )

                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
