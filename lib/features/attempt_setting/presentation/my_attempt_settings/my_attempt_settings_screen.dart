import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          Container(
            child: Text("wow"),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        clipBehavior: Clip.hardEdge,
        constraints: BoxConstraints(minHeight: 80.h),
        decoration: BoxDecoration(
            color: ColorConstant.appBarColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: ColorConstant.peachColor)),
        child: BottomNavigationBar(
          selectedItemColor: ColorConstant.orangeColor,
          unselectedItemColor: ColorConstant.grayColor,
          currentIndex: index,
          onTap: (int newindex) {
            setState(() {
              index = newindex;
            });
          },
          backgroundColor: Colors.transparent,
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
    );
  }
}
