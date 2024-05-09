import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/bloc/tournament_awards/tournament_awards_bloc.dart';

import '../../../../../core/app_constants/color_constant.dart';

class TournamentAwardsWidget extends StatefulWidget {
  const TournamentAwardsWidget({super.key});

  @override
  State<TournamentAwardsWidget> createState() =>
      _SubTournamentAwardsWidgetState();
}

class _SubTournamentAwardsWidgetState extends State<TournamentAwardsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TournamentAwardsBloc, TournamentAwardsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is TournamentAwardsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TournamentAwardsSuccessState) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return _getCard(index + 1, "${state.awards[index].user?.name}",
                    "${state.awards[index].titleRu}");
              },
              itemCount: state.awards.length);
        }

        return SizedBox();
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
            "Приз: ${subtitle}",
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
