import 'dart:convert';

import 'package:memri_example/src/config/endpoint_config.dart';
import 'package:memri_example/src/model/post.dart';

import 'home_repository.dart';
import 'package:http/http.dart' as http;

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<List<Post>> getPosts() async {
    try {
      var url = Uri.parse(EndpoingConfig.postEndpoint);
      var response = await http.get(
        url,
        headers: {
          'app-id': '60a373f57c13e7f5a901a999',
        },
      );
      if (response.statusCode == 200) {
        List<Post> posts = jsonDecode(response.body)['data']
            .map<Post>((e) => Post.fromJson(e))
            .toList();
        return posts;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
