import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/image_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/widgets/elevated_button_common.dart';
import 'package:iu/core/widgets/elevated_gradient_button.dart';
import 'package:iu/core/widgets/header_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iu/core/widgets/sub_header_title.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Image.asset(
                  ImageConstant.AuthBear,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeaderTitle(title: AppLocalizations.of(context)!.welcome),
                  SizedBox(
                    height: 10.h,
                  ),
                  SubHeaderTitle(
                      title: AppLocalizations.of(context)!.sign_in_to_continue),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedCommonButton(
                    color: ColorConstant.violetFirst,
                    width: 220.w,
                    height: 50.h,
                    horizontal: 10.w,
                    vertical: 10.h,
                    borderRadius: 40.sp,
                    child: Text(
                      AppLocalizations.of(context)!.sign_in,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    onPressed: () {
                      context.pushReplacement(
                          "/${RouteConstant.signInScreenName}");
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: TextStyle(
                        color: ColorConstant.grayDarkColor, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedGradientButton(
                      gradient: const LinearGradient(
                        colors: ColorConstant.violetToPinkGradient,
                      ),
                      width: 220.w,
                      height: 50.h,
                      borderRadius: 40.sp,
                      onPressed: () {
                        context.pushReplacement(
                            "/${RouteConstant.signUpScreenName}");
                      },
                      child: Text(
                        AppLocalizations.of(context)!.sign_up,
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
