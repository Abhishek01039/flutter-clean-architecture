import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memri_example/src/config/color_config.dart';
import 'package:memri_example/src/feature/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (prev, curr) => prev != curr,
      listener: (context, state) {
        if (state is UserAuthenticated) {
        } else if (state is UserNotAuthenticated) {}
      },
      child: Scaffold(
        backgroundColor: Styleguide.colorAccentsOrange_1,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 150,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Memri',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
