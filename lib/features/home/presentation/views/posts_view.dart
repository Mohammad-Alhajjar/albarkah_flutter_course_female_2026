import 'package:clean_arch_example/core/network/network_info.dart';
import 'package:clean_arch_example/features/home/data/datasources/post_remote_datasource.dart';
import 'package:clean_arch_example/features/home/data/repositories/post_repository_impl.dart';
import 'package:clean_arch_example/features/home/domain/entities/post_entity.dart';
import 'package:clean_arch_example/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:clean_arch_example/features/home/presentation/blocs/get_posts_bloc/get_posts_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPostsBloc(
        getPostsUsecase: GetPostsUsecase(
          postsRepository: PostRepositoryImpl(
            networkInfo: NetworkInfoImplWithInternetConnectionChecker(
              internetConnectionChecker: InternetConnectionChecker.instance,
            ),
            remoteDatasource: PostRemoteDatasourceImplWithDio(dio: Dio()),
          ),
        ),
      )..add(GetAllPosts()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: BlocBuilder<GetPostsBloc, GetPostsState>(
                builder: (context, state) {
                  if (state is GetPostsLoading) {
                    return CircularProgressIndicator();
                  } else if (state is GetPostsFailure) {
                    return Text(state.failureMessage);
                  } else if (state is GetPostsSuccess) {
                    List<PostEntity> posts = state.posts;
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        PostEntity post = state.posts[index];
                        return Card(
                          child: ListTile(
                            title: Text(post.title!),
                            subtitle: Text(post.body!),
                            leading: CircleAvatar(
                              child: Text(post.id!.toString()),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
