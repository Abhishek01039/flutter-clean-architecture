import 'package:memri_example/src/model/post.dart';

abstract class PostDetailRepository {
  // Get posts by Id
  Future<Post> getPostsById(String id);
}
