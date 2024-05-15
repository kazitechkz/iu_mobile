import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
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
              height: 660.h,
              child: Stack(
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
                  Positioned(
                      top: 450.h,
                      child: Container(
                        height: 220.h,
                        width: MediaQuery.of(context).size.width,
                        transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                        child: FlutterCarousel(
                          options: CarouselOptions(
                            padEnds: false,
                            viewportFraction: 1,
                            aspectRatio: 1,
                            height: 220.0.h,
                            showIndicator: true,
                            slideIndicator: const CircularSlideIndicator(
                                padding: EdgeInsets.only(bottom: 20),
                                indicatorRadius: 5,
                                indicatorBackgroundColor:
                                    ColorConstant.grayColor,
                                currentIndicatorColor:
                                    ColorConstant.darkOrangeColor),
                          ),
                          items: [
                            1,
                            2,
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/banner_${i}.webp"),
                                          fit: BoxFit.cover)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: AutoSizeText(
                                          i == 1
                                              ? "Готовься к ЕНТ Вместе с iU-test, более 50 тысяч вопросов по 16 предметам"
                                              : "Зарабатывай IU Coins и обменивай на ценные призы",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp),
                                        ),
                                      )),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      )),
                  Positioned(
                    top: 310.h,
                    child: Container(
                      height: 140.h,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      constraints: BoxConstraints(minHeight: 140.h),
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
                                  indicatorBackgroundColor:
                                      ColorConstant.grayColor,
                                  currentIndicatorColor:
                                      ColorConstant.darkOrangeColor),
                            ),
                            items: services
                                .map((List<MainServiceEntity> serviceItems) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: serviceItems
                                        .map((serviceItem) => Expanded(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                    context.go('/${serviceItem.routeName}');
                                                  },
                                                  child: Container(
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
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                AutoSizeText(
                                                  serviceItem.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w300,
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              transform: Matrix4.translationValues(0.0, -20.h, 0.0),
              constraints: BoxConstraints(minHeight: 240.h),
              decoration: BoxDecoration(
                color: ColorConstant.bottomBarColor,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                "assets/images/icons/education.webp",
                              ),
                              fit: BoxFit.contain,
                            )),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Обучение",
                            style: TextStyle(
                                color: ColorConstant.grayColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: ColorConstant.backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Подробнее",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ))
                            ]),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 180.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorConstant.orangeColor,
                              ColorConstant.appBarColor,
                            ])),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  "Обучение",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                                SizedBox(height: 10.h,),
                                AutoSizeText(
                                  "Готовься к ЕНТ по материалам из более чем 16 предметам",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Image.asset(
                            "assets/images/study_bear.webp",
                            height: 180.h,
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              transform: Matrix4.translationValues(0.0, 0, 0.0),
              constraints: BoxConstraints(minHeight: 240.h),
              decoration: BoxDecoration(
                color: ColorConstant.bottomBarColor,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/icons/training.webp",
                                  ),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "ЕНТ Тренажер",
                            style: TextStyle(
                                color: ColorConstant.grayColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: ColorConstant.backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Подробнее",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ))
                            ]),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 180.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorConstant.darkOrangeColor,
                              ColorConstant.appBarColor,
                            ])),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "ЕНТ Тренажер",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 10.h,),
                                    AutoSizeText(
                                      "Более 50 тысяч вопросов по более чем 16 дисциплинам",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Image.asset(
                                "assets/images/train-bear.webp",
                                height: 180.h,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              transform: Matrix4.translationValues(0.0, 0, 0.0),
              constraints: BoxConstraints(minHeight: 240.h),
              decoration: BoxDecoration(
                color: ColorConstant.bottomBarColor,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/icons/tournament.webp",
                                  ),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Турнир",
                            style: TextStyle(
                                color: ColorConstant.grayColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: ColorConstant.backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Подробнее",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ))
                            ]),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 180.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorConstant.violetColor,
                              ColorConstant.appBarColor,
                            ])),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Турниры",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 10.h,),
                                    AutoSizeText(
                                      "Участвуйте в турнирах и выигрываете ценные призы",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Image.asset(
                                "assets/images/tournament_bear.webp",
                                height: 180.h,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              transform: Matrix4.translationValues(0.0, 0, 0.0),
              constraints: BoxConstraints(minHeight: 240.h),
              decoration: BoxDecoration(
                color: ColorConstant.bottomBarColor,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/icons/battle.webp",
                                  ),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Battle ЕНТ",
                            style: TextStyle(
                                color: ColorConstant.grayColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: ColorConstant.backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Подробнее",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ))
                            ]),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 180.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorConstant.redColor,
                              ColorConstant.appBarColor,
                            ])),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Battle ЕНТ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 10.h,),
                                    AutoSizeText(
                                      "Сражайся с другими игроками и выигрывай ценные призы",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Image.asset(
                                "assets/images/battle_bear.webp",
                                height: 180.h,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              transform: Matrix4.translationValues(0.0, 0, 0.0),
              constraints: BoxConstraints(minHeight: 240.h),
              decoration: BoxDecoration(
                color: ColorConstant.bottomBarColor,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/icons/wallet.webp",
                                  ),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Кошелек",
                            style: TextStyle(
                                color: ColorConstant.grayColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: ColorConstant.backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Подробнее",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ))
                            ]),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 180.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorConstant.lightBlueColor,
                              ColorConstant.appBarColor,
                            ])),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Кошелек",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 10.h,),
                                    AutoSizeText(
                                      "Набирайте IU Coins и обменивайте их на ценные призы",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Image.asset(
                                "assets/images/wallet.webp",
                                height: 180.h,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              transform: Matrix4.translationValues(0.0, 0, 0.0),
              constraints: BoxConstraints(minHeight: 240.h),
              decoration: BoxDecoration(
                color: ColorConstant.bottomBarColor,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/icons/career.webp",
                                  ),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Карьера",
                            style: TextStyle(
                                color: ColorConstant.grayColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: ColorConstant.backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Подробнее",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ))
                            ]),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 180.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorConstant.violetColor,
                              ColorConstant.appBarColor,
                            ])),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Карьера",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 10.h,),
                                    AutoSizeText(
                                      "Пройдите профориентационные тесты и начните лучше себя понимать",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Image.asset(
                                "assets/images/career_bear.webp",
                                height: 180.h,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              transform: Matrix4.translationValues(0.0, 0, 0.0),
              constraints: BoxConstraints(minHeight: 240.h),
              decoration: BoxDecoration(
                color: ColorConstant.bottomBarColor,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/icons/forum.webp",
                                  ),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Форум",
                            style: TextStyle(
                                color: ColorConstant.grayColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: ColorConstant.backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Подробнее",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ))
                            ]),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 180.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorConstant.pinkColor,
                              ColorConstant.appBarColor,
                            ])),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Форум",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 10.h,),
                                    AutoSizeText(
                                      "Есть вопросы? Задайте на нашем форуме и получите ответы от других участников",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Image.asset(
                                "assets/images/forum_bear.webp",
                                height: 180.h,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              transform: Matrix4.translationValues(0.0, 0, 0.0),
              constraints: BoxConstraints(minHeight: 240.h),
              decoration: BoxDecoration(
                color: ColorConstant.bottomBarColor,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/icons/techsupport.webp",
                                  ),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Техподдержка",
                            style: TextStyle(
                                color: ColorConstant.grayColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: ColorConstant.backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Подробнее",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ))
                            ]),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 180.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorConstant.lightBlueColor,
                              ColorConstant.appBarColor,
                            ])),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "Техподдержка",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    SizedBox(height: 10.h,),
                                    AutoSizeText(
                                      "Проблемы с сайтом или приложением? Задайте вопрос нашим специалистам!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Image.asset(
                                "assets/images/forum_bear.webp",
                                height: 180.h,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
