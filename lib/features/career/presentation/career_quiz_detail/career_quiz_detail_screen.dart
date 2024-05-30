import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:iu/features/career/presentation/career_quiz_detail/bloc/career_quiz_detail_bloc.dart';
import 'package:iu/features/career/presentation/career_quiz_detail/widget/career_quiz_author.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';

class CareerQuizDetailScreen extends StatefulWidget {
  const CareerQuizDetailScreen({super.key, required this.quizId});

  final int quizId;

  @override
  State<CareerQuizDetailScreen> createState() => _CareerQuizDetailScreenState();
}

class _CareerQuizDetailScreenState extends State<CareerQuizDetailScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<CareerQuizDetailBloc>()
        .add(GetCareerQuizDetailByIdEvent(widget.quizId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBarWidget(
          text: "Карьера",
          imageUrl: "assets/images/icons/career.webp",
          routeLink: RouteConstant.careerQuizzesListName,
        ),
        body: BlocConsumer<CareerQuizDetailBloc, CareerQuizDetailState>(
          listener: (BuildContext context, CareerQuizDetailState state) {},
          builder: (BuildContext context, CareerQuizDetailState state) {
            if (state is CareerQuizDetailLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CareerQuizDetailSuccessState) {
              final careerQuiz = state.careerQuizEntity.quiz;
              final isPurchased = state.careerQuizEntity.isPurchased;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                height: 150.h,
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
                                      getImageFromString(careerQuiz.file?.url),
                                  fit: BoxFit.fitHeight,
                                ),
                              )),
                          Expanded(flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "${careerQuiz.titleRu}",
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: ColorConstant.peachColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Text(
                                      "#${careerQuiz.careerQuizGroup?.titleRu}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    (
                                      isPurchased || careerQuiz.price == 0
                                          ? Container(
                                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white),
                                            borderRadius: BorderRadius.circular(30.w),
                                            color: ColorConstant.bottomBarColor
                                        ),
                                        child: AutoSizeText(
                                          maxLines: 1,
                                          "Пройти тест",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      )
                                          : Container(
                                        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30.w),
                                            gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [ColorConstant.orangeColor,ColorConstant.darkOrangeColor]
                                            )
                                        ),
                                        child: AutoSizeText(
                                          maxLines: 1,
                                          "Приобрести всего за ${careerQuiz.price} KZT",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      )
                                    )
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      GFAccordion(
                          collapsedTitleBackgroundColor:ColorConstant.peachColor,
                          expandedTitleBackgroundColor:ColorConstant.peachColor,
                          contentBackgroundColor: ColorConstant.peachColor,
                          titleBorderRadius: BorderRadius.circular(10.w),
                          contentBorderRadius: BorderRadius.circular(10.w),
                          titleChild: Text(
                            "Описание",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          contentChild: Html(
                            data: careerQuiz.descriptionRu,
                            style: {
                              "p":Style(
                                color: Colors.white,
                                fontSize: FontSize(12),
                              )
                            }
                          ),
                          collapsedIcon: Icon(
                            FontAwesomeIcons.chevronDown,
                            color: Colors.white,
                            size: 12.sp,
                          ),
                          expandedIcon: Icon(
                            FontAwesomeIcons.chevronUp,
                            color: Colors.white,
                            size: 12.sp,
                          )),
                      SizedBox(height: 10.h,),
                      GFAccordion(
                          collapsedTitleBackgroundColor:ColorConstant.peachColor,
                          expandedTitleBackgroundColor:ColorConstant.peachColor,
                          contentBackgroundColor: ColorConstant.peachColor,
                          titleBorderRadius: BorderRadius.circular(10.w),
                          contentBorderRadius: BorderRadius.circular(10.w),
                          titleChild: Text(
                            "Правила",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          contentChild: Html(
                              data: careerQuiz.ruleRu,
                              style: {
                                "p":Style(
                                  color: Colors.white,
                                  fontSize: FontSize(12),
                                )
                              }
                          ),
                          collapsedIcon: Icon(
                            FontAwesomeIcons.chevronDown,
                            color: Colors.white,
                            size: 12.sp,
                          ),
                          expandedIcon: Icon(
                            FontAwesomeIcons.chevronUp,
                            color: Colors.white,
                            size: 12.sp,
                          )),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Divider(
                          height: 2.h,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                     AutoSizeText(
                       "Авторы тестов:",
                       style: TextStyle(
                         color: ColorConstant.peachColor,
                         fontSize: 18.sp,
                         fontWeight: FontWeight.bold
                     ),),

                      SizedBox(height: 10.h,),
                      ...(careerQuiz.careerQuizCreators != null ? careerQuiz.careerQuizCreators!.map((authorDetail) => CareerQuizAuthorWidget(careerAuthor: authorDetail,)) : [])
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ));
  }
}
