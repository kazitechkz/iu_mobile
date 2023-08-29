part of 'welcome_bloc.dart';


abstract class WelcomeEvent {}

class WelcomePageChangeEvent extends WelcomeEvent{
  late int index;
  WelcomePageChangeEvent({required this.index});

}