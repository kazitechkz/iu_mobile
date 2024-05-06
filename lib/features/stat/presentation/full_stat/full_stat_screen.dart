import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/str_helper.dart';
import 'package:iu/features/stat/domain/parameters/full_stat_parameter.dart';
import 'package:iu/features/stat/presentation/full_stat/bloc/full_stat_bloc.dart';
import 'package:iu/features/stat/presentation/full_stat/widget/full_stat_card.dart';
import 'package:iu/features/stat/presentation/full_stat/widget/subject_header_widget.dart';
import 'package:iu/features/stat/presentation/full_stat/widget/subject_stat_body_widget.dart';
import 'package:iu/features/stat/presentation/full_stat/widget/subject_stat_full_card_widget.dart';

import '../stat_main/bloc/stat_main_bloc.dart';

class FullStatScreen extends StatefulWidget {
  const FullStatScreen({super.key});

  @override
  State<FullStatScreen> createState() => _FullStatScreenState();
}

class _FullStatScreenState extends State<FullStatScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<FullStatBloc>()
        .add(FullStatGetStatsEvent(FullStatParameter()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<FullStatBloc, FullStatState>(
      listener: (BuildContext context, FullStatState state) {
        if(state is FullStatSuccessState){
          if(state.subjects == null){
            context.read<FullStatBloc>().add(FullStatGetSubjectsEvent());
          }
          if(state.attemptTypes == null){
            context.read<FullStatBloc>().add(FullStatGetAttemptTypesEvent());

          }
        }

      },
      builder: (BuildContext context, FullStatState state) {
        if (state is FullStatLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FullStatSuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
              child: Column(
                children: [
                  Container(
                    width: 320.w,
                    height: 180.h,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FullStatCard(
                              statNumber: state.stat.count.toString()??"0",
                              icon: FontAwesomeIcons.listCheck,
                              color: ColorConstant.lightViolet,
                              title: "Всего попыток сдачи"
                          ),
                          FullStatCard(
                              statNumber: state.stat.average != null ? state.stat.average.toString() : "0",
                              icon: FontAwesomeIcons.handPeace,
                              color: ColorConstant.lightBlue,
                              title: "Средний балл"
                          ),
                          FullStatCard(
                              statNumber: state.stat.max != null ? state.stat.max.toString() : "0",
                              icon: FontAwesomeIcons.thumbsUp,
                              color: Colors.green,
                              title: "Наивысший балл"
                          ),
                          FullStatCard(
                              statNumber: state.stat.min != null ? state.stat.min.toString() : "0",
                              icon: FontAwesomeIcons.thumbsDown,
                              color: Colors.redAccent,
                              title: "Наименьший балл"
                          ),
                          FullStatCard(
                              statNumber: StrHelper.beautifulInteger(state.stat.questionQuantity??0),
                              icon: FontAwesomeIcons.question,
                              color: Colors.yellow,
                              title: "Пройдено вопросов"
                          ),
                        ],
                  )
                  ),
                  SizedBox(height: 10.h,),
                  ...getSubjectStatistics(state),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    ));
  }
  List<Widget> getSubjectStatistics(FullStatSuccessState state){
    List<Widget> listWidgets = [];


    if((state.subjects?.length??0) > 0){
        state.subjects?.forEach((subjectItem){
          List<Widget> listOfSubjectCard = [];
          if(state.stat.subjects != null){
            if(state.stat.subjects!.containsKey(subjectItem.id)){
              listOfSubjectCard.add(SubjectHeaderWidget(subjectItem: subjectItem));
              if(state.stat.subjects![subjectItem.id] != null){
                state.stat.subjects?[subjectItem.id]?.forEach(
                        (key, value) {
                      if(value != null){
                        listOfSubjectCard.add(SubjectStatBodyWidget(subCategory:value.subCategory,right: value.right??0, notRight: value.notRight??0));
                      }
                    }
                );
              }

              listWidgets.add(SubjectStatFullCardWidget(listOfWidget: listOfSubjectCard));
            }
          }
        });
      }

    return listWidgets;
  }
}
