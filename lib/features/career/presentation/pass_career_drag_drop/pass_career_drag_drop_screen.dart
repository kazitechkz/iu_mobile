import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/utils/toasters.dart';
import 'package:iu/features/career/presentation/pass_career_drag_drop/bloc/pass_career_drag_drop_bloc.dart';
import 'package:iu/features/career/presentation/pass_career_drag_drop/widgets/pass_career_container_widget.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/entities/career_quiz_question_entity.dart';

class PassCareerDragDropScreen extends StatefulWidget {
  const PassCareerDragDropScreen({super.key, required this.quizId});
  final int quizId;
  @override
  State<PassCareerDragDropScreen> createState() =>
      _PassCareerDragDropScreenState();
}

class _PassCareerDragDropScreenState extends State<PassCareerDragDropScreen> {
  CarouselController carouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    context
        .read<PassCareerDragDropBloc>()
        .add(PassCareerDragDropGetCareerByIdEvent(widget.quizId));
  }

  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    context
        .read<PassCareerDragDropBloc>()
        .add(PassCareerDragDropGetCareerByIdEvent(widget.quizId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        text: "Карьера",
        imageUrl: "assets/images/icons/career.webp",
        routeLink: "${RouteConstant.careerQuizDetailName}/${widget.quizId}",
      ),
      body: BlocConsumer<PassCareerDragDropBloc, PassCareerDragDropState>(
        listener: (BuildContext context, PassCareerDragDropState state) {
          if (state is PassCareerDragDropFailedState) {
            AppToaster.showError(state.failureData.message ?? "Error");
          }
        },
        builder: (BuildContext context, PassCareerDragDropState state) {
          if (state is PassCareerDragDropLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PassCareerDragDropSuccessState) {
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
                          onPageChanged:
                              (index, CarouselPageChangedReason reason) {
                            context.read<PassCareerDragDropBloc>().add(
                                PassCareerDragDropChangeSliderEvent(index));
                          }),
                      itemCount:
                          state.passCareerQuiz.careerQuizQuestions?.length ?? 0,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        CareerQuizQuestionEntity? activeQuestion = state
                            .passCareerQuiz.careerQuizQuestions?[itemIndex];
                        return Column(
                          children: [
                            PassCareerContainerWidget(
                              careerQuestionEntity: activeQuestion,
                              answers: state.passCareerQuiz.careerQuizAnswers
                                      ?.where((element) =>
                                          element.questionId ==
                                          (activeQuestion?.id ?? 0))
                                      .toList() ??
                                  [],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        );
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: state.pageIndex != 0
                                ? InkWell(
                                    onTap: () {
                                      carouselController.previousPage();
                                    },
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
                                            color: ColorConstant.peachColor),
                                        child: Icon(
                                          FontAwesomeIcons.chevronLeft,
                                          color: Colors.white,
                                        )),
                                  )
                                : SizedBox()),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30.w),
                                    color: ColorConstant.appBarColor),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "${state.pageIndex + 1} / ${state.passCareerQuiz.careerQuizQuestions?.length}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ))),
                        Expanded(
                            child: (state.pageIndex + 1 <=
                                        state.givenAnswer.length &&
                                    state.pageIndex <
                                        (state.passCareerQuiz
                                                .careerQuizQuestions?.length ??
                                            0))
                                ? InkWell(
                                    onTap: () {
                                      carouselController.nextPage();
                                    },
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
                                            color: ColorConstant.peachColor),
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
                            state.passCareerQuiz.careerQuizQuestions?.length
                        ? Center(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(30.w),
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
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
