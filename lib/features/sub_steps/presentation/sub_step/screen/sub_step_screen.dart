import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/features/sub_steps/presentation/sub_step/bloc/sub_step_bloc.dart';
import 'package:iu/features/sub_steps/presentation/sub_step/widgets/sub_steps_widget.dart';

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
    context.read<SubStepBloc>().add(GetSubStepsEvent(widget.stepID));
  }

  @override
  void didUpdateWidget(covariant SubStepScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.stepID != oldWidget.stepID) {
      context.read<SubStepBloc>().add(GetSubStepsEvent(widget.stepID));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubStepBloc, SubStepState>(
      builder: (BuildContext context, SubStepState state) {
        if(state is SubStepLoaded) {
          print(state.subStepEntities);
          return FractionallySizedBox(
            heightFactor: 0.5,
            child: subSteps(context, state.subStepEntities),
          );
        }
        return Center();
      }, listener: (BuildContext context, SubStepState state) {  },
    );
  }
}
