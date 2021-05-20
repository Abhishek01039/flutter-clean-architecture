part of 'post_detail_bloc.dart';

abstract class PostdetailState extends Equatable {
  const PostdetailState();

  @override
  List<Object> get props => [];
}

class PostdetailInitial extends PostdetailState {}

class PostDetailLoading extends PostdetailState {}

class PostDetailFetchedSuccess extends PostdetailState {
  const PostDetailFetchedSuccess({required this.post});

  final Post post;

  @override
  List<Object> get props => [post];
}

class PostDetailFetchedError extends PostdetailState {
  const PostDetailFetchedError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class PostRead extends PostdetailState {
  const PostRead(this.post);

  final Post post;

  @override
  List<Object> get props => [post];
}
