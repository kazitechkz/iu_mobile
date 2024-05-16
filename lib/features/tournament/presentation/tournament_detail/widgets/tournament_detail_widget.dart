import 'package:accordion/accordion_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/services/image_service.dart';
import '../../../domain/entities/tournament_step_entity.dart';
import '../bloc/tournament_detail_bloc.dart';

class TournamentDetailWidget extends StatefulWidget {
  const TournamentDetailWidget({super.key});

  @override
  State<TournamentDetailWidget> createState() => _TournamentDetailWidgetState();
}

class _TournamentDetailWidgetState extends State<TournamentDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TournamentDetailBloc, TournamentDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                children: [
                  Container(
                    height: 320.h,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(getImageFromString(
                            state.tournament.tournament.file?.url)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  _getCard(
                      FontAwesomeIcons.trophy,
                      state.tournament.tournament.titleRu,
                      "Наименование турнира"),
                  _getCard(
                      FontAwesomeIcons.clock,
                      "${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(state.tournament.tournament.startAt))} - ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(state.tournament.tournament.endAt))}",
                      "Даты проведения"),
                  (state.tournament.winnerTournament != null
                      ? _getCard(
                          FontAwesomeIcons.award,
                          state.tournament.winnerTournament?.name ?? "",
                          "Победитель")
                      : SizedBox()),
                  (state.tournament.currentSubTournament != null
                      ? _getCard(
                          FontAwesomeIcons.stairs,
                          state.tournament.currentSubTournament?.tournamentStep
                                  ?.titleRu ??
                              "",
                          "Текущий этап")
                      : SizedBox()),
                  _getCard(
                      FontAwesomeIcons.book,
                      state.tournament.tournament.subject?.title_ru ?? "",
                      "Дисциплина"),
                  _getCard(
                      FontAwesomeIcons.moneyBill,
                      state.tournament.tournament.price.toString() + " KZT",
                      "Стоимость участия"),
                  _getCard(
                      FontAwesomeIcons.language,
                      _getLanguage(state.tournament.tournament),
                      "Доступные языки"),
                ],
              ),
            ),
          );
        }
        return SizedBox(
          height: 10.h,
        );
      },
    );
  }

  Widget _getCard(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 2.0,
      color: ColorConstant.orangeColor,
      shadowColor: ColorConstant.orangeColor,
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
              child: Icon(
                icon,
                color: ColorConstant.orangeColor,
                size: 18.sp,
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
        ),
      ),
    );
  }

  String _getLanguage(TournamentEntity tournamentEntity) {
    String output = "";
    int i = 1;
    if (tournamentEntity.locales != null) {
      tournamentEntity.locales?.forEach((localeElement) {
        if (localeElement != null) {
          output += "${localeElement.title}";
          if (i < (tournamentEntity.locales?.length ?? i)) {
            output += ",";
          }
        }
        i++;
      });
    }
    return output;
  }
}
