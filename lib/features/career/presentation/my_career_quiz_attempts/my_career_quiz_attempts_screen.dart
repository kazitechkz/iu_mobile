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
  State<MyCareerQuizAttemptsScreen> createState() => _MyCareerQuizAttemptsScreenState();
}

class _MyCareerQuizAttemptsScreenState extends State<MyCareerQuizAttemptsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MyCareerQuizAttemptsBloc>().add(MyCareerQuizAttemptsByQuizIdEvent(new MyCareerAttemptsParameter(page: 1)));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Карьера",
        imageUrl: "assets/images/icons/career.webp",
        routeLink: RouteConstant.careerQuizzesListName,
      ),
      body: BlocConsumer<MyCareerQuizAttemptsBloc,MyCareerQuizAttemptsState>(
        listener: (BuildContext context, MyCareerQuizAttemptsState state) {  },
        builder: (BuildContext context, MyCareerQuizAttemptsState state) {
          if(state is MyCareerQuizAttemptsLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is MyCareerQuizAttemptsSuccessState){
            return SingleChildScrollView(
              child: Column(
                children: state.careerQuizzes.map(
                        (careerQuiz) => CareerQuizAttemptCardWidget(careerQuizAttempt: careerQuiz,)
                ).toList(),
              ),
            );
          }
          return SizedBox();


        },
      ),
    );
  }
}
