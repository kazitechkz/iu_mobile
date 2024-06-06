import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/features/attempt_setting/presentation/my_attempt_settings/widgets/many_unt_widget.dart';
import 'package:iu/features/attempt_setting/presentation/my_attempt_settings/widgets/single_unt_widget.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';

class MyAttemptSettingsScreen extends StatefulWidget {
  const MyAttemptSettingsScreen({super.key});
  @override
  State<MyAttemptSettingsScreen> createState() =>
      _MyAttemptSettingsScreenState();
}

class _MyAttemptSettingsScreenState extends State<MyAttemptSettingsScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Мои задание",
        imageUrl: "assets/images/icons/tasks.webp",
        routeLink: RouteConstant.dashboardScreenName,
      ),
      body: IndexedStack(
        index: index,
        children: [
          const SingleUntWidget(),
          const ManyUntWidget(),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
            color: Colors.transparent,
            child: Container(
              clipBehavior: Clip.hardEdge,
              constraints: BoxConstraints(minHeight: 80.h),
              decoration: BoxDecoration(
                  color: ColorConstant.appBarColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: ColorConstant.peachColor)),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: ColorConstant.orangeColor,
                unselectedItemColor: ColorConstant.grayColor,
                currentIndex: index,
                onTap: (int newindex) {
                  setState(() {
                    index = newindex;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.book),
                    label: "Сдача 1 предмета",
                    backgroundColor: ColorConstant.appBarColor.withOpacity(0.5),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.boxesStacked),
                    label: "Сдача ЕНТ",
                    backgroundColor: ColorConstant.appBarColor.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}
