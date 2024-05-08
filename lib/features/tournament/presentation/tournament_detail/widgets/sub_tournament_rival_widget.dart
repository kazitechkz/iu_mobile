import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/bloc/sub_tournament_rivals/sub_tournament_rivals_bloc.dart';

class SubTournamentRivalWidget extends StatefulWidget {
  final int stepId;

  const SubTournamentRivalWidget({super.key, required this.stepId});

  @override
  State<SubTournamentRivalWidget> createState() =>
      _SubTournamentRivalWidgetState();
}

class _SubTournamentRivalWidgetState extends State<SubTournamentRivalWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubTournamentRivalsBloc, SubTournamentRivalsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SubTournamentRivalsSuccessState) {
          if (widget.stepId == 2) {
            return ListView.builder(
                itemCount: state.rivalsOneFour?.length ?? 0,
                itemBuilder: (context, index) {
                  return _getCard(
                    state.rivalsOneFour?[index].rivalOneUser?.name ?? "",
                    state.rivalsOneFour?[index].rivalTwoUser?.name ?? "",
                    state.rivalsOneFour?[index].pointOne ?? 0,
                    state.rivalsOneFour?[index].pointTwo ?? 0,
                    (state.rivalsOneFour?[index].subTournament != null
                        ? ((state.rivalsOneFour?[index].subTournament?.time ??
                                    1) *
                                60000) -
                            (state.rivalsOneFour?[index].timeOne ?? 1)
                        : 0),
                    (state.rivalsOneFour?[index].subTournament != null
                        ? ((state.rivalsOneFour?[index].subTournament?.time ??
                                    1) *
                                60000) -
                            (state.rivalsOneFour?[index].timeTwo ?? 1)
                        : 0),
                  );
                });
          }
          if (widget.stepId == 3) {
            return ListView.builder(
                itemCount: state.rivalsOneTwo?.length ?? 0,
                itemBuilder: (context, index) {
                  return _getCard(
                    state.rivalsOneTwo?[index].rivalOneUser?.name ?? "",
                    state.rivalsOneTwo?[index].rivalTwoUser?.name ?? "",
                    state.rivalsOneTwo?[index].pointOne ?? 0,
                    state.rivalsOneTwo?[index].pointTwo ?? 0,
                    (state.rivalsOneTwo?[index].subTournament != null
                        ? ((state.rivalsOneTwo?[index].subTournament?.time ??
                                    1) *
                                60000) -
                            (state.rivalsOneTwo?[index].timeOne ?? 1)
                        : 0),
                    (state.rivalsOneTwo?[index].subTournament != null
                        ? ((state.rivalsOneTwo?[index].subTournament?.time ??
                                    1) *
                                60000) -
                            (state.rivalsOneTwo?[index].timeTwo ?? 1)
                        : 0),
                  );
                });
          }
          if (widget.stepId == 4) {
            return ListView.builder(
                itemCount: state.rivalsFinal?.length ?? 0,
                itemBuilder: (context, index) {
                  return _getCard(
                    state.rivalsFinal?[index].rivalOneUser?.name ?? "",
                    state.rivalsFinal?[index].rivalTwoUser?.name ?? "",
                    state.rivalsFinal?[index].pointOne ?? 0,
                    state.rivalsFinal?[index].pointTwo ?? 0,
                    (state.rivalsFinal?[index].subTournament != null
                        ? ((state.rivalsFinal?[index].subTournament?.time ??
                                    1) *
                                60000) -
                            (state.rivalsFinal?[index].timeOne ?? 1)
                        : 0),
                    (state.rivalsFinal?[index].subTournament != null
                        ? ((state.rivalsFinal?[index].subTournament?.time ??
                                    1) *
                                60000) -
                            (state.rivalsFinal?[index].timeTwo ?? 1)
                        : 0),
                  );
                });
          }
        }

        return SizedBox();
      },
    );
  }

  Widget _getCard(
    String rivalOne,
    String rivalTwo,
    int rivalOnePoint,
    int rivalTwoPoint,
    int rivalOneTime,
    int rivalTwoTime,
  ) {
    return Card(
      color: ColorConstant.violetFirst,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: ListTile(
                title: Text(
                  rivalOne,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "${Duration(milliseconds: rivalOneTime).inMinutes.remainder(60)} минут ${Duration(milliseconds: rivalOneTime).inSeconds.remainder(60)} секунд",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              constraints: BoxConstraints(
                minHeight: 30.h,
              ),
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "${rivalOnePoint} : ${rivalTwoPoint}",
                  style: TextStyle(
                      color: ColorConstant.violetFirst,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: ListTile(
                title: Text(
                  rivalTwo,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "${Duration(milliseconds: rivalTwoTime).inMinutes.remainder(60)} минут ${Duration(milliseconds: rivalTwoTime).inSeconds.remainder(60)} секунд",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp),
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }
}
