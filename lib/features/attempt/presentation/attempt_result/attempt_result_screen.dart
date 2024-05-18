import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/attempt/presentation/attempt_result/bloc/attempt_result_bloc.dart';
import 'package:iu/features/attempt/presentation/attempt_result/widgets/attempt_result_card_widget.dart';
import 'package:iu/features/attempt/presentation/attempt_result/widgets/attempt_result_subject_card.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../../stat/domain/entities/subject_result_entity.dart';
import 'package:collection/collection.dart';

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
      appBar: const CommonAppBarWidget(
        text: "Статистика",
        imageUrl: "assets/images/icons/stat.webp",
        routeLink: RouteConstant.statMainName,
      ),
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
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                  child: Column(
                    children: [
                      AttemptResultCardWidget(
                        attemptEntity: state.stats.attempt,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ..._getSubjectCard(
                          state.stats.subjects, state.stats.subjectResult)
                    ],
                  )),
            );
          }
          return SizedBox(
            child: Text(widget.attemptId.toString()),
          );
        },
      ),
    );
  }

  List<Widget> _getSubjectCard(List<SubjectEntity>? subjects,
      List<SubjectResultEntity>? subjectResults) {
    List<Widget> widgets = [];
    if (subjects != null) {
      widgets = subjects.map((subjectItem) {
        final subjectResult = subjectResults?.firstWhereOrNull(
            (subjectResultEntity) =>
                subjectResultEntity.subjectId == subjectItem.id);
        return AttemptResultSubjectCard(
          subjectEntity: subjectItem,
          subjectResultEntity: subjectResult,
        );
      }).toList();
    }

    return widgets;
  }
}
