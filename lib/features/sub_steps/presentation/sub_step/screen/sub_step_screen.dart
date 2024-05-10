import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:iu/features/sub_steps/presentation/sub_step/bloc/sub_step_bloc.dart';
import 'package:iu/features/sub_steps/presentation/sub_step/widgets/sub_steps_widget.dart';

import '../../../../../core/services/injection_main.container.dart';

class SubStepScreen extends StatefulWidget {
  final String stepID;
  const SubStepScreen({super.key, required this.stepID});

  @override
  State<SubStepScreen> createState() => _SubStepScreenState();
}

class _SubStepScreenState extends State<SubStepScreen> {

  @override
  void initState() {
    super.initState();
    sl<SubStepBloc>().addEvent(GetSubStepsEvent(widget.stepID));
  }

  @override
  void didUpdateWidget(covariant SubStepScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.stepID != oldWidget.stepID) {
      sl<SubStepBloc>().addEvent(GetSubStepsEvent(widget.stepID));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubStepBloc, SubStepState>(
      builder: (BuildContext context, SubStepState state) {
        // Построение виджета на основе состояния блока
        if (state is SubStepLoaded) {
          return subSteps(context, state.subStepEntities);
        } else if (state is SubStepLoading) {
          return const Center(
            child: GFLoader(type: GFLoaderType.ios),
          );
        } else if (state is SubStepErrorState) {
          return Text('Ошибка: ${state.failureData.message}');
        } else {
          return const Center(child: Text('Непредвиденное состояние блока'));
        }
      },
      listener: (BuildContext context, SubStepState state) {
        if (state is SubStepErrorState) {
          sl<SubStepBloc>().addEvent(GetSubStepsEvent(widget.stepID));
        }
      },
    );
  }
}
