import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/str_helper.dart';

import '../../../../../core/app_constants/route_constant.dart';
import '../../../../../core/services/image_service.dart';
import '../../../domain/entities/career_quiz_entity.dart';

class CareerQuizCardWidget extends StatelessWidget {
  const CareerQuizCardWidget(
      {super.key, required this.quizEntity, required this.purchased});
  final CareerQuizEntity quizEntity;
  final List<int> purchased;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      constraints: BoxConstraints(
          minHeight: 220.h
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.w),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorConstant.appBarColor, ColorConstant.lightPinkColor]
          )
      ),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${quizEntity.titleRu}".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      "#${quizEntity.careerQuizGroup?.titleRu}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 10.h,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:ColorConstant.appBarColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.w),
                          side:  BorderSide(color: Colors.white)
                        )
                      ),
                        onPressed: (){
                        context.go("/${RouteConstant.careerQuizDetailName}/${quizEntity.id}");
                        },
                        child: RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Пройти тест",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                                child: Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Icon(FontAwesomeIcons.chevronRight, color: Colors.white,size: 12.sp,),
                            ))
                          ]
                        ))
                    )
                  ],
                ),
              )
          ),
          Expanded(
              flex: 2,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: getImageFromString(quizEntity.file?.url),
                  fit: BoxFit.fitHeight,
                ),
              )
          ),
        ],
      ),
    );
  }
}
