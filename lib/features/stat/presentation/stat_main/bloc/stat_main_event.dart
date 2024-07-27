part of 'stat_main_bloc.dart';

abstract class StatMainEvent {}

class StatMainUserStatEvent extends StatMainEvent {}

class StatMainGetUNTStatEvent extends StatMainEvent {}

class StatMainAllAttemptsEvent extends StatMainEvent {
  final AllAttemptsParameter parameter;
  StatMainAllAttemptsEvent({required this.parameter});
}

class StatMainPaginateStatEvent extends StatMainEvent {}
