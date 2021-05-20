import 'package:flutter/material.dart';
import 'package:memri_example/src/config/color_config.dart';
import 'package:memri_example/src/feature/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styleguide.pageColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            const FlutterLogo(
              size: 100,
            ),
            Text(
              'badee3',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
            ),

            // Login/signup forms and social auth buttons
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
