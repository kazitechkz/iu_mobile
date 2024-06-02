import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:iu/core/app_constants/app_constant.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/str_helper.dart';

import '../../../../../core/app_constants/route_constant.dart';
import '../../../../../core/helpers/color_helper.dart';
import '../../../domain/entities/tech_support_ticket_entity.dart';

class TechSupportTicket extends StatefulWidget {
  const TechSupportTicket({super.key, required this.ticketEntity});

  final TechSupportTicketEntity ticketEntity;

  @override
  State<TechSupportTicket> createState() => _TechSupportTicketState();
}

class _TechSupportTicketState extends State<TechSupportTicket> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(
            "/${RouteConstant.techSupportTicketDetailName}/${widget.ticketEntity.id}");
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h),
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        constraints: BoxConstraints(minHeight: 100.h),
        decoration: BoxDecoration(
            color: ColorConstant.appBarColor,
            borderRadius: BorderRadius.circular(20.w),
            border: Border.all(color: ColorConstant.peachColor, width: 2.h)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: ColorConstant.appBarColor,
                  borderRadius: BorderRadius.circular(75),
                  border:
                      Border.all(color: ColorConstant.peachColor, width: 3.h)),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.comments,
                  color: ColorConstant.peachColor,
                  size: 21,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      maxLines: 2,
                      StrHelper.truncateWithEllipsis(
                          50, "${widget.ticketEntity.title}"),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 15.h,
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
                                  color: Colors.white,
                                  size: 12.sp,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "${StrHelper.toDateTimeString(widget.ticketEntity.createdAt)}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  FontAwesomeIcons.comment,
                                  color: Colors.white,
                                  size: 12.sp,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "${widget.ticketEntity.techSupportMessagesCount}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            (widget.ticketEntity.isAnswered == true
                ? Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10.h),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: ColorConstant.peachColor,
                      borderRadius: BorderRadius.circular(75),
                    ),
                  )
                : SizedBox())
          ],
        ),
      ),
    );
  }
}
