import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/color_helper.dart';
import 'package:iu/features/forum/domain/entities/forum_entity.dart';

import '../../../../../core/app_constants/route_constant.dart';
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
    return InkWell(
      onTap: (){
        context.go("/${RouteConstant.forumDetailName}/${widget.forumEntity.id}");
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        constraints: BoxConstraints(
          minHeight: 120.h,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ColorConstant.peachColor),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [ColorConstant.appBarColor, ColorConstant.peachColor])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  constraints: BoxConstraints(minWidth: 80.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorConstant.peachColor),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            ColorConstant.appBarColor,
                            ColorHelper.getSecondSubjectColor(
                                widget.forumEntity.subjectId)
                          ])),
                  child: Text(
                    "${widget.forumEntity.subject?.title_ru}",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            AutoSizeText(
              StrHelper.truncateWithEllipsis(80, widget.forumEntity.text),
              maxLines: 3,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
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
                      text: "${widget.forumEntity.discussRatingSumRating}",
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
                          FontAwesomeIcons.solidComment,
                          color: ColorConstant.peachColor,
                          size: 16.sp,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: "${widget.forumEntity.discussesCount}",
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
                          "${StrHelper.toDateTimeString(widget.forumEntity.createdAt)}",
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
                            widget.forumEntity.user?.file?.url),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: "${widget.forumEntity.user?.name}",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
