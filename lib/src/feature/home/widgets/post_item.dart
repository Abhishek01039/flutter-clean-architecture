import 'package:flutter/material.dart';
import 'package:memri_example/src/model/post.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  SizedBox _buildSizedBox() {
    return const SizedBox(
      height: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          post.text ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      _buildSizedBox(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite_border),
                          SizedBox(
                            width: 4,
                          ),
                          Text(post.likes.toString()),
                          Spacer(),
                          Text(timeago
                              .format(DateTime.parse(post.publishDate ?? ''))),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FadeInImage(
                    placeholder: AssetImage('asset/flutter_logo.png'),
                    image: NetworkImage(
                      post.image ?? '',
                    ),
                    width: 80,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
