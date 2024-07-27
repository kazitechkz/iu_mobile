import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/features/career/presentation/my_career_quiz_attempts/widgets/career_quiz_attempt_card_widget.dart';

import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/parameters/my_career_attempts_parameter.dart';
import 'bloc/my_career_quiz_attempts_bloc.dart';

class MyCareerQuizAttemptsScreen extends StatefulWidget {
  const MyCareerQuizAttemptsScreen({super.key});

  @override
  State<MyCareerQuizAttemptsScreen> createState() =>
      _MyCareerQuizAttemptsScreenState();
}

class _MyCareerQuizAttemptsScreenState
    extends State<MyCareerQuizAttemptsScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MyCareerQuizAttemptsBloc>().add(
        MyCareerQuizAttemptsByQuizIdEvent(
            new MyCareerAttemptsParameter(page: 1)));
    _scrollController.addListener(_endScrollBar);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.removeListener(() {});
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Карьера",
        imageUrl: "assets/images/icons/career.webp",
        routeLink: RouteConstant.careerQuizzesListName,
      ),
      body: BlocConsumer<MyCareerQuizAttemptsBloc, MyCareerQuizAttemptsState>(
        listener: (BuildContext context, MyCareerQuizAttemptsState state) {},
        builder: (BuildContext context, MyCareerQuizAttemptsState state) {
          if (state is MyCareerQuizAttemptsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MyCareerQuizAttemptsSuccessState) {
            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(children: [
                ...state.careerQuizzes
                    .map((careerQuiz) => CareerQuizAttemptCardWidget(
                          careerQuizAttempt: careerQuiz,
                        ))
                    .toList(),
                (state.isLoadingPagination
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox())
              ]),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  void _endScrollBar() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      context
          .read<MyCareerQuizAttemptsBloc>()
          .add(MyCareerQuizAttemptsPaginateEvent());
    }
  }
}
