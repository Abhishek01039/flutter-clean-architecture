import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memri_example/src/feature/login/bloc/login_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:memri_example/src/feature/widgets/snackbar_widget.dart';
import 'package:memri_example/src/router/router.gr.dart';
import 'package:memri_example/src/utils/message_text.dart';

class HomeLogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          showSnackbar(context: context, text: Message.logoutSuccess);
          context.router
              .pushAndPopUntil(const LoginPage(), predicate: (route) => false);
        }
      },
      child: IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: () {
          context.read<LoginBloc>().add(LogoutRequested());
        },
      ),
    );
  }
}
