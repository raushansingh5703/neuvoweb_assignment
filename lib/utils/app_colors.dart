import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryBlue = Color(0xFF124A9A);
  static const Color secondaryBlue = Color(0xFF3865E0);

  static const Color accentYellow = Color(0xFFF2C94C);

  static const Color darkMaroon = Color(0xFF3D0017);
  static const Color lightMaroon = Color(0xFF9E6279);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;

  static const LinearGradient primaryBlueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [

      Color(0xff0F4DB8),
      Color(0xff2F6DEB),
    ],
  );
}
