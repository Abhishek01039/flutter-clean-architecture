import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memri_example/src/feature/login/bloc/login_bloc.dart';
import 'package:memri_example/src/feature/login/repository/authentication_repository_impl.dart';

import 'config/theme_config.dart';
import 'router/router.gr.dart';

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(authenticationRepository: AuthenticationRepositoryImpl()),
      child: MaterialApp.router(
        theme: ThemeConfig.lightTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
