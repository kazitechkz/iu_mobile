import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20.h ),
          child: Image(image: AssetImage(data.image),height: 250.h),
        ),
        Padding(
            padding: EdgeInsets.only(left: 20.w,right: 20.w),
          child: Column(
            children: [
              Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 32
              ),
            ),
              SizedBox(height: 20.h),
              Text(
                data.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                    fontSize: 22
                ),
              ),
              SizedBox(height: 20.h,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  backgroundColor: ColorConstant.violetFirst
                ),
                  onPressed: (){
                  if(isLast){
                    context.read<WelcomeBloc>().add(const WelcomeCacheEvent());
                  }
                  else{
                    pageController.animateToPage(index, duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
                  }
                  },
                  child: Text(
                    ( isLast == true ? "Приступить  к работе" : "Далее"),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 25
                    ),
                  )

              )

            ],
          ),

        )
      ],
    );
  }
}
