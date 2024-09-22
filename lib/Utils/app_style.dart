import 'package:flutter/material.dart';

class AppStyle {
  String? title;
  static const Color primaryColor = Colors.blue;
  static TextStyle appBarTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.w400,
    );
  }
}
