// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch_example/core/errors/failure.dart';
import 'package:clean_arch_example/features/home/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/post_entity.dart';

class GetPostsUsecase {
  PostsRepository postsRepository;
  GetPostsUsecase({required this.postsRepository});

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postsRepository.getPosts();
  }
}
