import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/features/career/domain/parameters/get_career_quizzes_parameter.dart';
import 'package:iu/features/career/presentation/career_quizzes/bloc/career_quizzes_bloc.dart';
import 'package:iu/features/career/presentation/career_quizzes/widget/career_quiz_card.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/entities/career_quiz_entity.dart';

class CareerQuizzesScreen extends StatefulWidget {
  const CareerQuizzesScreen({super.key});

  @override
  State<CareerQuizzesScreen> createState() => _CareerQuizzesScreenState();
}

class _CareerQuizzesScreenState extends State<CareerQuizzesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CareerQuizzesBloc>().add(GetCareerQuizzesEvent(GetCareerQuizzesParameter(page: 1)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Карьера",
        imageUrl: "assets/images/icons/career.webp",
        routeLink: RouteConstant.dashboardScreenName,
      ),
      body: BlocConsumer<CareerQuizzesBloc, CareerQuizzesState>(
          listener: (context,state){

          },
        builder: (context,state){
            if(state is CareerQuizzesLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is CareerQuizzesSuccessState){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50.w),
                              onTap: () {
                                context.go("/${RouteConstant.careerSubscriptionsName}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.w),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors:[ColorConstant.appBarColor, ColorConstant.peachColor],
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: ColorConstant.darkOrangeColor,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 8.0,
                                    )
                                  ],
                                ),
                                height: 60.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.moneyBill,
                                      size: 20.sp,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Приобрести тесты",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50.w),
                              onTap: () {
                                context.go("/${RouteConstant.myCareerQuizAttemptsName}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.w),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors:[ColorConstant.appBarColor, ColorConstant.peachColor],
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: ColorConstant.darkOrangeColor,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 8.0,
                                    )
                                  ],
                                ),
                                height: 60.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.award,
                                      size: 20.sp,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "История сдач",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    ..._getCareerCardWidget(state.careerQuizzes,state.careerQuizzesEntity.purchased),
                  ],
                ),
              );
            }
            return SizedBox();
        },
      ),
    );
  }

  List<Widget> _getCareerCardWidget(List<CareerQuizEntity> quizzes,List<int> purchased ){
    return quizzes.map((careerQuiz) => CareerQuizCardWidget(quizEntity: careerQuiz, purchased: purchased)).toList();
  }
}
