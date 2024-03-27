import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../core/app_constants/color_constant.dart';
import '../../domain/entities/WelcomeEntity.dart';
import '../bloc/welcome_bloc.dart';

class OnWelcomeWidget extends StatelessWidget {
  const OnWelcomeWidget({super.key,required this.data,required this.pageController,required this.index, required this.isLast});
  final WelcomeEntity data;
  final PageController pageController;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(data.image, fit: BoxFit.contain,),
        ),
        SizedBox(height: 10.h,),
        Text(data.title, style: TextStyle(
            color: ColorConstant.mainDarkColor,
            fontSize: 28.sp,
            fontWeight: FontWeight.normal
        ),),
        SizedBox(height: 10.h,),
        Container(
          alignment: Alignment.center,
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(data.description, textAlign: TextAlign.center, style: TextStyle(
              color: ColorConstant.grayDarkColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal
          ),),
        ),
        SizedBox(height: 70.h,),
        GestureDetector(
          onTap: () {
            if(isLast){
              context.read<WelcomeBloc>().add(const WelcomeCacheEvent());
            }
            else{
              pageController.animateToPage(index, duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
            }
          },
          child: CircularPercentIndicator(
            radius: 70.0,
            lineWidth: 7.0,
            animation: true,
            percent: 0.33,
            center: Container(
              child: Text('Next'),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: ColorConstant.orangeColorDark,
          ),
          // child: Container(
          //   margin: EdgeInsets.only(top: 150.h, left: 25.w, right: 25.w),
          //   width: 325.w,
          //   height: 50.h,
          //   decoration: BoxDecoration(
          //       color: ColorConstant.violetFirst,
          //       borderRadius: BorderRadius.all(Radius.circular(15.w)),
          //       boxShadow: [
          //         BoxShadow(
          //             color: Colors.grey.withOpacity(0.1),
          //             spreadRadius: 1,
          //             blurRadius: 2,
          //             offset: const Offset(0, 1)
          //         )
          //       ]
          //   ),
          //   child: Center(
          //     child: Text(( isLast == true ? "Приступить  к работе" : "Далее"), style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 16.sp,
          //         fontWeight: FontWeight.normal
          //     )),
          //   ),
          // ),
        )
      ],
    );
  }
}
