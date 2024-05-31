import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/app_constant.dart';
import 'package:iu/features/career/presentation/pass_career_one/bloc/pass_career_one_bloc.dart';
import 'package:iu/features/career/presentation/pass_career_one/widgets/career_question_container_widget.dart';

import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/entities/career_quiz_answer_entity.dart';

class PassCareerOneScreen extends StatefulWidget {
  const PassCareerOneScreen({super.key,required this.quizId});
  final int quizId;
  @override
  State<PassCareerOneScreen> createState() => _PassCareerOneScreenState();
}

class _PassCareerOneScreenState extends State<PassCareerOneScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PassCareerOneBloc>().add(PassCareerOneGetAllEvent(widget.quizId));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        text: "Карьера",
        imageUrl: "assets/images/icons/career.webp",
        routeLink:"${RouteConstant.careerQuizDetailName}/${widget.quizId}",
      ),
      body: BlocConsumer<PassCareerOneBloc, PassCareerOneState>(
        listener: (BuildContext context, PassCareerOneState state) {
          if(state is PassCareerOneFinishedState){
            context.go("/${RouteConstant.resultCareerQuizName}/${state.resultId}");
          }
        },
        builder: (BuildContext context, PassCareerOneState state) {
          if(state is PassCareerOneLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is PassCareerOneSuccessState){
            final careerQuiz = state.careerQuizEntity;
           return SingleChildScrollView(
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
               child: Column(
                  children: [
                    ExpandableCarousel.builder(
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          disableCenter: true,
                          viewportFraction: 1,
                          showIndicator: false,
                          ),
                      itemCount: careerQuiz.careerQuizQuestions?.length??0,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return CareerQuestionContainerWidget(
                          careerQuestionEntity: careerQuiz.careerQuizQuestions![itemIndex],
                          answers: _getCareerQuizQuestions(careerQuiz.careerQuizQuestions![itemIndex].id, careerQuiz.careerQuizAnswers,careerQuiz.code),
                          type: careerQuiz.code,
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

  List<CareerQuizAnswerEntity> _getCareerQuizQuestions(int questionId,List<CareerQuizAnswerEntity>? careerQuizAnswers,String type){
    if(careerQuizAnswers != null){
      if(type == AppConstant.QUESTIONS_AND_ANSWERS){
        return careerQuizAnswers.where((answer) => answer.questionId == questionId).toList();
      }
      if(type == AppConstant.ONE_ANSWER){
        return careerQuizAnswers;
      }
    }
    return [];
  }
}
