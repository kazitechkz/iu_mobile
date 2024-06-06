import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/str_helper.dart';
import 'package:iu/core/services/image_service.dart';
import 'package:iu/features/notification/domain/entities/notification_entity.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget(
      {super.key,
      required this.notificationEntity,
      required this.notificationIDS});

  final NotificationEntity notificationEntity;
  final List<int>? notificationIDS;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      constraints: BoxConstraints(minHeight: 100.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstant.peachColor, width: 2),
          borderRadius: BorderRadius.circular(20.w)),
      child: ListTile(
        leading: GFAvatar(
          radius: 32,
          backgroundColor: ColorConstant.peachColor,
          backgroundImage:
              getImageProviderFromServer(notificationEntity.owner?.file?.url),
        ),
        title: Text(
          "${notificationEntity.owner != null ? notificationEntity.owner?.name : "Система"}",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight:
                  _hasNotificationId() ? FontWeight.bold : FontWeight.normal),
        ),
        subtitle: AutoSizeText(
          StrHelper.truncateWithEllipsis(40, notificationEntity.title),
          maxLines: 2,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight:
                  _hasNotificationId() ? FontWeight.bold : FontWeight.normal),
        ),
        trailing: (_hasNotificationId()
            ? GFAvatar(
                radius: 6,
                backgroundColor: ColorConstant.peachColor,
              )
            : SizedBox()),
      ),
    );
  }

  bool _hasNotificationId() {
    if (this.notificationIDS != null) {
      if (this.notificationIDS!.length > 0) {
        if (this.notificationIDS?.contains(notificationEntity.id) ?? false) {
          return false;
        }
      }
    }
    return true;
  }
}
