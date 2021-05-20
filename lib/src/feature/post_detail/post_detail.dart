import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memri_example/src/config/color_config.dart';
import 'package:memri_example/src/feature/post_detail/bloc/post_detail_bloc.dart';
import 'package:memri_example/src/feature/post_detail/repository/post_detail_repository_impl.dart';
import 'package:memri_example/src/model/post.dart';

import 'widgets/post_detail_item.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({@PathParam('storeName') required this.id});

  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostdetailBloc>(
      create: (context) =>
          PostdetailBloc(postDetailRepositoryImpl: PostDetailRepositoryImpl())
            ..add(PostDetailFetch(id)),
      child: BlocBuilder<PostdetailBloc, PostdetailState>(
        builder: (context, state) {
          if (state is PostDetailLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is PostDetailFetchedSuccess) {
            return _PostDetailPage(
              post: state.post,
            );
          } else if (state is PostRead) {
            return _PostDetailPage(
              post: state.post,
              scaffoldColor: Styleguide.colorAccentsBlue_3,
            );
          }
          // If some error occur this portion will be rendered. So we press the button
          // then it's call the API again.
          return Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () {
                  context.read<PostdetailBloc>().add(PostDetailFetch(id));
                },
                child: const Text('Retry'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PostDetailPage extends StatelessWidget {
  const _PostDetailPage({Key? key, required this.post, this.scaffoldColor})
      : super(key: key);

  final Post post;
  final Color? scaffoldColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor ?? Styleguide.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage(
                placeholder: const AssetImage('asset/flutter_logo.png'),
                image: NetworkImage(
                  post.image ?? '',
                ),
                fit: BoxFit.fill,
              ),
              PostDetailItem(
                post: post,
              ),
            ],
          ),
        ),
      ),
      // FloatingActionButton for mark this post as read.
      // It's clickable one time only!
      floatingActionButton: FloatingActionButton(
        backgroundColor: scaffoldColor != null
            ? Styleguide.colorGray_3
            : Styleguide.colorAccentsOrange_1,
        onPressed: scaffoldColor != null
            ? null
            : () {
                context.read<PostdetailBloc>().add(PostReadRequested(post));
              },
        child: const Icon(
          Icons.mark_email_read,
        ),
      ),
    );
  }
}
