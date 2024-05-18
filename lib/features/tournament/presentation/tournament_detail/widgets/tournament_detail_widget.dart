import 'dart:ui';

import 'package:accordion/accordion_section.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:iu/core/helpers/color_helper.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: AutoSizeText(
                      maxLines: 1,
                      "Турнир",
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              constraints: BoxConstraints(
                                minHeight: 120.w,
                                minWidth: 120.w,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.w),
                                  image: DecorationImage(
                                      image: getImageProviderFromServer(state
                                          .tournament.tournament.file?.url),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              AutoSizeText(
                                state.tournament.tournament.titleRu,
                                maxLines: 5,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: AutoSizeText(
                      maxLines: 1,
                      "Правила и описание турнира",
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  GFAccordion(
                      collapsedTitleBackgroundColor:
                          ColorHelper.getMainSubjectColor(
                              state.tournament.tournament.subjectId),
                      expandedTitleBackgroundColor:
                          ColorHelper.getMainSubjectColor(
                              state.tournament.tournament.subjectId),
                      contentBackgroundColor: ColorHelper.getSecondSubjectColor(
                          state.tournament.tournament.subjectId),
                      titleBorderRadius: BorderRadius.circular(10.w),
                      contentBorderRadius: BorderRadius.circular(10.w),
                      titleChild: Text(
                        "Правила",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      contentChild: Html(
                        data: state.tournament.tournament.ruleRu,
                      ),
                      collapsedIcon: Icon(
                        FontAwesomeIcons.chevronDown,
                        color: Colors.white,
                        size: 12.sp,
                      ),
                      expandedIcon: Icon(
                        FontAwesomeIcons.chevronUp,
                        color: Colors.white,
                        size: 12.sp,
                      )),
                  GFAccordion(
                      collapsedTitleBackgroundColor:
                          ColorHelper.getMainSubjectColor(
                              state.tournament.tournament.subjectId),
                      expandedTitleBackgroundColor:
                          ColorHelper.getMainSubjectColor(
                              state.tournament.tournament.subjectId),
                      contentBackgroundColor: ColorHelper.getSecondSubjectColor(
                          state.tournament.tournament.subjectId),
                      titleBorderRadius: BorderRadius.circular(10.w),
                      contentBorderRadius: BorderRadius.circular(10.w),
                      titleChild: Text(
                        "Описание",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      contentChild: Html(
                        data: state.tournament.tournament.descriptionRu,
                      ),
                      collapsedIcon: Icon(
                        FontAwesomeIcons.chevronDown,
                        color: Colors.white,
                        size: 12.sp,
                      ),
                      expandedIcon: Icon(
                        FontAwesomeIcons.chevronUp,
                        color: Colors.white,
                        size: 12.sp,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: AutoSizeText(
                      maxLines: 1,
                      "Детали турнира",
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              constraints: BoxConstraints(
                                minHeight: 80.w,
                                minWidth: 80.w,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.w),
                                  image: DecorationImage(
                                      image: getImageProviderFromServer(state
                                          .tournament
                                          .tournament
                                          .subject
                                          ?.image
                                          ?.url),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Дисциплина",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AutoSizeText(
                                "${state.tournament.tournament.subject?.title_ru}",
                                maxLines: 5,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  _getCard(
                      FontAwesomeIcons.clock,
                      "Даты проведения",
                      "${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(state.tournament.tournament.startAt))} - ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(state.tournament.tournament.endAt))}",
                      state.tournament.tournament.subjectId),
                  (state.tournament.winnerTournament != null
                      ? _getCard(
                          FontAwesomeIcons.award,
                          "Победитель",
                          state.tournament.winnerTournament?.name ?? "",
                          state.tournament.tournament.subjectId)
                      : SizedBox()),
                  (state.tournament.currentSubTournament != null
                      ? _getCard(
                          FontAwesomeIcons.stairs,
                          "Текущий этап",
                          state.tournament.currentSubTournament?.tournamentStep
                                  ?.titleRu ??
                              "",
                          state.tournament.tournament.subjectId)
                      : SizedBox()),
                  _getCard(
                      FontAwesomeIcons.book,
                      "Дисциплина",
                      state.tournament.tournament.subject?.title_ru ?? "",
                      state.tournament.tournament.subjectId),
                  _getCard(
                      FontAwesomeIcons.moneyBill,
                      "Стоимость участия",
                      state.tournament.tournament.price.toString() + " KZT",
                      state.tournament.tournament.subjectId),
                  _getCard(
                      FontAwesomeIcons.language,
                      "Доступные языки",
                      _getLanguage(state.tournament.tournament),
                      state.tournament.tournament.subjectId),
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

  Widget _getCard(IconData icon, String title, String subtitle, int subjectId) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                constraints: BoxConstraints(
                  minHeight: 80.w,
                  minWidth: 80.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorHelper.getMainSubjectColor(subjectId),
                          ColorConstant.appBarColor
                        ]),
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 36.sp,
                    ),
                  ),
                ),
              ),
            )),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${title}",
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                AutoSizeText(
                  "${subtitle}",
                  maxLines: 5,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    return Card(
      elevation: 2.0,
      color: ColorConstant.appBarColor,
      shadowColor: ColorConstant.blackColor,
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
