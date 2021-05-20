import 'package:flutter/material.dart';
import 'package:memri_example/src/model/post.dart';

class PostDetailAuthorTile extends StatelessWidget {
  const PostDetailAuthorTile({Key? key, required this.owner}) : super(key: key);

  final Owner? owner;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(35.0),
        child: FadeInImage(
          placeholder: const AssetImage('asset/flutter_logo.png'),
          image: NetworkImage(
            owner!.picture ?? '',
          ),
          width: 60,
          height: 60,
          fit: BoxFit.fill,
        ),
      ),
      title: Text('${owner!.title!}. ${owner!.firstName!} ${owner!.lastName!}'),
      subtitle: Text(owner!.email!),
    );
  }
}
