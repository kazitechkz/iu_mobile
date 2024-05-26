import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: AnimatedBottomNavigationBar.builder(
          height: 70,
          backgroundColor: ColorConstant.appBarColor,
          tabBuilder: (int index, bool isActive) {
            return Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:
                      isActive ? ColorConstant.orangeColor : Colors.transparent,
                ),
                child: GestureDetector(
                  onTap: () {
                    _onTap(context, index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconList[index],
                        size: 20,
                        color:
                            isActive ? Colors.white : ColorConstant.grayColor,
                      ),
                      Text(
                        iconLabel[index],
                        style: TextStyle(
                          fontSize: 10.sp,
                          color:
                              isActive ? Colors.white : ColorConstant.grayColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          elevation: 4,
          activeIndex: widget.navigationShell.currentIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) => {},
          itemCount: iconList.length,
          splashColor: ColorConstant.orangeColor,
          //other params
        ),
      ),
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
    FontAwesomeIcons.dumbbell,
    FontAwesomeIcons.user,
  ];
  List<String> iconLabel = ["Главная", "Обучение", "Тренажер", "Профиль"];
  List<String> routingName = [
    RouteConstant.dashboardScreenName,
    RouteConstant.stepsScreenName,
    RouteConstant.authScreenName,
    RouteConstant.profileScreenName
  ];
}
