import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/stat/presentation/stat_attempt/bloc/stat_attempt_bloc.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/entities/stat_by_attempt_entity.dart';
import '../full_stat/widget/subject_header_widget.dart';
import '../full_stat/widget/subject_stat_body_widget.dart';
import '../full_stat/widget/subject_stat_full_card_widget.dart';

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
      appBar: CommonAppBarWidget(
        text: "Результат сдачи",
        imageUrl: "assets/images/icons/stat.webp",
        routeLink:
            RouteConstant.attemptResultByAttemptIdName + "/${widget.attemptId}",
      ),
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
    List<Widget> listWidgets = [];

    if (state.stat.subjects.length > 0) {
      state.stat.subjects.forEach((subjectItem) {
        List<Widget> listOfSubjectCard = [];
        if (state.stat.subjects != null) {
          listOfSubjectCard.add(SubjectHeaderWidget(subjectItem: subjectItem));
          state.stat.statByAttempt
              .where((elItem) => elItem.subjectId == subjectItem.id)
              .forEach((element) {
            listOfSubjectCard.add(SubjectStatBodyWidget(
                subjectId: subjectItem.id,
                subCategory: element.subCategory,
                right: element.right ?? 0,
                notRight: element.notRight ?? 0));
          });
          listWidgets
              .add(SubjectStatFullCardWidget(listOfWidget: listOfSubjectCard));
        }
      });
    }

    return listWidgets;
  }
}
