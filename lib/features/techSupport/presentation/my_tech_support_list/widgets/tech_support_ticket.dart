import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:iu/core/app_constants/app_constant.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/str_helper.dart';

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
    return Container(
      constraints: BoxConstraints(minHeight: 240.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: [
                ColorConstant.bottomBarColor,
                ColorConstant.violetFirst
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(minHeight: 60.h),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "${widget.ticketEntity.techSupportCategory?.titleRu}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DottedDashedLine(
                  height: 60.h,
                  width: 0,
                  axis: Axis.vertical,
                  dashColor: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "${widget.ticketEntity.techSupportType?.titleRu}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 5.0,
            dashColor: Colors.white,
            dashRadius: 3.0,
            dashGapLength: 5.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StrHelper.truncateWithEllipsis(
                      75, "${widget.ticketEntity.title}"),
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            FontAwesomeIcons.comment,
                            size: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                          text:
                              "${widget.ticketEntity.techSupportMessagesCount}",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.0.w),
                          child: Icon(
                            FontAwesomeIcons.clock,
                            size: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                          text:
                              "${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(widget.ticketEntity.createdAt ?? DateTime.now().toString()))} ${widget.ticketEntity.isAnswered == true ? "+1" : ""}",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: widget.ticketEntity.isAnswered == true
                                  ? Colors.white
                                  : Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        constraints: BoxConstraints(minHeight: 80.h),
                        decoration: BoxDecoration(
                            color: ColorConstant.appBarColor,
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Закрыт",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            (widget.ticketEntity.isClosed == true
                                ? Icon(FontAwesomeIcons.check,
                                    color: ColorConstant.mathOne)
                                : Icon(FontAwesomeIcons.xmark,
                                    color: ColorConstant.redColor))
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        constraints: BoxConstraints(minHeight: 80.h),
                        decoration: BoxDecoration(
                            color: ColorConstant.appBarColor,
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Решен",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            (widget.ticketEntity.isResolved == true
                                ? Icon(FontAwesomeIcons.check,
                                    color: ColorConstant.mathOne)
                                : Icon(FontAwesomeIcons.xmark,
                                    color: ColorConstant.redColor))
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        constraints: BoxConstraints(minHeight: 80.h),
                        decoration: BoxDecoration(
                            color: ColorConstant.appBarColor,
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Отвечен",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            (widget.ticketEntity.isAnswered == true
                                ? Icon(FontAwesomeIcons.check,
                                    color: ColorConstant.mathOne)
                                : Icon(FontAwesomeIcons.xmark,
                                    color: ColorConstant.redColor))
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.appBarColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.w),
                                  side: BorderSide(
                                      color: Colors.white, width: 1.0))),
                          onPressed: () {},
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Изучить",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Icon(
                                      FontAwesomeIcons.chevronRight,
                                      color: Colors.white,
                                      size: 14.sp,
                                    ),
                                  ))
                            ]),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
