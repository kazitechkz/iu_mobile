import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/features/tournament/presentation/tournament_list/widgets/tournament_card_widget.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../domain/entities/tournament_entity.dart';

class TournamentListStateWidget extends StatelessWidget {
  const TournamentListStateWidget(
      {super.key, required this.tournaments, required this.title});
  final List<TournamentEntity> tournaments;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  "${title}",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                    decoration: BoxDecoration(
                        color: ColorConstant.blackColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Все турниры",
                          style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              FontAwesomeIcons.chevronRight,
                              color: Colors.white,
                              size: 12.sp,
                            ))
                      ]),
                    ))
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
              children: tournaments
                  .map((tournamentEntity) =>
                      TournamentCardWidget(tournamentEntity: tournamentEntity))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
