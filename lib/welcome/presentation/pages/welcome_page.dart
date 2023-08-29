import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu_front/welcome/presentation/bloc/welcome_bloc.dart';
import 'package:iu_front/welcome/presentation/widgets/welcome_widget.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../core/constants/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int maxCount = 3;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              child:
              Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        BlocProvider.of<WelcomeBloc>(context).add(
                            WelcomePageChangeEvent(index: index));
                      },
                      children: [
                        WelcomeWidget(
                          image_url: BearImages.KOALA_1,
                          text: "Тренируйся и набирай высший балл на ЕНТ вместе с ",
                          main_text: "IU",
                          index: 1,
                          pageController: _pageController,
                          buttonText: "Далее ",
                        ),
                        WelcomeWidget(
                          image_url: BearImages.KOALA_2,
                          text: "Проходи шаг за шагом и эффективно готовься к  ",
                          main_text: "ЕНТ",
                          index: 2,
                          pageController: _pageController,
                          buttonText: "Далее ",
                        ),
                        WelcomeWidget(
                          image_url: BearImages.KOALA_3,
                          text: "IU даст советы и подсказки, чтобы получить желанный  ",
                          main_text: "ГРАНТ",
                          index: 3,
                          pageController: _pageController,
                          buttonText: "Далее ",
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 100,
                      child: PageViewDotIndicator(
                        currentItem: state.index,
                        count: 3,
                        unselectedColor: Colors.black26,
                        selectedColor: Colors.indigo,
                        duration: const Duration(milliseconds: 200),
                        unselectedSize: Size(10, 10),
                        size: Size(12, 12),
                        boxShape: BoxShape.circle,
                      ),
                    ),
                  ]

              ),


            ),
          );
        },
      ),
    );
  }
}
