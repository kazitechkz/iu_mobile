import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/mathjax_helper.dart';
import 'package:iu/core/widgets/elevated_gradient_button.dart';
import 'package:iu/core/widgets/header_title.dart';
import 'package:iu/features/attempt/domain/parameters/answer_parameter.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_state.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/widget/answer_button_widget.dart';
import '../../../../core/utils/toasters.dart';
import '../../domain/entities/attempt_common_entity.dart';
import 'bloc/pass_attempt_bloc.dart';
import 'bloc/pass_attempt_event.dart';

class PassUntScreen extends StatefulWidget {
  final int attemptId;

  const PassUntScreen({super.key, required this.attemptId});

  @override
  State<PassUntScreen> createState() => _PassUntScreenState();
}

class _PassUntScreenState extends State<PassUntScreen> {
  CarouselController attemptCarouselController = CarouselController();
  void initState(){
    super.initState();
    context
        .read<PassAttemptBloc>()
        .add(PassAttemptGetByAttemptIdEvent(widget.attemptId));
  }
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    context
        .read<PassAttemptBloc>()
        .add(PassAttemptGetByAttemptIdEvent(widget.attemptId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PassAttemptBloc, PassAttemptState>(
      listener: (context, state) {
        if (state is PassAttemptSuccessState) {

        }
      },
      builder: (context, state) {
        if (state is PassAttemptFailedState) {
          AppToaster.showError(state.failureData.message ?? "Error");
        }
        if (state is PassAttemptSuccessState) {
          checkAnsweredResult(context,state);
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
                          const SizedBox(
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
                          context
                              .read<PassAttemptBloc>()
                              .add(PassAttemptChangeSubjectEvent(value??0));
                          attemptCarouselController.jumpToPage(0);

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
                    ExpandableCarousel.builder(
                        options: CarouselOptions(
                        controller: attemptCarouselController,
                        viewportFraction: 1.0, showIndicator: false),
                        itemCount: state.attempt.subjectQuestions[state.subjectId ?? 0].question.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
                          final activeQuestion = state.attempt.subjectQuestions[state.subjectId ?? 0].question[itemIndex];
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        stops: [0.1, 0.9],
                                        colors:
                                        ColorConstant.violetToPinkGradient),
                                    borderRadius: BorderRadius.circular(10.w)),
                                child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: 200
                                          .h, // Установка минимальной высоты в 200 пикселей
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 10.w),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Вопрос ${pageViewIndex + 1}/${state.attempt.subjectQuestions[state.subjectId??0].question.length}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 18.sp
                                            ),
                                            textAlign: TextAlign.right,

                                          ),
                                          SizedBox(height: 20.h,),
                                          TeXView(
                                            renderingEngine:
                                            TeXViewRenderingEngine.mathjax(),
                                            child: TeXViewDocument(
                                                MathJaxHelper.toMathJax(activeQuestion.text)),
                                            style: TeXViewStyle(
                                                contentColor: Colors.white,
                                                fontStyle: TeXViewFontStyle(
                                                    fontWeight: TeXViewFontWeight.bold
                                                )
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          (activeQuestion.context != null
                                              ? TeXView(
                                            renderingEngine:
                                            const TeXViewRenderingEngine
                                                .mathjax(),
                                            child: TeXViewDocument(
                                                MathJaxHelper.toMathJax(
                                                   activeQuestion.context?.context ??
                                                        "")),
                                            style: const TeXViewStyle(
                                                contentColor: Colors.white),
                                          )
                                              : SizedBox()),
                                          SizedBox(height: 10.h,),
                                          const Divider(
                                              color: Colors.white
                                          ),
                                          SizedBox(height: 10.h,),
                                          GestureDetector(
                                            onTap: (){
                                              checkAnswered(context,"a",activeQuestion.id,activeQuestion.typeId);
                                            },
                                            child: AnswerButton(
                                                answer: activeQuestion.answerA,
                                                isChecked:isChecked(state,"a",activeQuestion.id),
                                                onSelected: (answer)=>checkAnswered(context,"a",activeQuestion.id,activeQuestion.typeId),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              checkAnswered(context,"b",activeQuestion.id,activeQuestion.typeId);
                                            },
                                            child: AnswerButton(
                                                answer: activeQuestion.answerB,
                                                isChecked:isChecked(state,"b",activeQuestion.id),
                                                onSelected: (answer)=>checkAnswered(context,"b",activeQuestion.id,activeQuestion.typeId),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              checkAnswered(context,"c",activeQuestion.id,activeQuestion.typeId);
                                            },
                                            child: AnswerButton(
                                                answer: activeQuestion.answerC,
                                                isChecked:isChecked(state,"c",activeQuestion.id),
                                                onSelected: (answer)=>checkAnswered(context,"c",activeQuestion.id,activeQuestion.typeId),
                                            ),
                                          ),
                                          (activeQuestion.answerD != null ? GestureDetector(
                                            onTap: (){
                                              checkAnswered(context,"d",activeQuestion.id,activeQuestion.typeId);
                                            },
                                            child: AnswerButton(
                                                answer: activeQuestion.answerD,
                                                isChecked:isChecked(state,"d",activeQuestion.id),
                                                onSelected: (answer)=>checkAnswered(context,"d",activeQuestion.id,activeQuestion.typeId)
                                            ),
                                          ) : const SizedBox()),
                                          (activeQuestion.answerE != null ? GestureDetector(
                                            onTap: (){
                                              checkAnswered(context,"e",activeQuestion.id,activeQuestion.typeId);
                                            },
                                            child: AnswerButton(
                                                answer: activeQuestion.answerE,
                                                isChecked:isChecked(state,"e",activeQuestion.id),
                                                onSelected: (answer)=>checkAnswered(context,"e",activeQuestion.id,activeQuestion.typeId)

                                            ),
                                          ) :const SizedBox()),
                                          (activeQuestion.answerF != null ? GestureDetector(
                                            onTap: (){
                                              checkAnswered(context,"f",activeQuestion.id,activeQuestion.typeId);
                                            },
                                            child: AnswerButton(
                                                answer: activeQuestion.answerF,
                                                isChecked:isChecked(state,"f",activeQuestion.id),
                                                onSelected: (answer)=>checkAnswered(context,"f",activeQuestion.id,activeQuestion.typeId)

                                            ),
                                          ) : const SizedBox()),
                                          (activeQuestion.answerG != null ? GestureDetector(
                                            onTap: (){
                                              checkAnswered(context,"g",activeQuestion.id,activeQuestion.typeId);
                                            },
                                            child: AnswerButton(
                                                answer: activeQuestion.answerG,
                                                isChecked:isChecked(state,"g",activeQuestion.id),
                                                onSelected: (answer)=>checkAnswered(context,"g",activeQuestion.id,activeQuestion.typeId)
                                            ),
                                          ) :const SizedBox()),
                                          (activeQuestion.answerH != null ? GestureDetector(
                                            onTap: (){
                                              checkAnswered(context,"h",activeQuestion.id,activeQuestion.typeId);
                                            },
                                            child: AnswerButton(
                                                answer: activeQuestion.answerH,
                                                isChecked:isChecked(state,"h",activeQuestion.id),
                                                onSelected: (answer)=>checkAnswered(context,"h",activeQuestion.id,activeQuestion.typeId)
                                            ),
                                          ) :const SizedBox()),
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(height: 20.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedGradientButton(
                                    onPressed: (){
                                      attemptCarouselController.previousPage();
                                    },
                                    gradient: const LinearGradient(
                                      colors: ColorConstant.violetToPinkGradient,
                                    ),
                                    width: 80.w,
                                    height: 40.h,
                                    borderRadius: 20.0,
                                    child: Icon(FontAwesomeIcons.chevronLeft,color: Colors.white,),
                                  ),
                                  (isReadyToAnswer(state,activeQuestion.id) ?
                                  ElevatedGradientButton(
                                    onPressed: (){
                                      AnswerParameter parameter = AnswerParameter(
                                          attempt_id: state.attempt.attemptId,
                                          answers:state.answeredQuestions[activeQuestion.id]?.join(",")??"",
                                          attempt_subject_id: state.attempt.subjectQuestions[state.subjectId??0].attemptSubjectId,
                                          question_id: activeQuestion.id,
                                          attempt_type_id: state.attempt.typeId,
                                      );
                                      context.read<PassAttemptBloc>().add(PassAttemptAnswerEvent(parameter));
                                      attemptCarouselController.nextPage();
                                    },
                                    gradient: const LinearGradient(
                                      colors: ColorConstant.violetToPinkGradient,
                                    ),
                                    width: 120.w,
                                    height: 40.h,
                                    borderRadius: 20.0,
                                    child: Text(
                                      "Ответить",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.right,

                                    ),
                                  ) : SizedBox()),
                                  ElevatedGradientButton(
                                    onPressed: (){
                                      attemptCarouselController.nextPage();
                                    },
                                    gradient: const LinearGradient(
                                      colors: ColorConstant.violetToPinkGradient,
                                    ),
                                    width: 80.w,
                                    height: 40.h,
                                    borderRadius: 20.0,
                                    child: Icon(FontAwesomeIcons.chevronRight,color: Colors.white,),
                                  ),
                                ],
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

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }


  void checkAnswered(BuildContext context,String answer, int questionId, int typeId){
      context.read<PassAttemptBloc>().add(PassAttemptAnswerQuestionEvent(answer, questionId, typeId));
  }
  void checkAnsweredResult(BuildContext context,PassAttemptSuccessState state){
    context.read<PassAttemptBloc>().add(PassAttemptGetAnsweredEvent(state.attempt.subjectQuestions[state.subjectId??0].attemptSubjectId));
  }
  bool isChecked(PassAttemptSuccessState state,String answer, int questionId){
    if(state.answeredQuestions.containsKey(questionId)){
      if(state.answeredQuestions[questionId]!.contains(answer)){
        return true;
      }
    }
    return false;
  }

  bool isReadyToAnswer(PassAttemptSuccessState state, int questionId){
    if(state.answeredQuestions.containsKey(questionId)){
      if(state.answeredQuestions[questionId]!.length >= 1 && !state.answeredQuestionsID.contains(questionId)){
        return true;
      }
    }
    return false;
  }



}
