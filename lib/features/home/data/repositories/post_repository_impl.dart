// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch_example/core/errors/exceptions.dart';
import 'package:clean_arch_example/features/home/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_arch_example/core/errors/failure.dart';
import 'package:clean_arch_example/core/network/network_info.dart';
import 'package:clean_arch_example/features/home/data/datasources/post_local_datasource.dart';
import 'package:clean_arch_example/features/home/data/datasources/post_remote_datasource.dart';
import 'package:clean_arch_example/features/home/domain/entities/post_entity.dart';
import 'package:clean_arch_example/features/home/domain/repositories/posts_repository.dart';

class PostRepositoryImpl extends PostsRepository {
  final NetworkInfo networkInfo;
  final PostRemoteDatasource remoteDatasource;
  PostLocalDatasource postLocalDatasource;

  PostRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatasource,
    required this.postLocalDatasource,
  });

  @override
  Future<Either<Failure, void>> createPost({required PostEntity newPost}) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deletePost({required int deletedPostId}) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PostEntity>> getPost({required int postId}) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      if (await networkInfo.isConnected) {
        List<PostModel> posts = await remoteDatasource.getPosts();
        postLocalDatasource.savePosts(posts: posts);
        return Right(posts);
      } else {
        try {
          List<PostModel> cachedPosts = await postLocalDatasource
              .getCachedPosts();
          return Right(cachedPosts);
        } catch (e) {
          if (e is CacheException) {
            return Left(CacheFailure());
          } else {
            return Left(OfflineFailure());
          }
        }
      }
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePost({required PostEntity updatedPost}) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
