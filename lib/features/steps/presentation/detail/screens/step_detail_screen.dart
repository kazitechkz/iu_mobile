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

class StepDetailScreen extends StatefulWidget {
  final String stepID;
  const StepDetailScreen({super.key, required this.stepID});

  @override
  State<StepDetailScreen> createState() => _StepDetailScreenState();

}

class _StepDetailScreenState extends State<StepDetailScreen> {

  @override
  void initState() {
    super.initState();
    context.read<StepDetailBloc>().add(GetStepDetailEvent(widget.stepID));
  }

  @override
  void didUpdateWidget(covariant StepDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.stepID != oldWidget.stepID) {
      context.read<StepDetailBloc>().add(GetStepDetailEvent(widget.stepID));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        leading:  GFIconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            GoRouter.of(context).goNamed(RouteConstant.stepsScreenName);
          },
          type: GFButtonType.transparent,
        ),
        title: const Text("Learning"),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffc9ecff),
      body: BlocConsumer<StepDetailBloc, StepDetailState>(
        builder: (context, state) {
          if (state is StepDetailLoading) {
            return const Center(child:  GFLoader(
                type:GFLoaderType.ios
            ),);
          }
          if (state is StepDetailErrorState) {
            return Center(
                child: TextButton(
                  onPressed: () async {
                    context.read<StepDetailBloc>().add(GetStepDetailEvent(widget.stepID));
                  },
                  child: const Text('Refresh', style: TextStyle(fontWeight: FontWeight.bold),),
                )
            );
          }
          if (state is StepDetailLoaded) {
            return SingleChildScrollView(
              reverse: true,
              child: ownStepper(context, state.stepEntities),
            );
          }
          return Center(
              child: TextButton(
                onPressed: () async {
                  context.read<StepDetailBloc>().add(GetStepDetailEvent(widget.stepID));
                },
                child: const Text('Refresh', style: TextStyle(fontWeight: FontWeight.bold),),
              )
          );
        },
        listener: (BuildContext context, StepDetailState state) {
          if (state is StepDetailErrorState) {
            context.read<StepDetailBloc>().add(GetStepDetailEvent(widget.stepID));
          }
        },
      )
    );
  }
}
