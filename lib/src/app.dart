import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memri_example/src/feature/splash/bloc/splash_bloc.dart';

import 'config/theme_config.dart';
import 'feature/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc()..add(SplashInitialEvent()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeConfig.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
