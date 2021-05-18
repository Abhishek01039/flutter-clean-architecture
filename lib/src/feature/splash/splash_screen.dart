import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        backgroundColor: Colors.red,
        body: Center(
          child: Column(
            children: [
              FlutterLogo(
                size: 150,
              ),
              Text('Memri'),
            ],
          ),
        ),
      ),
    );
  }
}
