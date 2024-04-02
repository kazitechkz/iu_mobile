import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';
import '../../../../core/common/widgets/bottom_nav_bar.dart';
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
      body: BlocConsumer<Step.StepBloc, Step.StepState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is Step.StepInState) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: homePageText('Hello', color: Colors.grey)),
                  SliverToBoxAdapter(child: homePageText('TIMA', top: 5)),
                  SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                  // SliverToBoxAdapter(child: searchView()),
                  // SliverToBoxAdapter(child: menuView()),
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 1.6),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return GestureDetector(
                          child: courseGrid((state).stepEntities[index]),
                        );
                      },
                          childCount:
                              (state as Step.StepInState).stepEntities.length),
                    ),
                  )
                ],
              ),
            );
          }
          return Text("WOW");
        },
      ),
    );
  }
}
