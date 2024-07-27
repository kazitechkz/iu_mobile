import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/bottom_sheet/gf_bottom_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/mathjax_helper.dart';
import 'package:iu/core/widgets/elevated_gradient_button.dart';
import 'package:iu/core/widgets/header_title.dart';
import 'package:iu/features/attempt/domain/entities/question_entity.dart';
import 'package:iu/features/attempt/domain/parameters/answer_parameter.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_state.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/widget/answer_button_widget.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/utils/toasters.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/entities/attempt_common_entity.dart';
import 'bloc/pass_attempt_bloc.dart';
import 'bloc/pass_attempt_event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PassUntScreen extends StatefulWidget {
  final int attemptId;

  const PassUntScreen({super.key, required this.attemptId});

  @override
  State<PassUntScreen> createState() => _PassUntScreenState();
}

class _PassUntScreenState extends State<PassUntScreen> {
  CarouselController attemptCarouselController = CarouselController();
  CarouselController paginationCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    context
        .read<PassAttemptBloc>()
        .add(PassAttemptGetByAttemptIdEvent(widget.attemptId));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    context
        .read<PassAttemptBloc>()
        .add(PassAttemptGetByAttemptIdEvent(widget.attemptId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        text: AppLocalizations.of(context)!.unt_training,
        imageUrl: "assets/images/icons/training.webp",
        routeLink: RouteConstant.untModeScreenName,
      ),
      body: BlocConsumer<PassAttemptBloc, PassAttemptState>(
        listener: (context, state) {
          if (state is PassAttemptSuccessState) {
            if (state.answeredResult == null) {
              checkAnsweredResult(context, state);
            }
          }
          if (state is PassAttemptFinishedState) {
            context.go(
                "/${RouteConstant.attemptResultByAttemptIdName}/${state.attemptId}");
          }
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
                                Duration(milliseconds: state.timeLeftMS),
                              ),
                              onTick: (timer) {
                                context.read<PassAttemptBloc>().add(
                                    PassAttemptOnTickEvent(
                                        timer.inMilliseconds));
                              },
                              onEnd: () {
                                context.read<PassAttemptBloc>().add(
                                    PassAttemptFinishAttemptEvent(
                                        widget.attemptId));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text("${state.answeredResult?.data.values}"),
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
                            context
                                .read<PassAttemptBloc>()
                                .add(PassAttemptChangeSubjectEvent(value ?? 0));
                            context.read<PassAttemptBloc>().add(
                                PassAttemptGetAnsweredEvent(state
                                    .attempt
                                    .subjectQuestions[value ?? 0]
                                    .attemptSubjectId));
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
                                        color: paginationBgColor(
                                            state, pageViewIndex),
                                        border: Border.all(
                                            color: paginationOtherColor(
                                                state, pageViewIndex)),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Center(
                                      child: Text(
                                        (pageViewIndex + 1).toString(),
                                        style: TextStyle(
                                            color: paginationTextColor(
                                                state, pageViewIndex),
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
                      SizedBox(
                        height: 10.h,
                      ),
                      ExpandableCarousel.builder(
                        options: CarouselOptions(
                            controller: attemptCarouselController,
                            viewportFraction: 1.0,
                            showIndicator: false,
                            onPageChanged:
                                (int index, CarouselPageChangedReason reason) {
                              context.read<PassAttemptBloc>().add(
                                  PassAttemptCarouselSliderChangeEvent(index));
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
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        stops: [
                                          0.1,
                                          0.9
                                        ],
                                        colors: [
                                          ColorConstant.darkOrangeColor,
                                          ColorConstant.orangeColor,
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
                                                                PassAttemptBloc>()
                                                            .add(PassAttemptSaveQuestionEvent(
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
                                          AnswerButton(
                                            answer: activeQuestion.answerA,
                                            isAlreadyAnswered:
                                                isAlreadyAnswered(state, "a",
                                                    activeQuestion.id),
                                            isChecked: isChecked(
                                                state, "a", activeQuestion.id),
                                            onSelected: (answer) =>
                                                checkAnswered(
                                                    context,
                                                    "a",
                                                    activeQuestion.id,
                                                    activeQuestion.typeId),
                                            answerType: 'a',
                                          ),
                                          AnswerButton(
                                            answer: activeQuestion.answerB,
                                            isAlreadyAnswered:
                                                isAlreadyAnswered(state, "b",
                                                    activeQuestion.id),
                                            isChecked: isChecked(
                                                state, "b", activeQuestion.id),
                                            onSelected: (answer) =>
                                                checkAnswered(
                                                    context,
                                                    "b",
                                                    activeQuestion.id,
                                                    activeQuestion.typeId),
                                            answerType: 'b',
                                          ),
                                          AnswerButton(
                                            answer: activeQuestion.answerC,
                                            isAlreadyAnswered:
                                                isAlreadyAnswered(state, "c",
                                                    activeQuestion.id),
                                            isChecked: isChecked(
                                                state, "c", activeQuestion.id),
                                            onSelected: (answer) =>
                                                checkAnswered(
                                                    context,
                                                    "c",
                                                    activeQuestion.id,
                                                    activeQuestion.typeId),
                                            answerType: 'c',
                                          ),
                                          AnswerButton(
                                            answer: activeQuestion.answerD,
                                            isAlreadyAnswered:
                                                isAlreadyAnswered(state, "d",
                                                    activeQuestion.id),
                                            isChecked: isChecked(
                                                state, "d", activeQuestion.id),
                                            onSelected: (answer) =>
                                                checkAnswered(
                                                    context,
                                                    "d",
                                                    activeQuestion.id,
                                                    activeQuestion.typeId),
                                            answerType: 'd',
                                          ),
                                          (activeQuestion.answerE != null
                                              ? AnswerButton(
                                                  answer:
                                                      activeQuestion.answerE,
                                                  isAlreadyAnswered:
                                                      isAlreadyAnswered(
                                                          state,
                                                          "e",
                                                          activeQuestion.id),
                                                  isChecked: isChecked(state,
                                                      "e", activeQuestion.id),
                                                  onSelected: (answer) =>
                                                      checkAnswered(
                                                          context,
                                                          "e",
                                                          activeQuestion.id,
                                                          activeQuestion
                                                              .typeId),
                                                  answerType: 'e',
                                                )
                                              : const SizedBox()),
                                          (activeQuestion.answerF != null
                                              ? AnswerButton(
                                                  answer:
                                                      activeQuestion.answerF,
                                                  isAlreadyAnswered:
                                                      isAlreadyAnswered(
                                                          state,
                                                          "f",
                                                          activeQuestion.id),
                                                  isChecked: isChecked(state,
                                                      "f", activeQuestion.id),
                                                  onSelected: (answer) =>
                                                      checkAnswered(
                                                          context,
                                                          "f",
                                                          activeQuestion.id,
                                                          activeQuestion
                                                              .typeId),
                                                  answerType: 'f',
                                                )
                                              : const SizedBox()),
                                          (activeQuestion.answerG != null
                                              ? AnswerButton(
                                                  answer:
                                                      activeQuestion.answerG,
                                                  isAlreadyAnswered:
                                                      isAlreadyAnswered(
                                                          state,
                                                          "g",
                                                          activeQuestion.id),
                                                  isChecked: isChecked(state,
                                                      "g", activeQuestion.id),
                                                  onSelected: (answer) =>
                                                      checkAnswered(
                                                          context,
                                                          "g",
                                                          activeQuestion.id,
                                                          activeQuestion
                                                              .typeId),
                                                  answerType: 'g',
                                                )
                                              : const SizedBox()),
                                          (activeQuestion.answerH != null
                                              ? AnswerButton(
                                                  answer:
                                                      activeQuestion.answerH,
                                                  isAlreadyAnswered:
                                                      isAlreadyAnswered(
                                                          state,
                                                          "h",
                                                          activeQuestion.id),
                                                  isChecked: isChecked(state,
                                                      "h", activeQuestion.id),
                                                  onSelected: (answer) =>
                                                      checkAnswered(
                                                          context,
                                                          "h",
                                                          activeQuestion.id,
                                                          activeQuestion
                                                              .typeId),
                                                  answerType: 'h',
                                                )
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
                                          gradient:
                                              const LinearGradient(colors: [
                                            ColorConstant.darkOrangeColor,
                                            ColorConstant.orangeColor,
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
                                  (isReadyToAnswer(state, activeQuestion.id)
                                      ? ElevatedGradientButton(
                                          onPressed: () {
                                            AnswerParameter parameter =
                                                AnswerParameter(
                                              attempt_id:
                                                  state.attempt.attemptId,
                                              answers: state.answeredQuestions[
                                                          activeQuestion.id]
                                                      ?.join(",") ??
                                                  "",
                                              attempt_subject_id: state
                                                  .attempt
                                                  .subjectQuestions[
                                                      state.subjectId ?? 0]
                                                  .attemptSubjectId,
                                              question_id: activeQuestion.id,
                                              attempt_type_id:
                                                  state.attempt.typeId,
                                            );
                                            if (pageViewIndex + 1 <
                                                (state
                                                    .attempt
                                                    .subjectQuestions[
                                                        state.subjectId ?? 0]
                                                    .question
                                                    .length)) {
                                              paginationCarouselController
                                                  .jumpToPage(
                                                      pageViewIndex + 1);
                                            }
                                            context.read<PassAttemptBloc>().add(
                                                PassAttemptAnswerEvent(
                                                    parameter));
                                          },
                                          gradient:
                                              const LinearGradient(colors: [
                                            ColorConstant.darkOrangeColor,
                                            ColorConstant.orangeColor,
                                          ]),
                                          width: 120.w,
                                          height: 40.h,
                                          borderRadius: 20.0,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .answer_button,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 16.sp),
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      : SizedBox(
                                          width: 120.w,
                                          height: 40.h,
                                        )),
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
                                          gradient:
                                              const LinearGradient(colors: [
                                            ColorConstant.darkOrangeColor,
                                            ColorConstant.orangeColor,
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
                              SizedBox(
                                height: 40.h,
                              ),
                              ElevatedGradientButton(
                                onPressed: () {
                                  context.read<PassAttemptBloc>().add(
                                      PassAttemptFinishAttemptEvent(
                                          widget.attemptId));
                                },
                                gradient: const LinearGradient(colors: [
                                  ColorConstant.darkOrangeColor,
                                  ColorConstant.orangeColor,
                                ]),
                                width: 320.w,
                                height: 40.h,
                                borderRadius: 20.0,
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "Завершить",
                                          style: TextStyle(fontSize: 20.sp)),
                                    ])),
                              )
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

  void checkAnswered(
      BuildContext context, String answer, int questionId, int typeId) {
    context
        .read<PassAttemptBloc>()
        .add(PassAttemptAnswerQuestionEvent(answer, questionId, typeId));
  }

  void checkAnsweredResult(
      BuildContext context, PassAttemptSuccessState state) {
    context.read<PassAttemptBloc>().add(PassAttemptGetAnsweredEvent(
        state.attempt.subjectQuestions[state.subjectId ?? 0].attemptSubjectId));
  }

  bool isChecked(PassAttemptSuccessState state, String answer, int questionId) {
    if (state.answeredQuestions.containsKey(questionId)) {
      if (state.answeredQuestions[questionId]!.contains(answer)) {
        return true;
      }
    }
    return false;
  }

  bool? isAlreadyAnswered(
      PassAttemptSuccessState state, String answer, int questionId) {
    if (state.answeredResult?.data != null) {
      if (state.answeredResult!.data.containsKey(questionId)) {
        if (state.answeredResult!.data[questionId]!.contains(answer)) {
          return true;
        } else {
          return false;
        }
      }
    }
    if (state.answeredQuestionsID.containsKey(questionId)) {
      if (state.answeredQuestionsID[questionId]!.contains(answer)) {
        return true;
      } else {
        return false;
      }
    }
    return null;
  }

  Color paginationBgColor(PassAttemptSuccessState state, int index) {
    if (state.activeSlider == index) {
      return ColorConstant.orangeColor;
    }
    if (state.answeredResult != null) {
      if (state.answeredResult!.data.containsKey(state
          .attempt.subjectQuestions[state.subjectId ?? 0].question[index].id)) {
        return ColorConstant.violetColor;
      }
    }
    if (state.answeredQuestionsID.containsKey(state
        .attempt.subjectQuestions[state.subjectId ?? 0].question[index].id)) {
      return ColorConstant.violetColor;
    }
    return Colors.white;
  }

  Color paginationOtherColor(PassAttemptSuccessState state, int index) {
    if (state.activeSlider == index) {
      return Colors.white;
    }
    if (state.answeredQuestionsID.containsKey(state
        .attempt.subjectQuestions[state.subjectId ?? 0].question[index].id)) {
      return ColorConstant.darkOrangeColor;
    }
    if (state.answeredResult != null) {
      if (state.answeredResult!.data.containsKey(state
          .attempt.subjectQuestions[state.subjectId ?? 0].question[index].id)) {
        return ColorConstant.darkOrangeColor;
      }
    }
    return ColorConstant.darkOrangeColor;
  }

  Color paginationTextColor(PassAttemptSuccessState state, int index) {
    if (state.answeredQuestionsID.containsKey(state
        .attempt.subjectQuestions[state.subjectId ?? 0].question[index].id)) {
      return Colors.white;
    }
    if (state.answeredResult != null) {
      if (state.answeredResult!.data.containsKey(state
          .attempt.subjectQuestions[state.subjectId ?? 0].question[index].id)) {
        return Colors.white;
      }
    }
    if (state.activeSlider != index) {
      return ColorConstant.orangeColor;
    }
    return Colors.white;
  }

  bool isReadyToAnswer(PassAttemptSuccessState state, int questionId) {
    if (state.answeredResult != null) {
      if (state.answeredResult!.data.containsKey(questionId)) {
        return false;
      }
    }
    if (state.answeredQuestions.containsKey(questionId)) {
      if (state.answeredQuestions[questionId]!.isNotEmpty &&
          !state.answeredQuestionsID.containsKey(questionId)) {
        return true;
      }
    }
    return false;
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
}
