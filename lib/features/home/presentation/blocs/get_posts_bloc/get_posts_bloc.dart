// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:clean_arch_example/features/home/domain/entities/post_entity.dart';
import 'package:clean_arch_example/features/home/domain/usecases/get_posts_usecase.dart';

import '../../../../../core/errors/failure.dart';

part 'get_posts_event.dart';
part 'get_posts_state.dart';

class GetPostsBloc extends Bloc<GetPostsEvent, GetPostsState> {
  final GetPostsUsecase getPostsUsecase;
  GetPostsBloc({required this.getPostsUsecase}) : super(GetPostsInitial()) {
    on<GetAllPosts>((event, emit) async {
      emit(GetPostsLoading());

      Either<Failure, List<PostEntity>> result = await getPostsUsecase.call();

      result.fold(
        (failure) {
          emit(GetPostsFailure(failureMessage: failure.message));
        },
        (posts) {
          emit(GetPostsSuccess(posts: posts));
        },
      );
    });
  }
}
