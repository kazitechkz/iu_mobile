import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/techSupport/presentation/my_tech_support_list/widgets/tech_support_ticket.dart';

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
        body: BlocConsumer<MyTechSupportTicketsBloc, MyTechSupportTicketsState>(
      listener: (BuildContext context, MyTechSupportTicketsState state) {},
      builder: (BuildContext context, MyTechSupportTicketsState state) {
        if (state is MyTechSupportTicketsLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is MyTechSupportTicketsSuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              child: Column(
                children: _getListOfTickets(state),
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
