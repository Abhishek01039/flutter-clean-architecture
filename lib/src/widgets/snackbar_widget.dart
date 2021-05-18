import 'package:flutter/material.dart';
import 'package:memri_example/src/config/color_config.dart';

enum SnackbarStatus {
  error,
  warning,
  info,
}

extension SnackbarColor on SnackbarStatus {
  Color get color {
    switch (this) {
      case SnackbarStatus.error:
        return Styleguide.colorRed_3;
      case SnackbarStatus.warning:
        return Styleguide.colorAccentsYellow_3;
      case SnackbarStatus.info:
        return Styleguide.colorGray_9;
      default:
        throw UnimplementedError('Missing color for SnakbarStatus $this');
    }
  }
}

void showSnackbar({
  required BuildContext context,
  required String text,
}) {
  // Display snackbar only for mobile
  final snackBar = SnackBar(content: Text(text));

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
