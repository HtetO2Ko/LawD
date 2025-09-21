import 'package:flutter/material.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,

    // TextField Decoration - (tf)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.tfBackground,
      labelStyle: TextStyle(color: Colors.black54),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.tfBorder, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.tfBorder, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.tfBorder, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
