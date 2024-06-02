part of 'forum_detail_bloc.dart';

@immutable
sealed class ForumDetailState extends Equatable {}

final class ForumDetailInitialState extends ForumDetailState {
  @override
  List<Object?> get props => [];
}

final class ForumDetailLoadingState extends ForumDetailState {
  @override
  List<Object?> get props => [];
}

final class ForumDetailFailedState extends ForumDetailState {
  final FailureData failureData;
  ForumDetailFailedState(this.failureData);
  @override
  List<Object?> get props => [failureData];
}

final class ForumDetailSuccessState extends ForumDetailState {
  final GetForumEntity forumEntity;
  final GetForumDiscussEntity discussEntity;
  final List<DiscussEntity> discusses;
  ForumDetailSuccessState(
      {required this.forumEntity,
      required this.discussEntity,
      required this.discusses});

  ForumDetailSuccessState copyWith(
      {GetForumEntity? ForumEntity,
      GetForumDiscussEntity? DiscussEntity,
      List<DiscussEntity>? Discusses}) {
    return ForumDetailSuccessState(
      forumEntity: ForumEntity ?? forumEntity,
      discussEntity: DiscussEntity ?? discussEntity,
      discusses: Discusses ?? discusses,
    );
  }

  @override
  List<Object?> get props => [forumEntity, discussEntity, discusses];
}
