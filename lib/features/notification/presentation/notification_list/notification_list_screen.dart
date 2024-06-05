import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/notification/domain/parameters/get_notification_all_parameter.dart';
import 'package:iu/features/notification/presentation/notification_list/widget/notification_card_widget.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import 'bloc/notification_list_bloc.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationListBloc>().add(NotificationListGetAllEvent(
        parameter: GetNotificationAllParameter(page: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Сообщения",
        imageUrl: "assets/images/icons/message.webp",
        routeLink: RouteConstant.dashboardScreenName,
      ),
      body: BlocConsumer<NotificationListBloc, NotificationListState>(
        listener: (BuildContext context, NotificationListState state) {},
        builder: (BuildContext context, NotificationListState state) {
          if (state is NotificationListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NotificationListSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  children: [
                    ...state.notifications
                        .map((notification) => GestureDetector(
                              onTap: () {
                                if (state.activeNotification?.id !=
                                    notification.id) {
                                  context.read<NotificationListBloc>().add(
                                      NotificationListCheckActiveNotificationEvent(
                                          notification: notification));
                                }
                                if (state.notificationIDS
                                        ?.contains(notification.id) ==
                                    false) {
                                  context.read<NotificationListBloc>().add(
                                      CheckNotificationEvent(
                                          notificationId: notification.id));
                                }
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: ColorConstant.appBarColor),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: GFAvatar(
                                                    radius: 32,
                                                    backgroundColor:
                                                        ColorConstant
                                                            .peachColor,
                                                    backgroundImage:
                                                        getImageProviderFromServer(
                                                            notification.owner
                                                                ?.file?.url),
                                                  ),
                                                  title: Text(
                                                    "${notification.owner != null ? notification.owner?.name : "Система"}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15.h),
                                                  child: Divider(
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                Html(
                                                  data: notification.message,
                                                  style: {
                                                    "p": Style(
                                                        color: Colors.white,
                                                        fontSize: FontSize(12)),
                                                    "h1": Style(
                                                        color: Colors.white,
                                                        fontSize: FontSize(12)),
                                                    "h2": Style(
                                                        color: Colors.white,
                                                        fontSize: FontSize(12)),
                                                    "h3": Style(
                                                        color: Colors.white,
                                                        fontSize: FontSize(12)),
                                                    "h4": Style(
                                                        color: Colors.white,
                                                        fontSize: FontSize(12)),
                                                    "h5": Style(
                                                        color: Colors.white,
                                                        fontSize: FontSize(12)),
                                                    "h6": Style(
                                                        color: Colors.white,
                                                        fontSize: FontSize(12)),
                                                    "ul": Style(
                                                        color: Colors.white,
                                                        fontSize: FontSize(12)),
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: NotificationCardWidget(
                                notificationEntity: notification,
                                notificationIDS: state.notificationIDS,
                              ),
                            ))
                        .toList()
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
