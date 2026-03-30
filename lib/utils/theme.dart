import 'package:flutter/material.dart';

class TextStyles {
  final Color color;
  TextStyles({this.color = Colors.black});

  TextStyle title() {
    return TextStyle(color: color, fontSize: 42, fontWeight: FontWeight.bold);
  }

  TextStyle subtitle() {
    return TextStyle(color: color.withAlpha(150), fontSize: 30);
  }
}

class AppColors {
  static const dartColor = Colors.blue;
}
