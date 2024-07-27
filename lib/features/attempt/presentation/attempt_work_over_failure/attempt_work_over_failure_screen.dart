import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/helpers/str_helper.dart';
import 'package:iu/features/attempt/presentation/attempt_work_over_failure/widget/answered_button_widget.dart';
import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/helpers/mathjax_helper.dart';
import '../../../../core/utils/toasters.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../../../core/widgets/elevated_gradient_button.dart';
import '../../../../core/widgets/header_title.dart';
import '../../domain/entities/attempt_common_entity.dart';
import '../../domain/entities/attempt_question_entity.dart';
import '../../domain/entities/question_entity.dart';
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
          if (state is AttemptWorkOverFailureFailedState) {}
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
                        constraints: BoxConstraints(minHeight: 120.h),
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
                            AutoSizeText(
                              StrHelper.toHourMinutesSeconds(
                                  state.result.time, state.result.timeLeft),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              "${state.result.points}/${state.result.maxPoints} баллов",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold),
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
                            final activeQuestion = state
                                .attempt
                                .subjectQuestions[state.subjectId ?? 0]
                                .question[itemIndex];
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
                                        color: _getPaginationMainColor(
                                            activeQuestion,
                                            state.attemptQuestions),
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Center(
                                      child: Text(
                                        (pageViewIndex + 1).toString(),
                                        style: TextStyle(
                                            color: Colors.white,
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
                      ExpandableCarousel.builder(
                        options: CarouselOptions(
                            controller: attemptCarouselController,
                            viewportFraction: 1.0,
                            showIndicator: false,
                            onPageChanged:
                                (int index, CarouselPageChangedReason reason) {
                              context.read<AttemptWorkOverFailureBloc>().add(
                                  AttemptWorkOverFailureSliderChangeEvent(
                                      index));
                              paginationCarouselController.jumpToPage(index);
                            }),
                        itemCount: state
                            .attempt
                            .subjectQuestions[state.subjectId ?? 0]
                            .question
                            .length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          final activeQuestion = state
                              .attempt
                              .subjectQuestions[state.subjectId ?? 0]
                              .question[itemIndex];
                          final attemptQuestion = state.attemptQuestions
                              .where((element) =>
                                  element.questionId == activeQuestion.id)
                              .first;
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        stops: const [
                                          0.1,
                                          0.9
                                        ],
                                        colors: [
                                          _getPaginationMainColor(
                                              activeQuestion,
                                              state.attemptQuestions),
                                          ColorConstant.appBarColor,
                                        ]),
                                    borderRadius: BorderRadius.circular(10.w)),
                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: 200.h,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 10.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${AppLocalizations.of(context)!.question} ${pageViewIndex + 1}/${state.attempt.subjectQuestions[state.subjectId ?? 0].question.length}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 18.sp),
                                                textAlign: TextAlign.right,
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        _showExplanationSheet(
                                                            context,
                                                            activeQuestion);
                                                      },
                                                      icon: Icon(
                                                        FontAwesomeIcons
                                                            .checkDouble,
                                                        size: 18.sp,
                                                        color: Colors.white,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        _showBottomSheet(
                                                            context,
                                                            activeQuestion);
                                                      },
                                                      icon: Icon(
                                                        FontAwesomeIcons
                                                            .question,
                                                        size: 18.sp,
                                                        color: Colors.white,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                AttemptWorkOverFailureBloc>()
                                                            .add(AttemptWorkOverFailureSaveQuestionEvent(
                                                                activeQuestion
                                                                    .id));
                                                      },
                                                      icon: Icon(
                                                        FontAwesomeIcons.star,
                                                        size: 18.sp,
                                                        color: state
                                                                .savedQuestionId
                                                                .contains(
                                                                    activeQuestion
                                                                        .id)
                                                            ? ColorConstant
                                                                .orangeColorDark
                                                            : Colors.white,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          HtmlWidget(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp),
                                            MathJaxHelper.clearText(
                                                activeQuestion.text),
                                            customWidgetBuilder: (element) {
                                              if (element.localName == 'math' ||
                                                  element.localName == 'pre') {
                                                return Math.tex(element.text,
                                                    textStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold));
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          (activeQuestion.context != null
                                              ? HtmlWidget(
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16.sp),
                                                  MathJaxHelper.clearText(
                                                      activeQuestion.context
                                                              ?.context ??
                                                          ""),
                                                  customWidgetBuilder:
                                                      (element) {
                                                    if (element.localName ==
                                                            'math' ||
                                                        element.localName ==
                                                            'pre') {
                                                      return Math.tex(
                                                          element.text,
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold));
                                                    }
                                                    return null;
                                                  },
                                                )
                                              : const SizedBox()),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          const Divider(color: Colors.white),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          AnsweredButton(
                                              answer: activeQuestion.answerA,
                                              answerType: 'a',
                                              correctAnswer:
                                                  activeQuestion.correctAnswers,
                                              userAnswer:
                                                  attemptQuestion.userAnswer),
                                          AnsweredButton(
                                              answer: activeQuestion.answerB,
                                              answerType: 'b',
                                              correctAnswer:
                                                  activeQuestion.correctAnswers,
                                              userAnswer:
                                                  attemptQuestion.userAnswer),
                                          AnsweredButton(
                                              answer: activeQuestion.answerC,
                                              answerType: 'c',
                                              correctAnswer:
                                                  activeQuestion.correctAnswers,
                                              userAnswer:
                                                  attemptQuestion.userAnswer),
                                          AnsweredButton(
                                              answer: activeQuestion.answerD,
                                              answerType: 'd',
                                              correctAnswer:
                                                  activeQuestion.correctAnswers,
                                              userAnswer:
                                                  attemptQuestion.userAnswer),
                                          (activeQuestion.answerE != null
                                              ? AnsweredButton(
                                                  answer:
                                                      activeQuestion.answerE,
                                                  answerType: 'e',
                                                  correctAnswer: activeQuestion
                                                      .correctAnswers,
                                                  userAnswer: attemptQuestion
                                                      .userAnswer)
                                              : const SizedBox()),
                                          (activeQuestion.answerF != null
                                              ? AnsweredButton(
                                                  answer:
                                                      activeQuestion.answerF,
                                                  answerType: 'f',
                                                  correctAnswer: activeQuestion
                                                      .correctAnswers,
                                                  userAnswer: attemptQuestion
                                                      .userAnswer)
                                              : const SizedBox()),
                                          (activeQuestion.answerG != null
                                              ? AnsweredButton(
                                                  answer:
                                                      activeQuestion.answerG,
                                                  answerType: 'g',
                                                  correctAnswer: activeQuestion
                                                      .correctAnswers,
                                                  userAnswer: attemptQuestion
                                                      .userAnswer)
                                              : const SizedBox()),
                                          (activeQuestion.answerH != null
                                              ? AnsweredButton(
                                                  answer:
                                                      activeQuestion.answerH,
                                                  answerType: 'h',
                                                  correctAnswer: activeQuestion
                                                      .correctAnswers,
                                                  userAnswer: attemptQuestion
                                                      .userAnswer)
                                              : const SizedBox()),
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  (pageViewIndex > 0
                                      ? ElevatedGradientButton(
                                          onPressed: () {
                                            paginationCarouselController
                                                .jumpToPage(pageViewIndex - 1);
                                          },
                                          gradient: LinearGradient(colors: [
                                            _getPaginationMainColor(
                                                activeQuestion,
                                                state.attemptQuestions),
                                            ColorConstant.appBarColor,
                                          ]),
                                          width: 80.w,
                                          height: 40.h,
                                          borderRadius: 20.0,
                                          child: const Icon(
                                            FontAwesomeIcons.chevronLeft,
                                            color: Colors.white,
                                          ),
                                        )
                                      : SizedBox(
                                          width: 80.w,
                                          height: 40.h,
                                        )),
                                  ElevatedGradientButton(
                                    gradient: LinearGradient(colors: [
                                      _getPaginationMainColor(activeQuestion,
                                          state.attemptQuestions),
                                      ColorConstant.appBarColor,
                                    ]),
                                    width: 120.w,
                                    height: 40.h,
                                    borderRadius: 20.0,
                                    onPressed: () {},
                                    child: Text(
                                      "${(_isRight(activeQuestion, state.attemptQuestions) ? "+" : "")} ${_point(activeQuestion, state.attemptQuestions)}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16.sp),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  (pageViewIndex + 1 <
                                          (state
                                              .attempt
                                              .subjectQuestions[
                                                  state.subjectId ?? 0]
                                              .question
                                              .length)
                                      ? ElevatedGradientButton(
                                          onPressed: () {
                                            paginationCarouselController
                                                .jumpToPage(pageViewIndex + 1);
                                          },
                                          gradient: LinearGradient(colors: [
                                            _getPaginationMainColor(
                                                activeQuestion,
                                                state.attemptQuestions),
                                            ColorConstant.appBarColor,
                                          ]),
                                          width: 80.w,
                                          height: 40.h,
                                          borderRadius: 20.0,
                                          child: const Icon(
                                            FontAwesomeIcons.chevronRight,
                                            color: Colors.white,
                                          ),
                                        )
                                      : SizedBox(
                                          width: 80.w,
                                          height: 40.h,
                                        )),
                                ],
                              ),
                            ],
                          );
                        },
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

  Color _getPaginationMainColor(QuestionEntity activeQuestion,
      List<AttemptQuestionEntity> attemptQuestions) {
    AttemptQuestionEntity? attemptQuestionEntity =
        attemptQuestions.firstWhere((el) => el.questionId == activeQuestion.id);
    if (attemptQuestionEntity != null) {
      if (attemptQuestionEntity.isRight == true) {
        return ColorConstant.chemistryOne;
      } else {
        return ColorConstant.redColor;
      }
    }
    return Colors.white;
  }

  bool _isRight(QuestionEntity activeQuestion,
      List<AttemptQuestionEntity> attemptQuestions) {
    AttemptQuestionEntity? attemptQuestionEntity =
        attemptQuestions.firstWhere((el) => el.questionId == activeQuestion.id);
    if (attemptQuestionEntity != null) {
      if (attemptQuestionEntity.isRight == true) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  int _point(QuestionEntity activeQuestion,
      List<AttemptQuestionEntity> attemptQuestions) {
    AttemptQuestionEntity? attemptQuestionEntity =
        attemptQuestions.firstWhere((el) => el.questionId == activeQuestion.id);
    if (attemptQuestionEntity != null) {
      return attemptQuestionEntity.point;
    }
    return 0;
  }

  void _showBottomSheet(BuildContext context, QuestionEntity activeQuestion) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Подсказка к вопросу',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 320.w,
                ),
                activeQuestion.prompt != null
                    ? HtmlWidget(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 16.sp),
                        MathJaxHelper.clearText(activeQuestion.prompt ?? ""),
                        customWidgetBuilder: (element) {
                          if (element.localName == 'math' ||
                              element.localName == 'pre') {
                            return Math.tex(element.text,
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold));
                          }
                          return null;
                        },
                      )
                    : Text("К сожалению, подсказок нет"),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Понятно',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.darkOrangeColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showExplanationSheet(
      BuildContext context, QuestionEntity activeQuestion) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Объяснение к вопросу',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 320.w,
                ),
                activeQuestion.explanation != null
                    ? HtmlWidget(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 16.sp),
                        MathJaxHelper.clearText(
                            activeQuestion.explanation ?? ""),
                        customWidgetBuilder: (element) {
                          if (element.localName == 'math' ||
                              element.localName == 'pre') {
                            return Math.tex(element.text,
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold));
                          }
                          return null;
                        },
                      )
                    : Text("К сожалению, объяснения нет"),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Понятно',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstant.darkOrangeColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
