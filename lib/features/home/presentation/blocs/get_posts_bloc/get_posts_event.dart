part of 'get_posts_bloc.dart';

@immutable
sealed class GetPostsEvent {}

class GetAllPosts extends GetPostsEvent {}
