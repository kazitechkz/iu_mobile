import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/app_constant.dart';
import 'package:iu/features/career/domain/parameters/finish_career_quiz_parameter.dart';
import 'package:iu/features/career/presentation/pass_career_one/bloc/pass_career_one_bloc.dart';
import 'package:iu/features/career/presentation/pass_career_one/widgets/career_question_container_widget.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/entities/career_quiz_answer_entity.dart';

class PassCareerOneScreen extends StatefulWidget {
  const PassCareerOneScreen({super.key, required this.quizId});
  final int quizId;
  @override
  State<PassCareerOneScreen> createState() => _PassCareerOneScreenState();
}

class _PassCareerOneScreenState extends State<PassCareerOneScreen> {
  CarouselController carouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    context
        .read<PassCareerOneBloc>()
        .add(PassCareerOneGetAllEvent(widget.quizId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        text: "Карьера",
        imageUrl: "assets/images/icons/career.webp",
        routeLink: "${RouteConstant.careerQuizDetailName}/${widget.quizId}",
      ),
      body: BlocConsumer<PassCareerOneBloc, PassCareerOneState>(
        listener: (BuildContext context, PassCareerOneState state) {
          if (state is PassCareerOneFinishedState) {
            context
                .go("/${RouteConstant.resultCareerQuizName}/${state.resultId}");
          }
        },
        builder: (BuildContext context, PassCareerOneState state) {
          if (state is PassCareerOneLoadingState ||
              state is PassCareerOneFinishedState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PassCareerOneSuccessState) {
            final careerQuiz = state.careerQuizEntity;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: Column(
                  children: [
                    ExpandableCarousel.builder(
                      options: CarouselOptions(
                        controller: carouselController,
                        enlargeCenterPage: true,
                        physics: new NeverScrollableScrollPhysics(),
                        disableCenter: true,
                        viewportFraction: 1,
                        showIndicator: false,
                      ),
                      itemCount: careerQuiz.careerQuizQuestions?.length ?? 0,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return Column(
                          children: [
                            CareerQuestionContainerWidget(
                              careerQuestionEntity:
                                  careerQuiz.careerQuizQuestions![itemIndex],
                              answers: _getCareerQuizQuestions(
                                  careerQuiz.careerQuizQuestions![itemIndex].id,
                                  careerQuiz.careerQuizAnswers,
                                  careerQuiz.code),
                              type: careerQuiz.code,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: pageViewIndex != 0
                                        ? InkWell(
                                            onTap: () {
                                              carouselController.previousPage();
                                            },
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.h,
                                                    horizontal: 10.w),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.w),
                                                    color: ColorConstant
                                                        .peachColor),
                                                child: Icon(
                                                  FontAwesomeIcons.chevronLeft,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : SizedBox()),
                                Expanded(
                                    child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 10.w),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(30.w),
                                            color: ColorConstant.appBarColor),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "${pageViewIndex + 1}/ ${state.careerQuizEntity.careerQuizQuestions?.length}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                        ))),
                                Expanded(
                                    child: (pageViewIndex + 1 <=
                                                state.givenAnswer.length &&
                                            pageViewIndex <
                                                (state
                                                        .careerQuizEntity
                                                        .careerQuizQuestions
                                                        ?.length ??
                                                    0))
                                        ? InkWell(
                                            onTap: () {
                                              carouselController.nextPage();
                                            },
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.h,
                                                    horizontal: 10.w),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.w),
                                                    color: ColorConstant
                                                        .peachColor),
                                                child: Icon(
                                                  FontAwesomeIcons.chevronRight,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : SizedBox()),
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            state.givenAnswer.length ==
                                    state.careerQuizEntity.careerQuizQuestions
                                        ?.length
                                ? Center(
                                    child: InkWell(
                                      onTap: () {
                                        context.read<PassCareerOneBloc>().add(
                                            PassCareerOneFinishEvent(
                                                parameter:
                                                    FinishCareerQuizParameter(
                                                        quiz_id: widget.quizId,
                                                        given_answers: state
                                                            .givenAnswer)));
                                      },
                                      child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h, horizontal: 10.w),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(30.w),
                                              color: ColorConstant.peachColor),
                                          child: Text(
                                            "Завершить",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  List<CareerQuizAnswerEntity> _getCareerQuizQuestions(int questionId,
      List<CareerQuizAnswerEntity>? careerQuizAnswers, String type) {
    if (careerQuizAnswers != null) {
      if (type == AppConstant.QUESTIONS_AND_ANSWERS) {
        return careerQuizAnswers
            .where((answer) => answer.questionId == questionId)
            .toList();
      }
      if (type == AppConstant.ONE_ANSWER) {
        return careerQuizAnswers;
      }
    }
    return [];
  }
}
