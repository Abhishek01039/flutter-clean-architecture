import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memri_example/src/config/color_config.dart';
import 'package:memri_example/src/feature/login/repository/authentication_repository_impl.dart';
import 'package:memri_example/src/feature/login/widgets/login_form.dart';
import 'package:memri_example/src/feature/widgets/snackbar_widget.dart';
import 'package:memri_example/src/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginBloc(authenticationRepository: AuthenticationRepositoryImpl()),
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (LoginState prev, LoginState curr) => prev != curr,
        listener: (context, state) {
          if (state is LoginErrorState) {
            showSnackbar(
              context: context,
              text: state.errorMessage.contains(':')
                  ? (state.errorMessage.split(':')[1]).toString().trim()
                  : state.errorMessage,
            );
          }
          if (state is LoginSuccessState) {
            if (state.email != null) {
              context.router.replace(const HomePage());

              showSnackbar(
                context: context,
                text: 'Login successful!',
              );
            }
          }
        },
        child: Scaffold(
          backgroundColor: Styleguide.pageColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Memri',
                style: Theme.of(context).textTheme.headline2,
              ),

              // Login/signup forms and social auth buttons
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
