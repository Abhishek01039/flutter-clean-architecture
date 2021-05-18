import 'package:memri_example/src/model/post.dart';

abstract class HomeRepository {
  // Get all posts
  Future<List<Post>> getPosts();
}
