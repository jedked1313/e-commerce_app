import 'package:flutter/material.dart';
import 'dart:math' as math;

class AppColor {
  static const primaryColor = Color.fromRGBO(4, 93, 255, 1);
  static const white = Colors.white;
  static const grey = Colors.grey;
  static Color ligthGrey = Colors.grey.shade300;
  static const black = Colors.black;

  // Generate random Color
  static Color generateColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withValues(alpha: 0.5);
  }
}
