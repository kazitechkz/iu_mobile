import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/bloc/sub_tournament_results/sub_tournament_results_bloc.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../domain/parameters/get_sub_tournament_results_parameter.dart';

class SubTournamentResultWidget extends StatefulWidget {
  const SubTournamentResultWidget({super.key});
  @override
  State<SubTournamentResultWidget> createState() =>
      _SubTournamentResultWidgetState();
}

class _SubTournamentResultWidgetState extends State<SubTournamentResultWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubTournamentResultsBloc, SubTournamentResultsState>(
        listener: (builder, state) {},
        builder: (builder, state) {
          if (state is SubTournamentResultsSuccessState) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return _getCard(
                    index + 1,
                    "${state.results[index].user?.name}",
                    (state.results[index].subTournament != null
                        ? ((state.results[index].subTournament?.time ?? 1) *
                                60000) -
                            (state.results[index].time ?? 1)
                        : 0),
                    state.results[index].point ?? 0,
                    index < 8,
                  );
                },
                itemCount: state.results.length);
          }
          if (state is SubTournamentResultsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            child: Text("Ждем когда объявят результаты ....."),
          );
        });
  }

  Widget _getCard(
    int order,
    String title,
    int subtitle,
    int point,
    bool isWinner,
  ) {
    return Card(
      elevation: 2.0,
      color: isWinner ? ColorConstant.violetColor : ColorConstant.grayColor,
      shadowColor:
          isWinner ? ColorConstant.violetColor : ColorConstant.grayColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: ListTile(
          leading: Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.h),
            ),
            child: Center(
              child: isWinner
                  ? Icon(
                      FontAwesomeIcons.award,
                      color: ColorConstant.violetColor,
                      size: 18.sp,
                    )
                  : Text(
                      order.toString(),
                      style: TextStyle(
                          color: isWinner
                              ? ColorConstant.violetColor
                              : ColorConstant.grayColor,
                          fontSize: 18.sp),
                    ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
          subtitle: Text(
            "Время сдачи: ${Duration(milliseconds: subtitle).inMinutes.remainder(60)} минут ${Duration(milliseconds: subtitle).inSeconds.remainder(60)} секунд",
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
          trailing: Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.h),
            ),
            child: Center(
              child: Text(
                point.toString(),
                style: TextStyle(
                    color: isWinner
                        ? ColorConstant.violetColor
                        : ColorConstant.grayColor,
                    fontSize: 18.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
