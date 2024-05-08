import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/bloc/sub_tournament_participants/sub_tournament_participants_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/bloc/tournament_detail_bloc.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../domain/parameters/get_sub_tournament_participant_parameter.dart';

class TournamentParticipantsWidget extends StatefulWidget {
  const TournamentParticipantsWidget({super.key});
  @override
  State<TournamentParticipantsWidget> createState() =>
      _TournamentParticipantsWidgetState();
}

class _TournamentParticipantsWidgetState
    extends State<TournamentParticipantsWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubTournamentParticipantsBloc,
        SubTournamentParticipantsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SubTournamentParticipantsSuccessState) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return _getCard(
                    index + 1,
                    "${state.participants[index].user?.name}",
                    "${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(state.participants[index].createdAt ?? DateTime.now().toString()))}");
              },
              itemCount: state.participants.length);
        }
        return SizedBox(
          child: Text("Ждем когда объявят турнир ....."),
        );
      },
    );
  }

  Widget _getCard(
    int order,
    String title,
    String subtitle,
  ) {
    return Card(
      elevation: 2.0,
      color: ColorConstant.violetFirst,
      shadowColor: ColorConstant.lightViolet,
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
              child: Text(
                order.toString(),
                style: TextStyle(
                    color: ColorConstant.violetFirst, fontSize: 18.sp),
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
          subtitle: Text(
            "Присоединился: ${subtitle}",
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
