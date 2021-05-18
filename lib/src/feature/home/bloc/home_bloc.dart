import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memri_example/src/feature/home/repository/home_repository.dart';
import 'package:memri_example/src/model/post.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(HomeInitial()) {
    add(PostFetch());
  }

  final HomeRepository _homeRepository;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is PostFetch) {
      yield PostLoading();
      try {
        yield PostFetchedSuccess(posts: await _homeRepository.getPosts());
      } catch (e) {
        yield PostFetchedError(errorMessage: e.toString());
      }
    }
  }
}
