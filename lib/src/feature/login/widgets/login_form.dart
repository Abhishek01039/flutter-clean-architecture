import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memri_example/src/feature/login/bloc/login_bloc.dart';
import 'package:memri_example/src/feature/widgets/button.dart';
import 'package:memri_example/src/feature/widgets/circular_indicator.dart';
import 'package:memri_example/src/feature/widgets/snackbar_widget.dart';
import 'package:memri_example/src/router/router.gr.dart';
import 'package:memri_example/src/utils/message_text.dart';
import 'package:memri_example/src/utils/validators/email_validator.dart';

import 'login_auth_text_form_field.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isAutoValidate = false;

  /// clear all [TextFormField]
  void _disposeController() {
    password.clear();
    email.clear();
  }

  /// reset the state of [LoginForm]
  void _resetState() {
    _disposeController();
    isAutoValidate = false;
    print(isAutoValidate);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (LoginState prev, LoginState current) => prev != current,
      listener: (context, state) {
        if (state is LoginErrorState) {
          showSnackbar(
            context: context,
            text: state.errorMessage.contains(':')
                ? state.errorMessage.split(':')[1].toString().trim()
                : state.errorMessage,
          );
        }
        if (state is LoginSuccessState) {
          if (state.email != null) {
            _resetState();
            showSnackbar(
              context: context,
              text: 'Login successful!',
            );

            context.router.replace(const HomePage());
          } else {
            showSnackbar(
              context: context,
              text: Message.genericLoginErrorMessage,
            );
          }
        }
      },
      buildWhen: (LoginState prev, LoginState curr) => prev != curr,
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: isAutoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomAuthTextFormField(
                  key: const Key('email_input'),
                  textEditingController: email,
                  textInputType: TextInputType.emailAddress,
                  labelText: 'Email',
                  validate: emailValidator,
                ),
                const SizedBox(
                  height: 8,
                ),
                if (state is LoginPassShowState)
                  CustomAuthTextFormField(
                    key: const Key('password_input'),
                    textEditingController: password,
                    labelText: 'Password',
                    suffixIcon: const Icon(Icons.visibility_off),
                    suffixIconPressed: () {
                      context.read<LoginBloc>().add(LoginPassHideRequested());
                    },
                    validate: (String? val) {
                      if (val!.isEmpty) {
                        return 'Please enter password';
                      } else if (val.length < 6) {
                        return 'Password must be 6 character';
                      }
                      return null;
                    },
                  )
                else
                  CustomAuthTextFormField(
                    key: const Key('password_input'),
                    textEditingController: password,
                    labelText: 'Password',
                    isObsecure: true,
                    suffixIcon: const Icon(Icons.visibility),
                    suffixIconPressed: () {
                      context.read<LoginBloc>().add(LoginPassShowRequested());
                    },
                    validate: (String? val) {
                      if (val!.isEmpty) {
                        return 'Please enter password';
                      } else if (val.length < 6) {
                        return 'Password must be 6 character';
                      }
                      return null;
                    },
                  ),
                Stack(
                  children: [
                    Button(
                      elevatedButtonKey: const Key('login'),
                      child: 'LOGIN',
                      function: (state is LoginLoadingState)
                          ? null
                          : () {
                              if (_formKey.currentState?.validate() == false) {
                                setState(() {
                                  isAutoValidate = true;
                                });
                              } else {
                                context.read<LoginBloc>().add(
                                      LoginRequest(
                                        email: email.text,
                                        password: password.text,
                                      ),
                                    );
                              }
                            },
                    ),
                    if (state is LoginLoadingState) customCircularIndicator(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
