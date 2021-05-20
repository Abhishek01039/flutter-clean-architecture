import 'package:flutter/material.dart';

void showSnackbar({
  required BuildContext context,
  required String text,
}) {
  // Display snackbar only for mobile
  final snackBar = SnackBar(content: Text(text));

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
