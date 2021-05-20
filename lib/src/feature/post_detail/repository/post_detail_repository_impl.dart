import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:memri_example/src/config/api_config.dart';
import 'package:memri_example/src/model/post.dart';

import 'post_detail_repository.dart';

class PostDetailRepositoryImpl implements PostDetailRepository {
  @override
  Future<Post> getPostsById(String id) async {
    try {
      final Uri url = Uri.parse('${EndpoingConfig.postEndpoint}${'/$id'}');
      final response = await http.get(
        url,
        headers: {
          'app-id': APIKey.apiKey,
        },
      );
      if (response.statusCode == 200) {
        final Post posts =
            Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

        return posts;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
