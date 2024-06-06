import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/attempt_setting/presentation/my_attempt_settings/widgets/many_unt_card_widget.dart';
import 'package:iu/features/attempt_setting/presentation/my_attempt_settings/widgets/single_unt_card_widget.dart';

import '../bloc/my_attempt_settings_bloc.dart';

class ManyUntWidget extends StatefulWidget {
  const ManyUntWidget({super.key});

  @override
  State<ManyUntWidget> createState() => _ManyUntWidgetState();
}

class _ManyUntWidgetState extends State<ManyUntWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAttemptSettingsManyBloc,
        MyAttemptSettingsManyState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyAttemptSettingsManyLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MyAttemptSettingsManySuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h),
              child: Column(
                children: state.manyUntData
                    .map((manyUnt) => ManyUntCardWidget(
                    attemptSettingEntity: manyUnt))
                    .toList(),
              ),
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}
