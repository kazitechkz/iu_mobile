part of 'forum_detail_bloc.dart';

@immutable
sealed class ForumDetailEvent {}

class ForumDetailGetByIdEvent extends ForumDetailEvent {
  final int forumId;
  ForumDetailGetByIdEvent({required this.forumId});
}

class ForumDetailGetDiscussesEvent extends ForumDetailEvent {
  final GetForumDiscussParameter parameter;
  ForumDetailGetDiscussesEvent({required this.parameter});
}
