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
import '../../../domain/entities/tech_support_message_entity.dart';

class TicketDetailBodyWidget extends StatelessWidget {
  const TicketDetailBodyWidget({super.key, required this.messageEntity});

  final TechSupportMessageEntity messageEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      constraints: BoxConstraints(minHeight: 100.h),
      decoration: BoxDecoration(
          color: ColorConstant.appBarColor,
          border: Border.all(color: ColorConstant.peachColor),
          borderRadius: BorderRadius.circular(20.w)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GFAvatar(
                radius: 24,
                backgroundImage:
                    getImageProviderFromServer(messageEntity.user?.file?.url),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "${messageEntity.user?.name}",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Html(
                      data: messageEntity.message,
                      style: {
                        "p": Style(color: Colors.white, fontSize: FontSize(14)),
                        "ul":
                            Style(color: Colors.white, fontSize: FontSize(14)),
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            FontAwesomeIcons.clock,
                            color: ColorConstant.peachColor,
                            size: 14.sp,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "${StrHelper.toDateTimeString(messageEntity.createdAt)}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
