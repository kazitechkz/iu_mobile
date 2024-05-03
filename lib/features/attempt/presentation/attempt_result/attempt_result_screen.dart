import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/features/attempt/presentation/attempt_result/bloc/attempt_result_bloc.dart';

class AttemptResultScreen extends StatefulWidget {
  final int attemptId;
  const AttemptResultScreen({super.key,required this.attemptId});

  @override
  State<AttemptResultScreen> createState() => _AttemptResultScreenState();
}

class _AttemptResultScreenState extends State<AttemptResultScreen> {
  void initState() {
    super.initState();
    context
        .read<AttemptResultBloc>()
        .add(AttemptResultByAttemptIdEvent(widget.attemptId));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AttemptResultBloc,AttemptResultState>(
        listener: (context, state){

        },
        builder: (context,state) {
          if(state is AttemptResultLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is AttemptResultSuccessState){
            return SingleChildScrollView(
              child: Column(
                children: [

                ],
              ),
            );
          }
          return SizedBox();
        },

      ),
    );
  }
}
