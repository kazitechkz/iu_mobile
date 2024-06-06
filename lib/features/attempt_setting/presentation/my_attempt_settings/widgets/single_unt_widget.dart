import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/attempt_setting/presentation/my_attempt_settings/widgets/single_unt_card_widget.dart';

import '../bloc/my_attempt_settings_bloc.dart';

class SingleUntWidget extends StatefulWidget {
  const SingleUntWidget({super.key});

  @override
  State<SingleUntWidget> createState() => _SingleUntWidgetState();
}

class _SingleUntWidgetState extends State<SingleUntWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAttemptSettingsSingleBloc,
        MyAttemptSettingsSingleState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyAttemptSettingsSingleLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MyAttemptSettingsSingleSuccessState) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h),
              child: Column(
                children: state.singleUntData
                    .map((singleUntData) => SingleUntCardWidget(
                        attemptSettingStudentEntity: singleUntData))
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
