import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/features/steps/presentation/detail/bloc/step_detail_bloc.dart';
import 'package:iu/features/steps/presentation/detail/widgets/stepper_widget.dart';

import '../../../../../core/services/injection_main.container.dart';
import '../../../../../core/widgets/common_app_bar_widget.dart';

class StepDetailScreen extends StatefulWidget {
  final String subjectID;

  const StepDetailScreen({super.key, required this.subjectID});

  @override
  State<StepDetailScreen> createState() => _StepDetailScreenState();
}

class _StepDetailScreenState extends State<StepDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StepDetailBloc>().add(GetStepDetailEvent(widget.subjectID));
  }

  @override
  void didUpdateWidget(covariant StepDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.subjectID != oldWidget.subjectID) {
      context.read<StepDetailBloc>().add(GetStepDetailEvent(widget.subjectID));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StepDetailBloc, StepDetailState>(
      listener: (context, state) {
        if (state is StepDetailErrorState) {
          context.read<StepDetailBloc>().add(GetStepDetailEvent(widget.subjectID));
        }
      },
      builder: (context, state) {
        if (state is StepDetailLoading) {
          return const Center(
            child: GFLoader(type: GFLoaderType.ios),
          );
        }
        if (state is StepDetailErrorState) {
          return Center(
              child: TextButton(
            onPressed: () async {
              context.read<StepDetailBloc>().add(GetStepDetailEvent(widget.subjectID));
            },
            child: const Text(
              'Refresh',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
        }
        if (state is StepDetailLoaded) {
          return Scaffold(
              appBar: CommonAppBarWidget(text: state.stepEntities[0].subject!.title_kk, imageUrl: 'assets/images/icons/education.webp', routeLink: RouteConstant.stepsScreenName),
              backgroundColor: const Color(0xffc9ecff),
              body: SingleChildScrollView(
                reverse: true,
                child: ownStepper(context, state.stepEntities),
              ));
        }
        return Center(
            child: TextButton(
          onPressed: () async {
            context
                .read<StepDetailBloc>()
                .add(GetStepDetailEvent(widget.subjectID));
          },
          child: const Text(
            'Refresh',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
      },
    );
  }
}
