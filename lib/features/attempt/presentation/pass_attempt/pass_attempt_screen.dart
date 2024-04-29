import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_state.dart';
import 'package:iu/features/unt/presentation/unt_full/bloc/unt_full_bloc.dart';

import '../../../../core/utils/toasters.dart';
import 'bloc/pass_attempt_bloc.dart';
import 'bloc/pass_attempt_event.dart';

class PassUntScreen extends StatefulWidget {
  final int attemptId;

  const PassUntScreen({super.key, required this.attemptId});

  @override
  State<PassUntScreen> createState() => _PassUntScreenState();
}

class _PassUntScreenState extends State<PassUntScreen> {
  void initState() {
    super.initState();
    print(widget.attemptId);
    context
        .read<PassAttemptBloc>()
        .add(PassAttemptGetByAttemptIdEvent(widget.attemptId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PassAttemptBloc, PassAttemptState>(
      listener: (context, state) {
        if (state is PassAttemptSuccessState) {
          print(state.attempt);
        }
      },
      builder: (context, state) {
        if (state is PassAttemptFailedState) {
          AppToaster.showError(state.failureData.message ?? "Error");
        }
        if (state is PassAttemptSuccessState) {
          return Center(
            child: Text(state.attempt.timeLeft.toString()),
          );
        }

        return Center(
          child: Text("Hello!"),
        );
      },
    ));
  }
}
