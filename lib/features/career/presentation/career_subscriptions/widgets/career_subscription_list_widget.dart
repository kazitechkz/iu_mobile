import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/services/image_service.dart';
import '../../../domain/entities/career_quiz_entity.dart';

class CareerSubscriptionListItemWidget extends StatelessWidget {
  const CareerSubscriptionListItemWidget({super.key, required this.careerQuizEntity});
  final CareerQuizEntity careerQuizEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: 75.h
      ),
      decoration: BoxDecoration(
          color: ColorConstant.appBarColor
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.check,color: ColorConstant.peachColor,),
          Expanded(
              flex: 1,
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                  getImageFromString(careerQuizEntity.file?.url),
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
                      "${careerQuizEntity.titleRu}".toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                          color: ColorConstant.peachColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
