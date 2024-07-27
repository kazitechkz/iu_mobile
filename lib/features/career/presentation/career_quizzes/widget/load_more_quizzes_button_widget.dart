import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../domain/parameters/get_career_quizzes_parameter.dart';
import '../bloc/career_quizzes_bloc.dart';

class LoadMoreQuizzesButton extends StatelessWidget {
  const LoadMoreQuizzesButton({super.key, required this.page});
  final page;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          context.read<CareerQuizzesBloc>().add(GetCareerQuizzesEvent(
              GetCareerQuizzesParameter(page: this.page)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.w),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorConstant.appBarColor, ColorConstant.peachColor],
            ),
            boxShadow: const [
              BoxShadow(
                color: ColorConstant.darkOrangeColor,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 8.0,
              )
            ],
          ),
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  "Загрузить еще",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
