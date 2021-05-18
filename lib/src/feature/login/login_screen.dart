import 'package:flutter/material.dart';
import 'package:memri_example/src/config/color_config.dart';
import 'package:memri_example/src/feature/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styleguide.pageColor,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const Text(
                'Memri',
                style: TextStyle(
                  letterSpacing: 1.7,
                  fontSize: 30,
                ),
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
