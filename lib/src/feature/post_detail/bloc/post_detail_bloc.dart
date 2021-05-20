import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memri_example/src/feature/post_detail/repository/post_detail_repository_impl.dart';
import 'package:memri_example/src/model/post.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostdetailBloc extends Bloc<PostdetailEvent, PostdetailState> {
  PostdetailBloc({required PostDetailRepositoryImpl postDetailRepositoryImpl})
      : _postDetailRepositoryImpl = postDetailRepositoryImpl,
        super(PostdetailInitial());

  final PostDetailRepositoryImpl _postDetailRepositoryImpl;

  @override
  Stream<PostdetailState> mapEventToState(
    PostdetailEvent event,
  ) async* {
    if (event is PostDetailFetch) {
      yield PostDetailLoading();
      try {
        yield PostDetailFetchedSuccess(
            post: await _postDetailRepositoryImpl.getPostsById(event.id));
      } catch (e) {
        yield PostDetailFetchedError(errorMessage: e.toString());
      }
    } else if (event is PostReadRequested) {
      yield PostRead(event.post);
    }
  }
}
