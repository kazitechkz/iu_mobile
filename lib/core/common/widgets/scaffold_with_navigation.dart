import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';

import 'bottom_nav_bar.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: navigationShell.currentIndex == 1
            ? ColorConstant.violetFirst
            : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.layerGroup,
              size: 20,
              color: navigationShell.currentIndex == 1
                  ? Colors.white
                  : ColorConstant.borderGrayColor,
            ),
            Text(
              "Сервисы",
              style: TextStyle(
                fontSize: 10.sp,
                color: navigationShell.currentIndex == 1
                    ? Colors.white
                    : ColorConstant.borderGrayColor,
              ),
            )
          ],
        ),
        onPressed: () {
          context.goNamed(RouteConstant.servicesScreenName);
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(navigationShell: navigationShell),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
}
