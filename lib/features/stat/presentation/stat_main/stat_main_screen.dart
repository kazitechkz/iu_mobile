import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';

import 'package:iu/features/stat/presentation/stat_main/bloc/stat_main_bloc.dart';
import 'package:iu/features/stat/presentation/stat_main/widgets/stat_main_widget.dart';

import '../../../../core/services/image_service.dart';

class StatMainScreen extends StatefulWidget {
  const StatMainScreen({super.key});

  @override
  State<StatMainScreen> createState() => _StatMainScreenState();
}

class _StatMainScreenState extends State<StatMainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StatMainBloc>().add(StatMainGetUNTStatEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StatMainBloc, StatMainState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is StatMainSuccessState) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
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
                                  context.go("/${RouteConstant.fullStatName}");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.w),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors:
                                          ColorConstant.violetToPinkGradient,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: ColorConstant.lightViolet,
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
                                      Text(
                                        "Посмотреть полную статистику",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
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
                              child: StatMainStatCard(
                            icon: FontAwesomeIcons.chartSimple,
                            name: "Попыток сдачи",
                            stat: state.untStatEntity.attemptCount,
                          )),
                          Expanded(
                              child: StatMainStatCard(
                            icon: FontAwesomeIcons.chartLine,
                            name: "Средний балл",
                            stat: state.untStatEntity.average,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: StatMainStatCard(
                            icon: FontAwesomeIcons.flagCheckered,
                            name: "Незавершено",
                            stat: state.untStatEntity.attemptCountUnfinished,
                          )),
                          Expanded(
                              child: StatMainStatCard(
                            icon: FontAwesomeIcons.circleQuestion,
                            name: "Вопросов пройдено",
                            stat: state.untStatEntity.attemptQuestionCount,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      (state.allAttempts?.data != null
                          ? ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Material(
                                  type: MaterialType.transparency,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50.w),
                                        topLeft: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(50.w),
                                        bottomRight: Radius.circular(15.0),
                                      ),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors:
                                            ColorConstant.violetToPinkGradient,
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: ColorConstant.lightViolet,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 2.0,
                                        )
                                      ],
                                    ),
                                    child: ListTile(
                                        visualDensity:
                                            VisualDensity(vertical: 3),
                                        shape: RoundedRectangleBorder(
                                          //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        leading: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.w),
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: ColorConstant
                                                  .violetToPinkGradient,
                                            ),
                                          ),
                                          height: 50.h,
                                          width: 50.h,
                                          child: Image.asset(
                                              'assets/images/many-mode.webp'),
                                        ),
                                        title: Text(
                                            "${state.allAttempts!.data[index].attemptType?.titleRu}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp)),
                                        subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: _getSubjectImages(
                                                state, index)),
                                        trailing: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.w),
                                            color: ColorConstant.lightBlue,
                                          ),
                                          height: 50.h,
                                          width: 50.h,
                                          child: Center(
                                            child: state.allAttempts!
                                                        .data[index].endAt !=
                                                    null
                                                ? InkWell(
                                                    onTap: () {
                                                      context.go(
                                                          '/${RouteConstant.attemptResultByAttemptIdName}/${state.allAttempts!.data[index].id}');
                                                    },
                                                    child: const Icon(
                                                      FontAwesomeIcons.info,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      context.go(
                                                          '/${RouteConstant.passAttemptById}/${state.allAttempts!.data[index].id}');
                                                    },
                                                    child: const Icon(
                                                      FontAwesomeIcons.play,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                          ),
                                        )),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 8.h,
                                );
                              },
                              itemCount: state.allAttempts!.data.length)
                          : CircularProgressIndicator())
                    ],
                  ),
                ),
              );
            }

            return SizedBox();
          }),
    );
  }

  List<Widget> _getSubjectImages(StatMainSuccessState state, int index) {
    List<Widget> listWidgets = [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Divider(
          height: 2.h,
        ),
      )
    ];
    List<Widget>? generatedList = (state.allAttempts!.data[index].subjects
        ?.map<Widget>((e) => Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Text(e.title_ru,
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.white)),
            ))
        .toList());
    if (generatedList != null) {
      if (state.allAttempts!.data[index].endAt == null) {
        generatedList.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Divider(
            height: 2.h,
          ),
        ));
        generatedList.add(
          TimerCountdown(
            colonsTextStyle: TextStyle(
                color: ColorConstant.orangeColorDark, fontSize: 16.sp),
            timeTextStyle: TextStyle(
                color: ColorConstant.orangeColorDark, fontSize: 16.sp),
            descriptionTextStyle: TextStyle(
                color: ColorConstant.orangeColorDark, fontSize: 14.sp),
            enableDescriptions: false,
            format: CountDownTimerFormat.hoursMinutesSeconds,
            endTime: DateTime.now().add(
              Duration(milliseconds: state.allAttempts!.data[index].timeLeft),
            ),
            onEnd: () {},
          ),
        );
      }

      listWidgets.addAll(generatedList);
    }
    return listWidgets;
  }

  Widget _getImageOfStat(StatMainSuccessState state, int index) {
    if (state.allAttempts?.data[index] != null) {
      if (state.allAttempts!.data[index].subjects!.length == 1) {
        return (getImageFromServer(
            state.allAttempts!.data[index].subjects?.first.image?.url));
      }
    }
    return Image.asset('assets/images/many-mode.webp');
  }
}
