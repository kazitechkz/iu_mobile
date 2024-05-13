import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/providers/user_provider.dart';

import '../../../core/common/widgets/bottom_nav_bar.dart';
import '../../menu_services/domain/entities/main_service_entity.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final services = MainServiceEntity.getServices();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320.h,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    ColorConstant.appBarColor,
                    ColorConstant.backgroundColor,
                  ])),
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/planet3d.webp",
                        height: 280.h,
                      )),
                  Positioned(
                      top: 50.h,
                      left: 10.w,
                      child: Container(
                        width: 160.w,
                        child: Text(
                          "Привет, Дорогой Абитуриент!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorConstant.grayColor,
                              fontSize: 20.sp),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              transform: Matrix4.translationValues(0.0, -10.0, 0.0),
              constraints: BoxConstraints(minHeight: 150.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.w),
                color: ColorConstant.blackColor,
              ),
              child: Container(
                constraints: BoxConstraints(minHeight: 120.h),
                child: Center(
                  child: ExpandableCarousel(
                    options: CarouselOptions(
                      padEnds: false,
                      disableCenter: true,
                      viewportFraction: 1,
                      showIndicator: false,
                      slideIndicator: const CircularSlideIndicator(
                          indicatorRadius: 4,
                          indicatorBackgroundColor: ColorConstant.grayColor,
                          currentIndicatorColor: ColorConstant.darkOrangeColor),
                    ),
                    items: services.map((List<MainServiceEntity> serviceItems) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: serviceItems
                                .map((serviceItem) => Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                              serviceItem.image,
                                            ),
                                            fit: BoxFit.contain,
                                          )),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AutoSizeText(
                                          serviceItem.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12.sp),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )))
                                .toList(),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
