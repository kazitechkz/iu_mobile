import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/str_helper.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Card(
        elevation: 8.0,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          constraints: BoxConstraints(minHeight: 180.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border(
                  left: BorderSide(
                      color: (widget.ticketEntity.isClosed == true
                          ? Colors.green
                          : Colors.yellowAccent),
                      width: 10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: ColorConstant.violetFirst,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${widget.ticketEntity.techSupportCategory?.titleRu}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5.w),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: ColorConstant.violetFirst,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${widget.ticketEntity.techSupportType?.titleRu}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                StrHelper.truncateWithEllipsis(
                    75, "${widget.ticketEntity.title}"),
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Icon(
                          FontAwesomeIcons.comment,
                          size: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextSpan(
                        text: "${widget.ticketEntity.techSupportMessagesCount}",
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.0.w),
                        child: Icon(
                          FontAwesomeIcons.clock,
                          size: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextSpan(
                        text:
                            "${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(widget.ticketEntity.createdAt ?? DateTime.now().toString()))} ${widget.ticketEntity.isAnswered == true ? "+1" : ""}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: widget.ticketEntity.isAnswered == true
                                ? Colors.black
                                : Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: widget.ticketEntity.isResolved == true
                          ? Colors.green
                          : ColorConstant.orangeColorDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${widget.ticketEntity.isResolved == true ? "Тикет решен" : "В процессе решения"}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
