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
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostFetchedSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    forceElevated: true,
                    elevation: 6,
                    backgroundColor: Styleguide.colorAccentsOrange_1,
                    title: Text(
                      'Posts',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
            return Center(
              child: Text('Retry'),
            );
          },
        ),
      ),
    );
  }
}
