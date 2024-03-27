
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/widgets/gradient_background.dart';
import '../../domain/entities/WelcomeEntity.dart';
import '../bloc/welcome_bloc.dart';
import '../widgets/on_welcome_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController pageController = PageController();
  @override
  void initState(){
    super.initState();
    context.read<WelcomeBloc>().add(const WelcomeCheckVisitEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WelcomeBloc, WelcomeState>(
        listener: (context, state) {
          if(state is WelcomeCheckedState && state.isVisited){
            print('test');
          }
          // if(state is WelcomeCachedState){
          //   print('test2');
          // }
        },
        builder: (context, state) {
          // if(state is WelcomeCheckedState || state is WelcomeCachedState){
          //   return Container();
          // }
          // if(state is WelcomeFailedState){
          //   return const Text('');
          // }
          return GradientBackground(
            image: 'assets/images/new-bg.webp',
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  children:[
                    OnWelcomeWidget(data: const WelcomeEntity.first(),pageController: pageController,index: 1, isLast: false,),
                    OnWelcomeWidget(data: const WelcomeEntity.second(),pageController: pageController,index: 2, isLast: false,),
                    OnWelcomeWidget(data: const WelcomeEntity.third(),pageController: pageController,index: 2, isLast: true,),
                  ],
                ),
                Positioned(
                  bottom: 200.h,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    onDotClicked: (index){
                      pageController.animateToPage(index, duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
                    },
                    effect: const ExpandingDotsEffect(
                        dotHeight:15,
                        dotWidth: 15,
                        dotColor: ColorConstant.violetFirst,
                        spacing: 25,
                        activeDotColor: ColorConstant.orangeColorDark
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
