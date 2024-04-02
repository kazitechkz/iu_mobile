import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      height: 60.w,
      tabBuilder: (int index, bool isActive) {
        return GestureDetector(
          onTap: () {
            _onTap(context, index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: 20,
                color: isActive
                    ? ColorConstant.violetFirst
                    : ColorConstant.borderGrayColor,
              ),
              Text(
                iconLabel[index],
                style: TextStyle(
                  fontSize: 10.sp,
                  color: isActive
                      ? ColorConstant.violetFirst
                      : ColorConstant.borderGrayColor,
                ),
              )
            ],
          ),
        );
      },
      elevation: 12,
      activeIndex: widget.navigationShell.currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 24,
      rightCornerRadius: 24,
      onTap: (index) => {},
      itemCount: iconList.length,
      //other params
    );
  }

  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  List<IconData> iconList = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.book,
    FontAwesomeIcons.wandSparkles,
    FontAwesomeIcons.user,
  ];
  List<String> iconLabel = ["Главная", "Обучение", "Battle", "Профиль"];
  List<String> routingName = [
    RouteConstant.dashboardScreenName,
    RouteConstant.stepsScreenName,
    RouteConstant.authScreenName,
    "Профиль"
  ];
}
