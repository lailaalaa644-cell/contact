import 'package:contact_app/core/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.darkBlue,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.darkBlue,
        primary: AppColors.gold,
        surface: AppColors.darkBlue,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.gold,
        ),

        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.gold,
        ),

        bodySmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppColors.gold,
        ),
      ),
    );
  }
}
