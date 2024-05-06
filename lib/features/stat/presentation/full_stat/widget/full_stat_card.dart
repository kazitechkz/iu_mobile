import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullStatCard extends StatefulWidget {
  const FullStatCard(
      {super.key,
      required this.statNumber,
      required this.icon,
      required this.color,
      required this.title});

  final String statNumber;
  final IconData icon;
  final Color color;
  final String title;

  @override
  State<FullStatCard> createState() => _FullStatCardState();
}

class _FullStatCardState extends State<FullStatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      width: 220.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: Offset(0.0, 1.0),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: Text(widget.title, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 16.sp),)),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.statNumber,style: TextStyle(color: widget.color, fontWeight: FontWeight.bold,fontSize: 32.sp)),
              SizedBox(
                width: 60.h,
                height: 60.h,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75.h),
                    color: widget.color
                  ),
                  child: Center(
                    child: Icon(widget.icon,size: 24.sp, color: Colors.white,),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
