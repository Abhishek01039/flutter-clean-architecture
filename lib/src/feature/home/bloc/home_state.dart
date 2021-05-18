part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class PostLoading extends HomeState {}

class PostFetchedSuccess extends HomeState {
  const PostFetchedSuccess({required this.posts});

  final List<Post> posts;

  @override
  List<Object> get props => [posts];
}

class PostFetchedError extends HomeState {
  const PostFetchedError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
