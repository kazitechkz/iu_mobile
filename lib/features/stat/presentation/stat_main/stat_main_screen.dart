import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/attempt/domain/parameters/all_attempts_parameter.dart';
import 'package:iu/features/stat/presentation/stat_main/bloc/stat_main_bloc.dart';

class StatMainScreen extends StatefulWidget {
  const StatMainScreen({super.key});

  @override
  State<StatMainScreen> createState() => _StatMainScreenState();
}

class _StatMainScreenState extends State<StatMainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StatMainBloc>().add(StatMainGetUNTStatEvent());
    context.read<StatMainBloc>().add(
        StatMainAllAttemptsEvent(parameter: AllAttemptsParameter(page: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StatMainBloc, StatMainState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is StatMainSuccessState) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blue),
                              height: 60.h,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blue),
                              height: 80.h,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blue),
                              height: 80.h,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blue),
                              height: 80.h,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.blue),
                              height: 80.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }

            return SizedBox();
          }),
    );
  }
}
