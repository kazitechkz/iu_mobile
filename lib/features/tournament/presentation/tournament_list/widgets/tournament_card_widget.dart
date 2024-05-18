import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/features/tournament/domain/entities/tournament_entity.dart';

import '../../../../../core/services/image_service.dart';

class TournamentCardWidget extends StatelessWidget {
  const TournamentCardWidget({super.key, required this.tournamentEntity});

  final TournamentEntity tournamentEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(
            "/${RouteConstant.tournamentDetailName}/${tournamentEntity.id}");
      },
      child: Container(
          height: 320.h,
          margin: EdgeInsets.symmetric(vertical: 15.h),
          constraints: BoxConstraints(
            minHeight: 320.h,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              image: DecorationImage(
                  image: getImageProviderFromServer(tournamentEntity.file?.url),
                  fit: BoxFit.cover)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.appBarColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      constraints: BoxConstraints(
                        minHeight: 80.h,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Center(
                                child: Container(
                                  height: 80.h,
                                  width: 80.h,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.w),
                                      image: DecorationImage(
                                          image: getImageProviderFromServer(
                                              tournamentEntity
                                                  .subject?.image?.url),
                                          fit: BoxFit.cover)),
                                ),
                              )),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  AutoSizeText(
                                    tournamentEntity.titleRu,
                                    maxLines: 3,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: Icon(
                                          FontAwesomeIcons.calendar,
                                          color: Colors.white,
                                          size: 14.sp,
                                        ),
                                      ),
                                      Expanded(
                                        child: AutoSizeText(
                                            "${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(tournamentEntity.startAt))} - ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(tournamentEntity.endAt))}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8.sp)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: Icon(
                                          FontAwesomeIcons.moneyCheckDollar,
                                          color: Colors.white,
                                          size: 14.sp,
                                        ),
                                      ),
                                      Expanded(
                                        child: AutoSizeText(
                                            "${tournamentEntity.price} KZT",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8.sp)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
