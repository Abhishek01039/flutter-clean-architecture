part of 'post_detail_bloc.dart';

abstract class PostdetailEvent extends Equatable {
  const PostdetailEvent();

  @override
  List<Object> get props => [];
}

class PostDetailFetch extends PostdetailEvent {
  const PostDetailFetch(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class PostReadRequested extends PostdetailEvent {
  const PostReadRequested(this.post);

  final Post post;

  @override
  List<Object> get props => [post];
}
