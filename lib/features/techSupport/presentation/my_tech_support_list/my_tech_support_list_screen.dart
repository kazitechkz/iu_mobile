import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/features/techSupport/presentation/my_tech_support_list/widgets/tech_support_ticket.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/parameters/get_my_tech_support_tickets_parameter.dart';
import 'bloc/my_tech_support_tickets_bloc.dart';

class MyTechSupportListScreen extends StatefulWidget {
  const MyTechSupportListScreen({super.key});

  @override
  State<MyTechSupportListScreen> createState() =>
      _MyTechSupportListScreenState();
}

class _MyTechSupportListScreenState extends State<MyTechSupportListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MyTechSupportTicketsBloc>().add(MyTechSupportGetTicketsEvent(
        GetMyTechSupportTicketsParameter(page: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBarWidget(
          text: "Техподдержка",
          imageUrl: "assets/images/icons/techsupport.webp",
          routeLink: RouteConstant.dashboardScreenName,
        ),
        body: BlocConsumer<MyTechSupportTicketsBloc, MyTechSupportTicketsState>(
          listener: (BuildContext context, MyTechSupportTicketsState state) {},
          builder: (BuildContext context, MyTechSupportTicketsState state) {
            if (state is MyTechSupportTicketsLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is MyTechSupportTicketsSuccessState) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 20.h),
                          Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.8, 1),
                                  colors: [
                                    ColorConstant.bottomBarColor,
                                    ColorConstant.violetFirst
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20.w)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Техподдержка",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Icon(
                                          FontAwesomeIcons.book,
                                          color: Colors.white,
                                          size: 16.sp,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "1 предмет на выбор",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Icon(
                                          FontAwesomeIcons.clock,
                                          color: Colors.white,
                                          size: 16.sp,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "На выполнение дается строго отведенное время",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Icon(
                                          FontAwesomeIcons.language,
                                          color: Colors.white,
                                          size: 16.sp,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Выбор казахского и русского языка",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                      ..._getListOfTickets(state)
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ));
  }

  List<Widget> _getListOfTickets(MyTechSupportTicketsSuccessState state) {
    return state.tickets
        .map((ticket) => TechSupportTicket(
              ticketEntity: ticket,
            ))
        .toList();
  }
}
