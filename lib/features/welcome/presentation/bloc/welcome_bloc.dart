import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial(0)) {
    on<WelcomePageChangeEvent>((event, emit) {
      emit(WelcomeInitial(event.index));
    });
  }
}
