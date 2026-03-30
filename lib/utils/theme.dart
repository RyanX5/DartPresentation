import 'package:flutter/material.dart';

class AppColors {
  static const dartBlue = Color(0xFF1E88E5);
  static const dartCyan = Color(0xFF29B6F6);
  static const dartColor = dartBlue; // keep compat with existing code

  // Background
  static const slideBg = Color(0xFF060D14);

  // Text on dark bg
  static const textPrimary = Colors.white;
  static const textSecondary = Color(0xFFB0BEC5); // blue-grey 200
  static const textMuted = Color(0xFF546E7A); // blue-grey 600
}

class TextStyles {
  final Color color;
  TextStyles({this.color = Colors.white});

  TextStyle title() {
    return TextStyle(
      color: color,
      fontSize: 42,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
    );
  }

  TextStyle subtitle() {
    return TextStyle(
      color: color.withAlpha(150),
      fontSize: 26,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle heading1() {
    return TextStyle(
      color: color,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.3,
    );
  }

  TextStyle normal() {
    return const TextStyle(
      color: AppColors.textSecondary,
      fontSize: 22,
      height: 1.5,
    );
  }
}
