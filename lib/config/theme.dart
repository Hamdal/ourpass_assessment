import 'package:flutter/material.dart';
import 'package:ourpass_assessment/config/constants.dart';

class Dimensions {
  static const double xsmall = 4;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 32;
  static const EdgeInsets globalPadding = EdgeInsets.all(medium);
}

class AppThemeLight {
  AppThemeLight._();

  static ThemeData get _baseTheme => ThemeData(
    primaryColor: AppColors.primary,
    iconTheme: const IconThemeData(
      color: AppColors.grey,
    ),
  );

  static ThemeData get defaultTheme => _baseTheme.copyWith(
    brightness: Brightness.light
  );
}