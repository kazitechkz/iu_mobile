import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/stat/domain/parameters/full_stat_parameter.dart';
import 'package:iu/features/stat/presentation/full_stat/bloc/full_stat_bloc.dart';

import '../stat_main/bloc/stat_main_bloc.dart';

class FullStatScreen extends StatefulWidget {
  const FullStatScreen({super.key});

  @override
  State<FullStatScreen> createState() => _FullStatScreenState();
}

class _FullStatScreenState extends State<FullStatScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<FullStatBloc>()
        .add(FullStatGetStatsEvent(FullStatParameter()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<FullStatBloc, FullStatState>(
      listener: (BuildContext context, FullStatState state) {},
      builder: (BuildContext context, FullStatState state) {
        if (state is FullStatLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FullStatSuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              child: Column(
                children: [
                  Container(
                    width: 320.w,
                    height: 220.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, int) {
                          return SizedBox(
                            child: Text(int.toString()),
                          );
                        }),
                  )
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    ));
  }
}
