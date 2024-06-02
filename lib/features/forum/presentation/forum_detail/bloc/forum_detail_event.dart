part of 'forum_detail_bloc.dart';

@immutable
sealed class ForumDetailEvent {}

class ForumDetailGetByIdEvent extends ForumDetailEvent {
  final int forumId;
  ForumDetailGetByIdEvent(this.forumId);
}

class ForumDetailGetDiscusses extends ForumDetailEvent {
  final GetForumDiscussParameter parameter;
  ForumDetailGetDiscusses(this.parameter);
}
