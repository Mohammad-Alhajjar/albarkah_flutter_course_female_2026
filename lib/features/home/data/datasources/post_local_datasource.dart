import 'package:clean_arch_example/core/errors/exceptions.dart';
import 'package:clean_arch_example/features/home/data/models/post_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PostLocalDatasource {
  Future<List<PostModel>> getCachedPosts();
  Future<void> savePosts({required List<PostModel> posts});
}

class PostLocalDatasourseImpl implements PostLocalDatasource {
  final Box<PostModel> postsBox;

  PostLocalDatasourseImpl({required this.postsBox});
  @override
  Future<List<PostModel>> getCachedPosts() async {
        print("==========================Local Datasource");
    List<PostModel> posts = postsBox.values.toList();
    if (posts.isNotEmpty) {
      return posts;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> savePosts({required List<PostModel> posts}) async {
    await postsBox.clear();
    await postsBox.addAll(posts);
  }
}
