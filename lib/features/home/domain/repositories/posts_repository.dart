import 'package:clean_arch_example/core/errors/failure.dart';
import 'package:clean_arch_example/features/home/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, PostEntity>> getPost({required int postId});
  Future<Either<Failure, void>> createPost({required PostEntity newPost});
  Future<Either<Failure, void>> updatePost({required PostEntity updatedPost});
  Future<Either<Failure, void>> deletePost({required int deletedPostId});
}
