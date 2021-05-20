import 'package:flutter/material.dart';
import 'package:memri_example/src/config/color_config.dart';
import 'package:memri_example/src/model/post.dart';
import 'package:memri_example/src/router/router.gr.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:auto_route/auto_route.dart';

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
        child: InkWell(
          onTap: () {
            context.router.push(PostDetailScreen(id: post.id!));
          },
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
                        // Shows the title. if title text are big then it's goes to next line.
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
                            const Icon(
                              Icons.favorite,
                              color: Styleguide.colorAccentsRed,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(post.likes.toString()),
                            const Spacer(),
                            Text(timeago.format(
                                DateTime.parse(post.publishDate ?? ''))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: FadeInImage(
                      placeholder: const AssetImage('asset/flutter_logo.png'),
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
      ),
    );
  }
}
