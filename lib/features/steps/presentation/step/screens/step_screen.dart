import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';
import 'package:transformable_list_view/transformable_list_view.dart';
import '../../../../../core/app_constants/route_constant.dart';
import '../bloc/step_bloc.dart' as Step;
import '../widgets/step_widgets.dart';

class StepScreen extends StatefulWidget {
  const StepScreen({super.key});

  @override
  State<StepScreen> createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Step.StepBloc>().add(const Step.StepInEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(text: 'Обучение', imageUrl: 'assets/images/icons/education.webp', routeLink: RouteConstant.dashboardScreenName),
      body: BlocConsumer<Step.StepBloc, Step.StepState>(
        builder: (context, state) {
          if (state is Step.StepLoadingState) {
            return const Center(child:  GFLoader(
                type:GFLoaderType.ios
            ),);
          }
          if (state is Step.StepErrorState) {
            return Center(
                child: TextButton(
                  onPressed: () async {
                    context.read<Step.StepBloc>().add(const Step.StepInEvent());
                  },
                  child: const Text('Refresh', style: TextStyle(fontWeight: FontWeight.bold),),
                )
            );
          }
          if (state is Step.StepInState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<Step.StepBloc>().add(const Step.StepInEvent());
              },
              child: CustomScrollView(
                slivers: [
                  TransformableSliverList.builder(
                    itemCount: (state).stepEntities.length,
                    getTransformMatrix: TransformMatrices.rotate,
                    itemBuilder: (context, index) {
                      final stepId = (state).stepEntities[index].id;
                      return GestureDetector(
                          onTap: () => context.goNamed(RouteConstant.stepDetailScreenName, pathParameters: {'subjectID': stepId.toString()}),
                          child: courseGrid((state).stepEntities[index], context)
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return Center(
              child: TextButton(
                onPressed: () async {
                  context.read<Step.StepBloc>().add(const Step.StepInEvent());
                },
                child: const Text('Refresh', style: TextStyle(fontWeight: FontWeight.bold),),
              )
          );
        }, listener: (context, state) {
          if (state is Step.StepErrorState) {
              context.read<Step.StepBloc>().add(const Step.StepInEvent());
            }
        },
      ),
    );
  }
}
