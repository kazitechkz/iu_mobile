import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:iu/core/app_constants/color_constant.dart';

import '../../../../../core/helpers/str_helper.dart';
import '../../../../../core/services/image_service.dart';
import '../../../domain/entities/tech_support_ticket_entity.dart';

class TicketDetailHeaderWidget extends StatelessWidget {
  const TicketDetailHeaderWidget({super.key, required this.ticket});

  final TechSupportTicketEntity ticket;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GFAvatar(
                radius: 24,
                backgroundImage:
                    getImageProviderFromServer(ticket.user?.file?.url),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "${ticket.user?.name}",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "${ticket.title}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Divider(
              color: Colors.white.withOpacity(0.8),
              height: 2,
            ),
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
                      child: GFAvatar(
                        radius: 8,
                        backgroundColor: ticket.isClosed == true
                            ? ColorConstant.mathOne
                            : ColorConstant.peachColor,
                      ),
                    ),
                  ),
                  TextSpan(
                    text:
                        "${ticket.isClosed == true ? "Тикет закрыт" : "Тикет открыт"}",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ])),
              ),
              SizedBox(
                width: 5.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: GFAvatar(
                        radius: 8,
                        backgroundColor: ticket.isResolved == true
                            ? ColorConstant.mathOne
                            : ColorConstant.peachColor,
                      ),
                    ),
                  ),
                  TextSpan(
                    text:
                        "${ticket.isResolved == true ? "Тикет решен" : "Тикет не решен"}",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ])),
              ),
              SizedBox(
                width: 5.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: GFAvatar(
                        radius: 8,
                        backgroundColor: ticket.isAnswered == true
                            ? ColorConstant.mathOne
                            : ColorConstant.peachColor,
                      ),
                    ),
                  ),
                  TextSpan(
                    text:
                        "${ticket.isAnswered == true ? "Отвечен" : "Не отвечен"}",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ])),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        "${StrHelper.toDateTimeString(ticket.createdAt)}",
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(30.w),
                      color: ColorConstant.peachColor),
                  child: AutoSizeText(
                    maxLines: 2,
                    "${ticket.techSupportType?.titleRu}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(30.w),
                      color: ColorConstant.peachColor),
                  child: AutoSizeText(
                    maxLines: 2,
                    "${ticket.techSupportCategory?.titleRu}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
