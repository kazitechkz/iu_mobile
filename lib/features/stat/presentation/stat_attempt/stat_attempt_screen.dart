import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/stat/presentation/stat_attempt/bloc/stat_attempt_bloc.dart';
import '../../../../core/services/image_service.dart';
import '../../domain/entities/stat_by_attempt_entity.dart';

class StatAttemptScreen extends StatefulWidget {
  final int attemptId;
  const StatAttemptScreen({super.key, required this.attemptId});

  @override
  State<StatAttemptScreen> createState() => _StatAttemptScreenState();
}

class _StatAttemptScreenState extends State<StatAttemptScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<StatAttemptBloc>()
        .add(StatGetByAttemptIdEvent(widget.attemptId));
  }

  @override
  void didUpdateWidget(covariant StatAttemptScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    context
        .read<StatAttemptBloc>()
        .add(StatGetByAttemptIdEvent(widget.attemptId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StatAttemptBloc, StatAttemptState>(
        listener: (BuildContext context, StatAttemptState state) {},
        builder: (BuildContext context, StatAttemptState state) {
          if (state is StatAttemptSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                child: Center(
                  child: Column(
                    children: _generateList(state),
                  ),
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  List<Widget> _generateList(StatAttemptSuccessState state) {
    List<Widget> list = state.stat.subjects.map((subjectItem) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: ColorConstant.lightPink,
            borderRadius: BorderRadius.circular(10.w)),
        constraints: BoxConstraints(
          minHeight: 120.h,
          minWidth: 320.w,
        ),
        child: Column(
          children:
              _getSubCategoryWidgetList(state, subjectItem, subjectItem.id),
        ),
      );
    }).toList();
    return list;
  }

  List<Widget> _getSubCategoryWidgetList(
      StatAttemptSuccessState state, SubjectEntity subjectItem, int subjectId) {
    List<StatByAttemptEntity> subcategoryStats = state.stat.statByAttempt
        .where((statByAttemptItem) => statByAttemptItem.subjectId == subjectId)
        .toList();

    List<Widget> subjectList = [
      Row(
        children: [
          Container(
            height: 80.h,
            width: 80.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: getImageProviderFromServer(subjectItem.image?.url),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(80.h)),
          ),
          SizedBox(
            width: 10.w,
          ),
          Flexible(
            child: Text(
              subjectItem.title_ru,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ];

    List<Widget> subcategoryWidgetList = subcategoryStats
        .map((subcategoryItem) => Container(
              margin: EdgeInsets.symmetric(vertical: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  border: Border.all(color: Colors.white)),
              child: Column(
                children: [
                  Row(children: [
                    Flexible(
                      child: Text(
                        subcategoryItem.subCategory?.title_ru ??
                            "Нет категории",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5.w),
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                            color: ColorConstant.lightViolet,
                            borderRadius: BorderRadius.circular(30.h)),
                        child: Icon(
                          FontAwesomeIcons.circleQuestion,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                      Text(
                        "Всего вопросов:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " ${subcategoryItem.total}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5.w),
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30.h)),
                        child: Icon(
                          FontAwesomeIcons.check,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                      Text(
                        "Верно:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " ${subcategoryItem.right}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5.w),
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30.h)),
                        child: Icon(
                          FontAwesomeIcons.xmark,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                      Text(
                        "Неверно:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " ${subcategoryItem.notRight}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50.w),
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.w),
                        color: ColorConstant.lightViolet,
                      ),
                      height: 45.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Пройти обучение",
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
                ],
              ),
            ))
        .toList();
    subjectList.addAll(subcategoryWidgetList);
    return subjectList;
  }
}
