import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/widgets/header_title.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_state.dart';
import 'package:iu/features/unt/presentation/unt_full/bloc/unt_full_bloc.dart';

import '../../../../core/utils/toasters.dart';
import '../../domain/entities/attempt_common_entity.dart';
import '../../domain/entities/question_entity.dart';
import 'bloc/pass_attempt_bloc.dart';
import 'bloc/pass_attempt_event.dart';

class PassUntScreen extends StatefulWidget {
  final int attemptId;

  const PassUntScreen({super.key, required this.attemptId});

  @override
  State<PassUntScreen> createState() => _PassUntScreenState();
}

class _PassUntScreenState extends State<PassUntScreen> {
  void initState() {
    super.initState();
    context
        .read<PassAttemptBloc>()
        .add(PassAttemptGetByAttemptIdEvent(widget.attemptId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PassAttemptBloc, PassAttemptState>(
      listener: (context, state) {
        if (state is PassAttemptSuccessState) {}
      },
      builder: (context, state) {
        if (state is PassAttemptFailedState) {
          AppToaster.showError(state.failureData.message ?? "Error");
        }
        if (state is PassAttemptSuccessState) {
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
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              stops: [0.1, 0.9],
                              colors: ColorConstant.violetToPinkGradient),
                          borderRadius: BorderRadius.circular(10.w)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeaderTitle(
                              title: "Полная сдача ЕНТ",
                              fontSize: 22.sp,
                              color: Colors.white),
                          SizedBox(
                            height: 10,
                          ),
                          TimerCountdown(
                            colonsTextStyle:
                                TextStyle(color: Colors.white, fontSize: 22.sp),
                            timeTextStyle:
                                TextStyle(color: Colors.white, fontSize: 22.sp),
                            descriptionTextStyle:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                            hoursDescription: "Часов",
                            minutesDescription: "Минут",
                            secondsDescription: "Секунд",
                            format: CountDownTimerFormat.hoursMinutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(milliseconds: state.attempt.timeLeft),
                            ),
                            onEnd: () {
                              print("Timer finished");
                            },
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
                        hint: const Row(
                          children: [
                            Icon(
                              Icons.list,
                              size: 16,
                              color: ColorConstant.linkColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Выберите дисциплину',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.linkColor,
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
                                color: Colors
                                    .deepPurple, // Assume ColorConstant.lightViolet is similar
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        value: state.subjectId ?? 0,
                        onChanged: (int? value) {
                          print(value);
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 40.h,
                          width: 320.w,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: ColorConstant.lightViolet,
                            ),
                            color: Colors.white,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: ColorConstant.orangeColorLight,
                          iconDisabledColor: ColorConstant.lightViolet,
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
                    Container(
                      height: 40.h,
                      width: 320.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            state.attempt.subjectQuestions[0].question.length ??
                                1,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: SizedBox(
                              height: 40.h,
                              width: 40.h,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorConstant.lightPink,
                                    borderRadius: BorderRadius.circular(30.w)),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 500.h,
                        enableInfiniteScroll: false,
                      ),
                      items: state.attempt
                          .subjectQuestions[state.subjectId ?? 0].question
                          .map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.amber),
                                child: Column(
                                  children: [
                                    Container(
                                      child: TeXView(
                                          renderingEngine: TeXViewRenderingEngine.mathjax(),
                                          child: TeXViewDocument(
                                              i.text.replaceAll("<pre>", r"$$")
                                          ),
                                        style: TeXViewStyle(
                                          contentColor: Colors.black
                                        ),
                                      )
                                    )
                                  ],
                                ));
                          },
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
