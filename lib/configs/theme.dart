import 'package:flutter/material.dart';

import '../configs/colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData themeData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    accentColor: AppColors.accentColor,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
          fontWeight: FontWeight.bold,
        )),
  );
}
