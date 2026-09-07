// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch_example/core/errors/failure.dart';
import 'package:clean_arch_example/core/network/network_info.dart';
import 'package:clean_arch_example/features/home/data/datasources/post_remote_datasource.dart';
import 'package:clean_arch_example/features/home/domain/entities/post_entity.dart';
import 'package:clean_arch_example/features/home/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl extends PostsRepository {
  final NetworkInfo networkInfo;
  final PostRemoteDatasource remoteDatasource;

  PostRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatasource,
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
        return Right(await remoteDatasource.getPosts());
      } else {
        return Left(OfflineFailure());
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
