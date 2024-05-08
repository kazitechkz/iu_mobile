import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/bloc/sub_tournament_participants/sub_tournament_participants_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/bloc/sub_tournament_results/sub_tournament_results_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/bloc/sub_tournament_rivals/sub_tournament_rivals_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/widgets/sub_tournament_rival_widget.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/widgets/sub_tournaments_result_widget.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/widgets/tournament_participants_widget.dart';
import 'package:collection/collection.dart';
import '../../../domain/parameters/get_sub_tournament_participant_parameter.dart';
import '../../../domain/parameters/get_sub_tournament_results_parameter.dart';
import '../bloc/tournament_detail_bloc.dart';

class TournamentStepsWidget extends StatefulWidget {
  const TournamentStepsWidget({super.key});

  @override
  State<TournamentStepsWidget> createState() => _TournamentStepsWidgetState();
}

class _TournamentStepsWidgetState extends State<TournamentStepsWidget>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        updateSteps(context, tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultTabController(
            length: 2,
            child: TabBar(
              padding: EdgeInsets.all(0),
              controller: tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(
                  child: Text("Участники"),
                ),
                Tab(
                  child: Text("Плейофф"),
                ),
                Tab(
                  child: Text("1/4"),
                ),
                Tab(
                  child: Text("1/2"),
                ),
                Tab(
                  child: Text("Финал"),
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            TournamentParticipantsWidget(),
            SubTournamentResultWidget(),
            SubTournamentRivalWidget(
              stepId: 2,
            ),
            SubTournamentRivalWidget(
              stepId: 3,
            ),
            SubTournamentRivalWidget(
              stepId: 4,
            ),
          ])),
        ],
      ),
    );
  }

  void updateSteps(BuildContext context, int page) {
    final tournamentDetailBloc = BlocProvider.of<TournamentDetailBloc>(context);
    if (tournamentDetailBloc.state is TournamentDetailSuccessState) {
      final state = tournamentDetailBloc.state as TournamentDetailSuccessState;
      if (page == 0) {
        final subTournament = state.tournament.tournament.subTournaments
            ?.firstWhereOrNull((stepItem) => stepItem.stepId == 1);
        final subTournamentParticipantsBloc =
            BlocProvider.of<SubTournamentParticipantsBloc>(context);
        if (subTournament != null &&
            subTournamentParticipantsBloc.state
                is! SubTournamentParticipantsSuccessState) {
          context.read<SubTournamentParticipantsBloc>().add(
                  SubTournamentGetParticipantsEvent(
                      GetSubTournamentParticipantsParameter(
                page: 1,
                id: subTournament.id,
              )));
        }
      }
      //Results
      if (page == 1) {
        final subTournament = state.tournament.tournament.subTournaments
            ?.firstWhereOrNull((stepItem) =>
                    stepItem.stepId ==
                    1 // Specify return type as SubTournamentEntity?
                );
        final subTournamentResultsBloc =
            BlocProvider.of<SubTournamentResultsBloc>(context);
        if (subTournament != null &&
            subTournamentResultsBloc.state
                is! SubTournamentResultsSuccessState) {
          context.read<SubTournamentResultsBloc>().add(
                  SubTournamentResultsBySubTournamentIdEvent(
                      GetSubTournamentResultsParameter(
                page: 1,
                id: subTournament.id,
              )));
        }
      }
      //Rivals
      if (page == 2) {
        final subTournament = state.tournament.tournament.subTournaments
            ?.firstWhereOrNull((stepItem) =>
                    stepItem.stepId ==
                    2 // Specify return type as SubTournamentEntity?
                );
        final subTournamentRivalBloc =
            BlocProvider.of<SubTournamentRivalsBloc>(context);
        if (subTournament != null &&
            subTournamentRivalBloc.state is! SubTournamentRivalsSuccessState) {
          context.read<SubTournamentRivalsBloc>().add(
              SubTournamentRivalsGetByIdEvent(
                  subTournamentId: subTournament.id, stepId: 2));
        }
        if (subTournament != null &&
            subTournamentRivalBloc.state is SubTournamentRivalsSuccessState) {
          final state =
              subTournamentRivalBloc.state as SubTournamentRivalsSuccessState;
          if (state.rivalsOneFour == null) {
            context.read<SubTournamentRivalsBloc>().add(
                SubTournamentRivalsGetByIdEvent(
                    subTournamentId: subTournament.id, stepId: 2));
          }
        }
      }
      if (page == 3) {
        final subTournament = state.tournament.tournament.subTournaments
            ?.firstWhereOrNull((stepItem) =>
                    stepItem.stepId ==
                    3 // Specify return type as SubTournamentEntity?
                );
        final subTournamentRivalBloc =
            BlocProvider.of<SubTournamentRivalsBloc>(context);
        if (subTournament != null &&
            subTournamentRivalBloc.state is! SubTournamentRivalsSuccessState) {
          context.read<SubTournamentRivalsBloc>().add(
              SubTournamentRivalsGetByIdEvent(
                  subTournamentId: subTournament.id, stepId: 3));
        }
        if (subTournament != null &&
            subTournamentRivalBloc.state is SubTournamentRivalsSuccessState) {
          final state =
              subTournamentRivalBloc.state as SubTournamentRivalsSuccessState;
          if (state.rivalsOneTwo == null) {
            context.read<SubTournamentRivalsBloc>().add(
                SubTournamentRivalsGetByIdEvent(
                    subTournamentId: subTournament.id, stepId: 3));
          }
        }
      }
      if (page == 4) {
        final subTournament = state.tournament.tournament.subTournaments
            ?.firstWhereOrNull((stepItem) =>
                    stepItem.stepId ==
                    4 // Specify return type as SubTournamentEntity?
                );
        final subTournamentRivalBloc =
            BlocProvider.of<SubTournamentRivalsBloc>(context);
        if (subTournament != null &&
            subTournamentRivalBloc.state is! SubTournamentRivalsSuccessState) {
          context.read<SubTournamentRivalsBloc>().add(
              SubTournamentRivalsGetByIdEvent(
                  subTournamentId: subTournament.id, stepId: 4));
        }
        if (subTournament != null &&
            subTournamentRivalBloc.state is SubTournamentRivalsSuccessState) {
          final state =
              subTournamentRivalBloc.state as SubTournamentRivalsSuccessState;
          if (state.rivalsFinal == null) {
            context.read<SubTournamentRivalsBloc>().add(
                SubTournamentRivalsGetByIdEvent(
                    subTournamentId: subTournament.id, stepId: 4));
          }
        }
      }
      //Rivals
    }
  }
}
