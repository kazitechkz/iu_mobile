import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/tournament/presentation/tournament_list/bloc/tournament_list_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_list/widgets/tournament_card_widget.dart';
import 'package:iu/features/tournament/presentation/tournament_list/widgets/tournament_list_carousel.dart';

class TournamentListScreen extends StatefulWidget {
  const TournamentListScreen({super.key});

  @override
  State<TournamentListScreen> createState() => _TournamentListScreenState();
}

class _TournamentListScreenState extends State<TournamentListScreen>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

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
        body: BlocConsumer<TournamentListBloc, TournamentListState>(
      listener: (BuildContext context, TournamentListState state) {},
      builder: (BuildContext context, TournamentListState state) {
        if (state is TournamentListLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is TournamentListSuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Column(
              children: [
                TournamentListCarousel(),
                SizedBox(
                  height: 30.h,
                ),
                DefaultTabController(
                  length: 2,
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Text("Актуальные"),
                      ),
                      Tab(
                        child: Text("Я участвую"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: [
                    // Contents of Tab 1
                    ListView.builder(
                      itemCount: state.data.open.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (state.data.open[index] != null) {
                          return TournamentListCardWidget(
                              tournamentEntity: state.data.open[index]);
                        }
                      },
                    ),
                    // Contents of Tab 2
                    ListView.builder(
                      itemCount: state.data.participated.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (state.data.participated[index] != null) {
                          return TournamentListCardWidget(
                              tournamentEntity: state.data.participated[index]);
                        }
                      },
                    ),
                    // Contents of Tab 3
                  ],
                )),
              ],
            ),
          );
        }
        return SizedBox();
      },
    ));
  }
}
