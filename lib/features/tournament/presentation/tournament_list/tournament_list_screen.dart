import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/tournament/presentation/tournament_list/bloc/tournament_list_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_list/widgets/tournament_list_all.dart';

import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';

class TournamentListScreen extends StatefulWidget {
  const TournamentListScreen({super.key});

  @override
  State<TournamentListScreen> createState() => _TournamentListScreenState();
}

class _TournamentListScreenState extends State<TournamentListScreen>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  int currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<TournamentListBloc>().add(TournamentListGetActualEvent());
  }

  @override
  void didUpdateWidget(covariant TournamentListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    context.read<TournamentListBloc>().add(TournamentListGetActualEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Турнир",
        imageUrl: "assets/images/icons/tournament.webp",
        routeLink: RouteConstant.dashboardScreenName,
      ),
      body: BlocConsumer<TournamentListBloc, TournamentListState>(
        listener: (BuildContext context, TournamentListState state) {},
        builder: (BuildContext context, TournamentListState state) {
          if (state is TournamentListSuccessState) {
            return IndexedStack(
              index: currentPageIndex,
              children: [
                TournamentListStateWidget(
                  tournaments: state.data.open,
                  title: 'Активные турниры',
                ),
                TournamentListStateWidget(
                  tournaments: state.data.participated,
                  title: 'Я участвую',
                ),
              ],
            );
          }
          return SizedBox();
        },
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
          currentIndex: currentPageIndex,
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          selectedItemColor: ColorConstant.darkOrangeColor,
          unselectedItemColor: ColorConstant.grayColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.trophy),
              label: "Активные турниры",
              backgroundColor: ColorConstant.darkOrangeColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.play),
              label: "Я участвую",
              backgroundColor: ColorConstant.darkOrangeColor,
            ),
          ],
        ),
      ),
    );
  }
}
