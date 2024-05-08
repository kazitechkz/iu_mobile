import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/color_constant.dart';

class TournamentListCarousel extends StatefulWidget {
  const TournamentListCarousel({super.key});

  @override
  State<TournamentListCarousel> createState() => _TournamentListCarouselState();
}

class _TournamentListCarouselState extends State<TournamentListCarousel> {
  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
        items: [
          _getCarouselSlider("Ценные призы, главный приз до 1 млн тенге",
              "assets/images/many-mode.webp"),
          _getCarouselSlider("Турниры по 16 различным предметам ",
              "assets/images/many-mode.webp"),
          _getCarouselSlider(
              "До 1000 активных участников", "assets/images/many-mode.webp"),
        ],
        options: CarouselOptions(
            height: 240.h,
            aspectRatio: 1.0,
            viewportFraction: 1,
            indicatorMargin: 15.0,
            slideIndicator: CircularSlideIndicator(
                indicatorBackgroundColor: Colors.white,
                currentIndicatorColor: ColorConstant.violetFirst)));
  }

  Widget _getCarouselSlider(String title, String imageAssets) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imageAssets),
            fit: BoxFit.cover,
            opacity: 0.8,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                  0.5), // Adjust the opacity to control the darkness
              BlendMode.darken,
            )),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 2.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 1.0),
          )
        ],
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: FractionallySizedBox(
        widthFactor: 1, // between 0 and 1 // 1 for max
        heightFactor: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
