import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/presentation/attempt_result/bloc/attempt_result_bloc.dart';
import '../../../../core/services/image_service.dart';

class AttemptResultScreen extends StatefulWidget {
  final int attemptId;

  const AttemptResultScreen({super.key, required this.attemptId});

  @override
  State<AttemptResultScreen> createState() => _AttemptResultScreenState();
}

class _AttemptResultScreenState extends State<AttemptResultScreen> {
  void initState() {
    super.initState();
    context
        .read<AttemptResultBloc>()
        .add(AttemptResultByAttemptIdEvent(widget.attemptId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AttemptResultBloc, AttemptResultState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AttemptResultLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AttemptResultSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                child: Center(
                  child: Column(children: _getStatsCard(state)),
                ),
              ),
            );
          }
          return SizedBox(
            child: Text(widget.attemptId.toString()),
          );
        },
      ),
    );
  }

  List<Widget> _getStatsCard(AttemptResultSuccessState state) {
    List<Widget> stats = [
      Container(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
        constraints: BoxConstraints(
          minHeight: 120.h,
          minWidth: 320.h,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.w),
              topLeft: Radius.circular(10.w),
              bottomLeft: Radius.circular(10.w),
              bottomRight: Radius.circular(10.w),
            ),
            color: ColorConstant.lightViolet,
            boxShadow: const [
              BoxShadow(
                color: ColorConstant.linkColor,
                offset: Offset(1.0, 2.0), //(x,y)
                blurRadius: 4.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "${state.stats.attempt.attemptType?.titleRu}",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    FontAwesomeIcons.trophy,
                    size: 18.sp,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Divider(
                color: Colors.white,
                height: 2.h,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.hashtag,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Попытка:",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${state.stats.attempt.id}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.medal,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Набрано баллов:",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${state.stats.attempt.points}/${state.stats.attempt.maxPoints}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.language,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Язык сдачи:",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${state.stats.attempt.locale?.title}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.clock,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Время:",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: TimerCountdown(
                      colonsTextStyle: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      timeTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                      enableDescriptions: false,
                      format: CountDownTimerFormat.hoursMinutesSeconds,
                      endTime: DateTime.now().add(
                        Duration(
                            milliseconds: (state.stats.attempt.time -
                                state.stats.attempt.timeLeft)),
                      ),
                      onEnd: () {},
                    ))
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
    ];
    if (state.stats.subjectResult != null) {
      List<Widget>? newStats = state.stats.subjectResult
          ?.map(
            (subjectResultItem) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
                constraints: BoxConstraints(
                  minHeight: 80.h,
                  minWidth: 320.h,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.w),
                      topLeft: Radius.circular(10.w),
                      bottomLeft: Radius.circular(10.w),
                      bottomRight: Radius.circular(10.w),
                    ),
                    color: ColorConstant.lightViolet,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorConstant.linkColor,
                        offset: Offset(1.0, 2.0), //(x,y)
                        blurRadius: 4.0,
                      )
                    ]),
                child: Column(
                  children: [
                    (_getSubjectBySubjectId(
                                state, subjectResultItem.subjectId) !=
                            null
                        ? Row(
                            children: [
                              Container(
                                height: 80.h,
                                width: 80.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: getImageProviderFromServer(
                                          _getSubjectBySubjectId(state,
                                                  subjectResultItem.subjectId)!
                                              .image!
                                              .url),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(80.h)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Flexible(
                                child: Text(
                                  _getSubjectBySubjectId(
                                          state, subjectResultItem.subjectId)!
                                      .title_ru,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        : SizedBox()),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Divider(
                        height: 2.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                "Всего вопросов:",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${subjectResultItem.total}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                "Верно:",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${subjectResultItem.right}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                "Неверно:",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${subjectResultItem.notRight}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                "Баллов:",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${subjectResultItem.point}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList();
      if (newStats != null) {
        stats.addAll(newStats);
      }
    }

    Widget buttons = Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(50.w),
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.w),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: ColorConstant.violetToPinkGradient,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: ColorConstant.lightViolet,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 8.0,
                  )
                ],
              ),
              height: 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Работа над ошибками",
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
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(50.w),
            onTap: () {
              context.go(
                  "/${RouteConstant.statByAttemptIdName}/${widget.attemptId.toString()}");
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.w),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: ColorConstant.violetToPinkGradient,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: ColorConstant.lightViolet,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 8.0,
                  )
                ],
              ),
              height: 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Статистика",
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
        )),
      ],
    );
    stats.add(buttons);
    return stats;
  }

  SubjectEntity? _getSubjectBySubjectId(
      AttemptResultSuccessState state, int subjectId) {
    return state.stats.subjects
        ?.firstWhere((element) => element.id == subjectId);
  }
}
