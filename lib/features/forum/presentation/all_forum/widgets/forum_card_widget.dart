import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/forum/domain/entities/forum_entity.dart';

import '../../../../../core/helpers/str_helper.dart';
import '../../../../../core/services/image_service.dart';

class ForumCardWidget extends StatefulWidget {
  const ForumCardWidget({super.key, required this.forumEntity});
  final ForumEntity forumEntity;
  @override
  State<ForumCardWidget> createState() => _ForumCardWidgetState();
}

class _ForumCardWidgetState extends State<ForumCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.w),
        ),
        elevation: 2.0,
        surfaceTintColor: Colors.white,
        child: Container(
          width: 320.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: ColorConstant.violetToPinkGradient),
              borderRadius: BorderRadius.circular(20.w),
              border: Border.all(color: ColorConstant.violetFirst)),
          padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                decoration: BoxDecoration(
                    color: ColorConstant.violetFirst,
                    borderRadius: BorderRadius.circular(30.w)),
                child: Text(
                  "${widget.forumEntity.subject?.title_ru}",
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                StrHelper.truncateWithEllipsis(50, widget.forumEntity.text),
                style: TextStyle(fontSize: 22.sp, color: Colors.white),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 24.sp,
                    backgroundImage: getImageProviderFromServer(
                        widget.forumEntity.user?.file?.url),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  AutoSizeText(
                    "${widget.forumEntity.user?.name}",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Center(
                    child: _getForumText(
                        widget.forumEntity.discussRatingSumRating ?? 0),
                  )),
                  Expanded(
                      child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "${widget.forumEntity.discussesCount}",
                              style: TextStyle(
                                  fontSize: 24.sp, color: Colors.white)),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.0.w),
                              child: Icon(
                                FontAwesomeIcons.comment,
                                size: 24.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getForumText(int rating) {
    if (rating > 0) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "+${rating}",
                style: TextStyle(fontSize: 24.sp, color: Colors.greenAccent)),
            WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0.w),
                child: Icon(
                  FontAwesomeIcons.faceSmileWink,
                  size: 24.sp,
                  color: Colors.greenAccent,
                ),
              ),
            ),
          ],
        ),
      );
    }
    if (rating < 0) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "${rating}",
                style: TextStyle(fontSize: 24.sp, color: Colors.red)),
            WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0.w),
                child: Icon(
                  FontAwesomeIcons.faceSadTear,
                  size: 24.sp,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: "${rating}",
              style: TextStyle(fontSize: 24.sp, color: Colors.white)),
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(left: 5.0.w),
              child: Icon(
                FontAwesomeIcons.faceMehBlank,
                size: 24.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
