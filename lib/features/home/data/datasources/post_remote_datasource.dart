// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch_example/core/resources/app_url.dart';
import 'package:clean_arch_example/features/home/data/models/post_model.dart';
import 'package:dio/dio.dart';

abstract class PostRemoteDatasource {
  Future<List<PostModel>> getPosts();
  Future<PostModel> getPost({required int postId});
  Future<bool> createPost({required PostModel newPost});
  Future<bool> updatePost({required PostModel updatedPost});
  Future<bool> deletePost({required int deletedPostId});
}

class PostRemoteDatasourceImplWithDio extends PostRemoteDatasource {
  Dio dio;
  PostRemoteDatasourceImplWithDio({required this.dio});

  @override
  Future<bool> createPost({required PostModel newPost}) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePost({required int deletedPostId}) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getPost({required int postId}) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      Response response = await dio.get(AppUrl.posts);
      if (response.statusCode == 200) {
        return List.generate(
          response.data.length,
          (index) => PostModel.fromMap(response.data[index]),
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<bool> updatePost({required PostModel updatedPost}) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
