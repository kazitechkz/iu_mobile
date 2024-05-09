import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:iu/core/services/image_service.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/app_constants/route_constant.dart';
import '../../../domain/entities/tournament_entity.dart';

class TournamentListCardWidget extends StatefulWidget {
  const TournamentListCardWidget({super.key, required this.tournamentEntity});

  final TournamentEntity tournamentEntity;

  @override
  State<TournamentListCardWidget> createState() =>
      _TournamentListCardWidgetState();
}

class _TournamentListCardWidgetState extends State<TournamentListCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
              getImageFromString(widget.tournamentEntity.file?.url)),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black
                .withOpacity(0.6), // Adjust the opacity to control the darkness
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
                child: Text(
              widget.tournamentEntity.titleRu,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            )),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.clock,
                  color: Colors.white,
                  size: 14.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Flexible(
                  child: Text(
                    "${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(widget.tournamentEntity.startAt))} - ${DateFormat("dd/MM/yyyy HH:mm").format(DateTime.parse(widget.tournamentEntity.endAt))}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.moneyBills,
                  color: Colors.white,
                  size: 14.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Flexible(
                  child: Text(
                    "${widget.tournamentEntity.price} KZT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50.w),
                    onTap: () {
                      context.go(
                          "/${RouteConstant.tournamentDetailName}/${widget.tournamentEntity.id}");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.w),
                        color: ColorConstant.linkColor,
                      ),
                      height: 60.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Подробнее",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Icon(
                            FontAwesomeIcons.chevronRight,
                            size: 20.sp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
