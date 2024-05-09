import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/tournament/domain/entities/get_subtournament_detail_entity.dart';

import '../../../domain/entities/get_tournament_detail_entity.dart';
import '../bloc/tournament_detail_bloc.dart';

class TournamentParticipateWidget extends StatefulWidget {
  final int tournamentId;
  const TournamentParticipateWidget({super.key, required this.tournamentId});

  @override
  State<TournamentParticipateWidget> createState() =>
      _TournamentParticipateWidgetState();
}

class _TournamentParticipateWidgetState
    extends State<TournamentParticipateWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TournamentDetailBloc, TournamentDetailState>(
        listener: (context, state) {
      if (state is! TournamentDetailSuccessState) {
        context
            .read<TournamentDetailBloc>()
            .add(TournamentDetailGetActualEvent(widget.tournamentId));
      }
    }, builder: (context, state) {
      if (state is TournamentDetailLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TournamentDetailSuccessState) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: 320.h),
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      color: ColorConstant.linkColor),
                  child: Column(
                    children: _checkAccess(state.tournament),
                  ),
                )
              ],
            ),
          ),
        );
      }
      return SizedBox();
    });
  }

  List<Widget> _checkAccess(GetTournamentDetailEntity entity) {
    List<Widget> result = [];
    if (entity.currentSubTournament != null) {
      result.add(Text(
        "${entity.currentSubTournament?.tournamentStep?.titleRu}",
        style: TextStyle(color: Colors.white, fontSize: 12.sp),
      ));
      if (entity.currentSubTournament?.stepId == 1) {
        //На первом этапе у пользователя есть результаты
        if (entity.currentSubTournament?.subTournamentResults != null &&
            (entity.currentSubTournament?.subTournamentResults?.length ?? 0) >
                0) {
          result.add(Text(
            "Вы уже сдали данное тестирование",
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ));
        }
        //Результатов нет
        else {
          if (entity.isJoin == true) {
            result.add(Text(
              "Я готов сдать тест",
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ));
          } else {
            result.add(Text(
              "Заплатить чтобы сдать тест",
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ));
          }
        }
      } else {
        if (entity.currentSubTournament?.subTournamentResults != null) {
          if ((entity.currentSubTournament?.subTournamentResults?.length ?? 0) >
              0) {
            result.add(Text(
              "Вы уже сдали данное тестирование",
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ));
          }
        }
        //Результатов нет
        else {
          if (entity.isJoin == true) {
            result.add(Text(
              "Я готов сдать тест",
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ));
          } else {
            result.add(Text(
              "Заплатить чтобы сдать тест",
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ));
          }
        }
      }
    }
    print(result);
    return result;
  }
}
