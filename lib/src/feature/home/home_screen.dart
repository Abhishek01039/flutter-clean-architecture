import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memri_example/src/config/color_config.dart';
import 'package:memri_example/src/feature/home/bloc/home_bloc.dart';
import 'package:memri_example/src/feature/home/repository/home_repository_impl.dart';

import 'widgets/post_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(homeRepository: HomeRepositoryImpl()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostFetchedSuccess) {
              return CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    forceElevated: true,
                    elevation: 6,
                    backgroundColor: Styleguide.colorAccentsOrange_1,
                    title: Text(
                      'Posts',
                    ),
                  ),
                  SliverToBoxAdapter(
                    // Render lists lazily if we use ListView.builder().
                    // ListView.builder() constructor creates items as they’re scrolled onto the screen.
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PostItem(
                          post: state.posts[index],
                        );
                      },
                      itemCount: state.posts.length,
                    ),
                  )
                ],
              );
            }
            // If some error occur this portion will be rendered. So we press the button
            // then it's call the API again.
            return TextButton(
              onPressed: () {
                context.read<HomeBloc>().add(PostFetch());
              },
              child: const Text('Retry'),
            );
          },
        ),
      ),
    );
  }
}
