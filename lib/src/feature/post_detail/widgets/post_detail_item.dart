import 'package:flutter/material.dart';
import 'package:memri_example/src/config/color_config.dart';
import 'package:memri_example/src/model/post.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'post_detail_auther_tile.dart';
import 'post_detail_tags.dart';

class PostDetailItem extends StatelessWidget {
  const PostDetailItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    SizedBox _buildSizedBox({double height = 10}) {
      return SizedBox(
        height: height,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.text ?? '',
            style: Theme.of(context).textTheme.headline3,
          ),
          _buildSizedBox(),
          // Render `tags` if it is not null.
          if (post.tags?.isEmpty == true)
            Text(
              'Tags:',
              style: Theme.of(context).textTheme.headline5,
            ),
          if (post.tags?.isEmpty == true) _buildSizedBox(),
          if (post.tags?.isEmpty == true)
            PostDetailTags(
              tags: post.tags,
            ),
          if (post.tags?.isEmpty == true) _buildSizedBox(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.favorite,
                color: Styleguide.colorAccentsRed,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(post.likes.toString()),
              const Spacer(),
              Text(
                timeago.format(
                  DateTime.parse(
                    post.publishDate ?? '',
                  ),
                ),
              ),
            ],
          ),
          // Render `link` and `owner` if it is not null.
          _buildSizedBox(height: 20),
          if (post.link != null)
            GestureDetector(
              onTap: () async {
                if (await canLaunch(post.link!)) {
                  await launch(post.link!);
                }
              },
              child: Text(
                post.link ?? '',
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
          if (post.link != null) _buildSizedBox(height: 20),
          if (post.owner != null)
            Text(
              'Written By:',
              style: Theme.of(context).textTheme.headline5,
            ),
          if (post.owner != null) _buildSizedBox(),
          if (post.owner != null)
            PostDetailAuthorTile(
              owner: post.owner,
            ),
        ],
      ),
    );
  }
}
