import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/app_constants/color_constant.dart';
import '../../domain/entities/WelcomeEntity.dart';
import '../bloc/welcome_bloc.dart';
import '../widgets/on_welcome_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<WelcomeBloc>().add(const WelcomeCheckVisitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WelcomeBloc, WelcomeState>(
        listener: (context, state) {
          if (state is WelcomeCheckedState && state.isVisited) {
            context.pushReplacementNamed(RouteConstant.authScreenName);
          }
          if (state is WelcomeCachedState) {
            context.pushReplacementNamed(RouteConstant.authScreenName);
          }
        },
        builder: (context, state) {
          if (state is WelcomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WelcomeFailedState) {
          } else if (state is WelcomeInitialState) {
            return Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: PageView(
                      onPageChanged: (int? number) {
                        context
                            .read<WelcomeBloc>()
                            .add(WelcomePageEvent(number ?? 0));
                      },
                      controller: pageController,
                      children: [
                        OnWelcomeWidget(
                          data: const WelcomeEntity.first(),
                          pageController: pageController,
                          index: 1,
                          isLast: false,
                        ),
                        OnWelcomeWidget(
                          data: const WelcomeEntity.second(),
                          pageController: pageController,
                          index: 2,
                          isLast: false,
                        ),
                        OnWelcomeWidget(
                          data: const WelcomeEntity.third(),
                          pageController: pageController,
                          index: 2,
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            onDotClicked: (index) {
                              pageController.animateToPage(index,
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.easeInOut);
                            },
                            effect: const ExpandingDotsEffect(
                                dotHeight: 15,
                                dotWidth: 15,
                                dotColor: ColorConstant.violetFirst,
                                spacing: 25,
                                activeDotColor: ColorConstant.orangeColorDark),
                          ),
                        ])),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Transform.rotate(
                              angle: 405,
                              child: CircularProgressIndicator(
                                strokeAlign: 4,
                                value: (state.currentPage + 1) / 3,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  backgroundColor: ColorConstant.violetFirst),
                              onPressed: () {
                                if (state.currentPage >= 2) {
                                  context
                                      .read<WelcomeBloc>()
                                      .add(WelcomeCacheEvent());
                                } else {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      curve: Curves.easeInOut);
                                }
                              },
                              child: Text(
                                AppLocalizations.of(context)!.next,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
