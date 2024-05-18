import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/bloc/tournament_detail_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/widgets/tournament_awards_widget.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/widgets/tournament_detail_widget.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/widgets/tournament_participate_widget.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/widgets/tournament_steps_widget.dart';

import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';

class TournamentDetailScreen extends StatefulWidget {
  const TournamentDetailScreen({super.key, required this.tournamentId});
  final int tournamentId;
  @override
  State<TournamentDetailScreen> createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState extends State<TournamentDetailScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Турнир ЕНТ",
        imageUrl: "assets/images/icons/tournament.webp",
        routeLink: RouteConstant.listTournamentName,
      ),
      body: IndexedStack(
        index: index,
        children: [
          TournamentDetailWidget(),
          TournamentParticipateWidget(tournamentId: widget.tournamentId),
          TournamentStepsWidget(),
          TournamentAwardsWidget(),
        ],
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        constraints: BoxConstraints(minHeight: 80.h),
        decoration: BoxDecoration(
          color: ColorConstant.appBarColor.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: ColorConstant.orangeColor,
          unselectedItemColor: ColorConstant.grayColor,
          currentIndex: index,
          onTap: (int newindex) {
            setState(() {
              index = newindex;
            });
          },
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.circleInfo),
              label: "О турнире",
              backgroundColor: ColorConstant.appBarColor.withOpacity(0.5),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.play),
              label: "Участвовать",
              backgroundColor: ColorConstant.appBarColor.withOpacity(0.5),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.timeline),
              label: "Этапы",
              backgroundColor: ColorConstant.appBarColor.withOpacity(0.5),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.award),
              label: "Призы",
              backgroundColor: ColorConstant.appBarColor.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
