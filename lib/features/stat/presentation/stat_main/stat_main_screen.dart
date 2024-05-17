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
import 'package:iu/features/stat/presentation/stat_main/widgets/stat_card_widget.dart';
import 'package:iu/features/stat/presentation/stat_main/widgets/stat_main_widget.dart';

import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';

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
      appBar: const CommonAppBarWidget(
        text: "Статистика",
        imageUrl: "assets/images/icons/stat.webp",
        routeLink: RouteConstant.dashboardScreenName,
      ),
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
                                      colors:[ColorConstant.darkOrangeColor, ColorConstant.orangeColor],
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
                                return StatCardWidget(attemptEntity: state.allAttempts?.data[index]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 15.h,
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

}
