part of 'get_posts_bloc.dart';

@immutable
sealed class GetPostsState {}

final class GetPostsInitial extends GetPostsState {}

final class GetPostsLoading extends GetPostsState {}

final class GetPostsSuccess extends GetPostsState {
  final List<PostEntity> posts;

  GetPostsSuccess({required this.posts});
}

final class GetPostsFailure extends GetPostsState {
  final String failureMessage;

  GetPostsFailure({required this.failureMessage});
}
