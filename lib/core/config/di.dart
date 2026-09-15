import 'package:clean_arch_example/features/home/data/datasources/post_local_datasource.dart';
import 'package:clean_arch_example/features/home/data/datasources/post_remote_datasource.dart';
import 'package:clean_arch_example/features/home/data/models/post_model.dart';
import 'package:clean_arch_example/features/home/data/repositories/post_repository_impl.dart';
import 'package:clean_arch_example/features/home/domain/repositories/posts_repository.dart';
import 'package:clean_arch_example/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:clean_arch_example/features/home/presentation/blocs/get_posts_bloc/get_posts_bloc.dart';
import 'package:clean_arch_example/main.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network/network_info.dart';

GetIt sl = GetIt.instance;

late Box<PostModel> postsBox;

Future<void> init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PostModelAdapter());
  postsBox = await Hive.openBox<PostModel>("CACHED_POSTS_BOX");
}

Future<void> setup() async {
  // GetPostsBloc
  sl.registerFactory<GetPostsBloc>(() => GetPostsBloc(getPostsUsecase: sl()));

  // GetPostUseCase
  sl.registerLazySingleton<GetPostsUsecase>(
    () => GetPostsUsecase(postsRepository: sl()),
  );

  // Post Repository
  sl.registerLazySingleton<PostsRepository>(
    () => PostRepositoryImpl(
      networkInfo: sl(),
      remoteDatasource: sl(),
      postLocalDatasource: sl(),
    ),
  );

  // Remote DataSource
  sl.registerLazySingleton<PostRemoteDatasource>(
    () => PostRemoteDatasourceImplWithDio(dio: sl()),
  );

  // Local DataSource
  sl.registerLazySingleton<PostLocalDatasource>(
    () => PostLocalDatasourseImpl(postsBox: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplWithInternetConnectionChecker(
      internetConnectionChecker: sl(),
    ),
  );

  // External and Core
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.instance,
  );
  sl.registerLazySingleton<Box<PostModel>>(() => postsBox);
}
