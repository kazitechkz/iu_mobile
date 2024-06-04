import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/helpers/str_helper.dart';
import '../../../../../core/services/image_service.dart';
import '../../../domain/entities/discuss_entity.dart';

class DisccussDetailCardWidget extends StatelessWidget {
  const DisccussDetailCardWidget({super.key,required this.discussEntity});
  final DiscussEntity discussEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      constraints: BoxConstraints(
        minHeight: 120.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorConstant.peachColor),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [ColorConstant.appBarColor, ColorConstant.peachColor])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Html(
            data: discussEntity.text,
            style: {
              "p":Style(
                  color: Colors.white,
                  fontSize: FontSize(14),
                  padding: HtmlPaddings.zero
              ),
              "ul":Style(
                  color: Colors.white,
                  fontSize: FontSize(14),
                  padding: HtmlPaddings.zero
              )
            },
          ),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            FontAwesomeIcons.solidHeart,
                            color: ColorConstant.peachColor,
                            size: 16.sp,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: "${discussEntity.discussRatingsSumRating}",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ])),
              ),
              SizedBox(
                width: 10.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            FontAwesomeIcons.solidClock,
                            color: ColorConstant.peachColor,
                            size: 16.sp,
                          ),
                        ),
                      ),
                      TextSpan(
                        text:
                        "${StrHelper.toDateTimeString(discussEntity.createdAt)}",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ])),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Divider(
              height: 2.h,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: GFAvatar(
                          size: 24,
                          backgroundImage: getImageProviderFromServer(
                              discussEntity.user?.file?.url),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: "${discussEntity.user?.name}",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ]))
            ],
          )
        ],
      ),
    );
  }
}
