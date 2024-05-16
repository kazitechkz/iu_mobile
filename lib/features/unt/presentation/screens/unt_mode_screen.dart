import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/font_constants.dart';
import 'package:iu/core/app_constants/image_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';

class UntModeScreen extends StatelessWidget {
  const UntModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
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
                        AutoSizeText(
                          "Сдать Полный Тест ЕНТ",
                          style: TextStyle(
                              color: ColorConstant.grayColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            context.go("/${RouteConstant.untFullScreenName}");
                          },
                          child: Container(
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
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: () {
                        context.go("/${RouteConstant.untFullScreenName}");
                      },
                      child: Container(
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.h, right: 10.w),
                                            child: Icon(FontAwesomeIcons.book,
                                                color: Colors.white,
                                                size: 12.sp),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Полный тест ЕНТ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                        fontFamily:
                                                            FontConstant.SFPro,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  WidgetSpan(
                                                    child: Text(
                                                      "3 обязательных + 2 основных",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.h, right: 10.w),
                                            child: Icon(
                                                FontAwesomeIcons.language,
                                                color: Colors.white,
                                                size: 12.sp),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "Казахский и Русский языки",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                        fontFamily:
                                                            FontConstant.SFPro,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.h, right: 10.w),
                                            child: Icon(
                                                FontAwesomeIcons.boxesPacking,
                                                color: Colors.white,
                                                size: 12.sp),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  WidgetSpan(
                                                    child: Text(
                                                      "Более 50 000 вопросов",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Image.asset(
                                        ImageConstant.AuthBear,
                                        fit: BoxFit.contain,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
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
                        AutoSizeText(
                          "Сдать тест по 1 предмету",
                          style: TextStyle(
                              color: ColorConstant.grayColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            context.go("/${RouteConstant.untSingleScreenName}");
                          },
                          child: Container(
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
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: () {
                        context.go("/${RouteConstant.untSingleScreenName}");
                      },
                      child: Container(
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.h, right: 10.w),
                                            child: Icon(FontAwesomeIcons.book,
                                                color: Colors.white,
                                                size: 12.sp),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "Полный тест по 1 дисциплине",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                        fontFamily:
                                                            FontConstant.SFPro,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.h, right: 10.w),
                                            child: Icon(
                                                FontAwesomeIcons.language,
                                                color: Colors.white,
                                                size: 12.sp),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "Казахский и Русский языки",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                        fontFamily:
                                                            FontConstant.SFPro,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.h, right: 10.w),
                                            child: Icon(
                                                FontAwesomeIcons.percent,
                                                color: Colors.white,
                                                size: 12.sp),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  WidgetSpan(
                                                    child: Text(
                                                      "Полная статистика и работа над ошибками",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Image.asset(
                                        ImageConstant.AuthBear,
                                        fit: BoxFit.contain,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
