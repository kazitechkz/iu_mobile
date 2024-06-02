import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/bottom_sheet/gf_bottom_sheet.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:iu/features/techSupport/domain/parameters/get_tech_support_ticket_detail_parameter.dart';
import 'package:iu/features/techSupport/presentation/tech_support_detail/widgets/ticket_detail_body_widget.dart';
import 'package:iu/features/techSupport/presentation/tech_support_detail/widgets/ticket_detail_header_widget.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/entities/tech_support_message_entity.dart';
import 'bloc/tech_support_detail_bloc.dart';

class TechSupportDetailScreen extends StatefulWidget {
  const TechSupportDetailScreen({super.key, required this.ticketId});
  final int ticketId;
  @override
  State<TechSupportDetailScreen> createState() =>
      _TechSupportDetailScreenState();
}

class _TechSupportDetailScreenState extends State<TechSupportDetailScreen> {
  final messageController = TextEditingController();
  final GFBottomSheetController _controller = GFBottomSheetController();
  @override
  void initState() {
    super.initState();
    _handleInitialState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    messageController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Техподдержка",
        imageUrl: "assets/images/icons/techsupport.webp",
        routeLink: RouteConstant.techSupportListName,
      ),
      body: BlocConsumer<TechSupportDetailBloc, TechSupportDetailState>(
        listener: (BuildContext context, TechSupportDetailState state) {
          if (state is TechSupportDetailClosedState) {
            _handleInitialState();
          }
        },
        builder: (BuildContext context, TechSupportDetailState state) {
          if (state is TechSupportDetailLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TechSupportDetailSuccessState) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              _controller.isBottomSheetOpened
                                  ? _controller.hideBottomSheet()
                                  : _controller.showBottomSheet();
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30.w),
                                  color: ColorConstant.peachColor),
                              child: AutoSizeText(
                                maxLines: 2,
                                "Закрыть тикет",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          TicketDetailHeaderWidget(ticket: state.ticket),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            constraints: BoxConstraints(minHeight: 100.h),
                            decoration: BoxDecoration(
                                color: ColorConstant.appBarColor,
                                border:
                                    Border.all(color: ColorConstant.peachColor),
                                borderRadius: BorderRadius.circular(20.w)),
                            child: Column(
                              children: state.messages
                                  .map((messageEntity) => _getMessage(
                                      state.ticket.userId, messageEntity))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
      bottomSheet: GFBottomSheet(
        animationDuration: 600,
        controller: _controller,
        contentBody: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: ColorConstant.appBarColor,
              border: Border.all(color: ColorConstant.peachColor, width: 2)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [Expanded(child: SizedBox())],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleInitialState() {
    context.read<TechSupportDetailBloc>().add(TechSupportDetailGetByIdEvent(
        parameter: GetTechSupportTicketDetailParameter(
            ticket_id: widget.ticketId, page: 1)));
  }

  Widget _getMessage(int userId, TechSupportMessageEntity message) {
    if (message.userId == userId) {
      return Row(
        children: [
          Expanded(
              flex: 9, child: TicketDetailBodyWidget(messageEntity: message)),
          Expanded(flex: 1, child: SizedBox()),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 9, child: TicketDetailBodyWidget(messageEntity: message)),
        ],
      );
    }
  }
}
