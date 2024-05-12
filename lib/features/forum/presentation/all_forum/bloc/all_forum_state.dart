part of 'all_forum_bloc.dart';

@immutable
sealed class AllForumState extends Equatable {}

final class AllForumInitialState extends AllForumState {
  @override
  List<Object?> get props => [];
}

final class AllForumLoadingState extends AllForumState {
  @override
  List<Object?> get props => [];
}

final class AllForumFailedState extends AllForumState {
  final FailureData failureData;

  AllForumFailedState(this.failureData);

  @override
  List<Object?> get props => [failureData];
}

final class AllForumSuccessState extends AllForumState {
  final PaginationData<List<ForumEntity>> forumData;
  final List<ForumEntity> forums;

  AllForumSuccessState({required this.forumData, required this.forums});

  AllForumSuccessState copyWith(
      {PaginationData<List<ForumEntity>>? ForumData,
      List<ForumEntity>? Forums}) {
    return AllForumSuccessState(
        forumData: ForumData ?? forumData, forums: Forums ?? forums);
  }

  @override
  List<Object?> get props => [forumData, forums];
}
