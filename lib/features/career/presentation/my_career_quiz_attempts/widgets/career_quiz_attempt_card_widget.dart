import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/career/domain/entities/career_quiz_attempt_entity.dart';

import '../../../../../core/app_constants/route_constant.dart';
import '../../../../../core/services/image_service.dart';

class CareerQuizAttemptCardWidget extends StatelessWidget {
  const CareerQuizAttemptCardWidget({super.key,required this.careerQuizAttempt});
  final CareerQuizAttemptEntity careerQuizAttempt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.go("/${RouteConstant.resultCareerQuizName}/${careerQuizAttempt.id}");
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        constraints: BoxConstraints(
          minHeight: 80.h
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [ColorConstant.appBarColor, ColorConstant.peachColor]
          ),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: ColorConstant.peachColor)
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: GFAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    getImageFromString(careerQuizAttempt.careerQuiz?.file?.url),
                  ),
                  radius: 40.w,
                  shape: GFAvatarShape.circle
              ),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      maxLines: 1,
                      "Результат сдачи теста:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    AutoSizeText(
                      maxLines: 2,
                      "${careerQuizAttempt.careerQuiz?.titleRu}".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
