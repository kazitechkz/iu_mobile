part of 'welcome_bloc.dart';

abstract class WelcomeState {
  int index = 0;
  WelcomeState({required this.index});
}

class WelcomeInitial extends WelcomeState {
    WelcomeInitial(int index):super(index:index);
}
