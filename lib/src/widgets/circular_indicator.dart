import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Positioned customCircularIndicator() {
  return const Positioned(
    top: 30,
    right: 30,
    child: Center(
      child: CupertinoActivityIndicator(),
    ),
  );
}
