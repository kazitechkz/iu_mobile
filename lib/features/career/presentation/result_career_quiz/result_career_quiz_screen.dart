import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/career/presentation/result_career_quiz/widgets/result_career_quiz_detail_stat_card_widget.dart';
import 'package:iu/features/career/presentation/result_career_quiz/widgets/result_career_quiz_detail_widget.dart';
import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/entities/career_quiz_attempt_result_entity.dart';
import 'bloc/result_career_quiz_bloc.dart';

class ResultCareerQuizScreen extends StatefulWidget {
  const ResultCareerQuizScreen({super.key,required this.attemptId});
  final int attemptId;
  @override
  State<ResultCareerQuizScreen> createState() => _ResultCareerQuizScreenState();
}

class _ResultCareerQuizScreenState extends State<ResultCareerQuizScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ResultCareerQuizBloc>().add(ResultCareerQuizByAttemptIdEvent(widget.attemptId));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Карьера",
        imageUrl: "assets/images/icons/career.webp",
        routeLink: RouteConstant.myCareerQuizAttemptsName,
      ),
      body: BlocConsumer<ResultCareerQuizBloc,ResultCareerQuizState>(
        listener: (BuildContext context, ResultCareerQuizState state) {  },
        builder: (BuildContext context, ResultCareerQuizState state) {
          if(state is ResultCareerQuizLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is ResultCareerQuizSuccessState){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 120.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.w),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        ColorConstant.appBarColor,
                                        ColorConstant.peachColor
                                      ])),
                              child: CachedNetworkImage(
                                imageUrl:
                                getImageFromString(state.careerQuizAttempt.careerQuiz?.file?.url),
                                fit: BoxFit.fitHeight,
                              ),
                            )),
                        Expanded(flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Результаты теста:",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  AutoSizeText(
                                    "${state.careerQuizAttempt.careerQuiz?.titleRu}".toUpperCase(),
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: ColorConstant.peachColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),

                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  ..._generateResultCardWidget(state.careerQuizAttempt.careerQuizAttemptResults),
                  SizedBox(height: 10.h,),
                  ..._generateResultCardSlimWidget(state.careerQuizAttempt.careerQuizAttemptResults)
                ],
              ),
            );
          }

          return SizedBox();
        },
      )
    );
  }

  List<Widget> _generateResultCardWidget(List<CareerQuizAttemptResultEntity>? results){
    if(results != null){
      return results.map((result) => ResultCareerQuizDetailWidget(resultEntity: result)).toList();
    }
    return [];
  }

  List<Widget> _generateResultCardSlimWidget(List<CareerQuizAttemptResultEntity>? results){
    if(results != null){
      return results.map((result) => ResultCareerQuizDetailStatCardWidget(resultEntity: result)).toList();
    }
    return [];
  }
}
