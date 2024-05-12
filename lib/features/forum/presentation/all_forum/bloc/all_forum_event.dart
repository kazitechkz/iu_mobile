part of 'all_forum_bloc.dart';

@immutable
sealed class AllForumEvent {}

class AllForumWithParamsEvent extends AllForumEvent {
  final AllForumParameter parameter;
  AllForumWithParamsEvent(this.parameter);
}
