import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/utils/toasters.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../../../core/widgets/header_title.dart';
import '../../domain/entities/attempt_common_entity.dart';
import 'bloc/attempt_work_over_failure_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AttemptWorkOverFailureScreen extends StatefulWidget {
  const AttemptWorkOverFailureScreen({super.key, required this.attemptId});
  final int attemptId;
  @override
  State<AttemptWorkOverFailureScreen> createState() =>
      _AttemptWorkOverFailureScreenState();
}

class _AttemptWorkOverFailureScreenState
    extends State<AttemptWorkOverFailureScreen> {
  CarouselController attemptCarouselController = CarouselController();
  CarouselController paginationCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    context
        .read<AttemptWorkOverFailureBloc>()
        .add(AttemptWorkOverFailureGetByAttemptIdEvent(widget.attemptId));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    context
        .read<AttemptWorkOverFailureBloc>()
        .add(AttemptWorkOverFailureGetByAttemptIdEvent(widget.attemptId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        text: "Результат сдачи",
        imageUrl: "assets/images/icons/stat.webp",
        routeLink:
            RouteConstant.attemptResultByAttemptIdName + "/${widget.attemptId}",
      ),
      body:
          BlocConsumer<AttemptWorkOverFailureBloc, AttemptWorkOverFailureState>(
        listener: (context, state) {
          if (state is AttemptWorkOverFailureFailedState) {
            print(state.failureData);
          }
        },
        builder: (context, state) {
          if (state is AttemptWorkOverFailureFailedState) {
            AppToaster.showError(state.failureData.message ?? "Error");
          }
          if (state is AttemptWorkOverFailureSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 120.h,
                        width: 320.w,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                stops: [
                                  0.1,
                                  0.9
                                ],
                                colors: [
                                  ColorConstant.darkOrangeColor,
                                  ColorConstant.orangeColor
                                ]),
                            borderRadius: BorderRadius.circular(10.w)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeaderTitle(
                                title:
                                    AppLocalizations.of(context)!.full_pass_unt,
                                fontSize: 22.sp,
                                color: Colors.white),
                            const SizedBox(
                              height: 10,
                            ),
                            TimerCountdown(
                              colonsTextStyle: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                              timeTextStyle: TextStyle(
                                  color: Colors.white, fontSize: 22.sp),
                              descriptionTextStyle: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                              hoursDescription: "Часов",
                              minutesDescription: "Минут",
                              secondsDescription: "Секунд",
                              format: CountDownTimerFormat.hoursMinutesSeconds,
                              endTime: DateTime.now().add(
                                Duration(milliseconds: state.result.timeLeft),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<int>(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              const Icon(
                                Icons.list,
                                size: 16,
                                color: ColorConstant.darkOrangeColor,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .select_discipline,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstant.darkOrangeColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: state.attempt.subjectQuestions
                              .asMap()
                              .entries
                              .map((entry) {
                            int idx = entry.key;
                            SubjectQuestionEntity question = entry.value;
                            return DropdownMenuItem<int>(
                              value: idx,
                              child: Text(
                                question.titleRu,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant
                                      .darkOrangeColor, // Assume ColorConstant.lightViolet is similar
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          value: state.subjectId ?? 0,
                          onChanged: (int? value) {
                            context.read<AttemptWorkOverFailureBloc>().add(
                                AttemptWorkOverFailureChangeSubjectEvent(
                                    value ?? 0));
                            attemptCarouselController.jumpToPage(0);
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 40.h,
                            width: 320.w,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: ColorConstant.darkOrangeColor),
                              color: Colors.white,
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                            iconSize: 14,
                            iconEnabledColor: ColorConstant.darkOrangeColor,
                            iconDisabledColor: ColorConstant.orangeColor,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 320.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              color: Colors.white,
                            ),
                            offset: const Offset(0, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 60,
                        width: 320.w,
                        child: ExpandableCarousel.builder(
                          options: CarouselOptions(
                              pageSnapping: false,
                              enlargeCenterPage: true,
                              disableCenter: true,
                              controller: paginationCarouselController,
                              viewportFraction: 0.15,
                              showIndicator: false,
                              onPageChanged: (int index,
                                  CarouselPageChangedReason reason) {
                                attemptCarouselController.jumpToPage(index);
                              }),
                          itemCount: state
                              .attempt
                              .subjectQuestions[state.subjectId ?? 0]
                              .question
                              .length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: InkWell(
                                onTap: () {
                                  attemptCarouselController
                                      .jumpToPage(pageViewIndex);
                                },
                                child: SizedBox(
                                  height: 40.0,
                                  width: 40.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.yellowAccent,
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Center(
                                      child: Text(
                                        (pageViewIndex + 1).toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
