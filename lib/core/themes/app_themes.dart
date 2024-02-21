import 'package:flutter/material.dart';
import 'package:quickprism/core/colors/app_colors.dart';

class Themes {
  static final themeData = ThemeData(
    primarySwatch: AppColors.primarySwatch,

    // scaffoldBackgroundColor: AppColors.white,
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    // backgroundColor: AppColors.backGroundColor,
    // selectedItemColor: AppColors.backGroundColor,
    // unselectedItemColor: Colors.grey,
    // selectedIconTheme: const IconThemeData(color: Colors.white, size: 30),
    // unselectedIconTheme: IconThemeData(color: Colors.grey.shade700, size: 30),
    // selectedLabelStyle: const TextStyle(fontSize: 11, height: 1.5),
    // unselectedLabelStyle: const TextStyle(fontSize: 11, height: 1.5),
    // ),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.oldPrimaryP2, elevation: 0),
  );
}
