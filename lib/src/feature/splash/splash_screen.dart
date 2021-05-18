import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memri_example/src/config/color_config.dart';
import 'package:memri_example/src/feature/splash/bloc/splash_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:memri_example/src/router/router.gr.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (prev, curr) => prev != curr,
      listener: (context, state) {
        Future.delayed(Duration(seconds: 2), () {});
        if (state is UserAuthenticated) {
          context.router.replace(HomePage());
        } else if (state is UserNotAuthenticated) {
          context.router.replace(LoginPage());
        }
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
