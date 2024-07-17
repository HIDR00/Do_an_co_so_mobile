// ignore_for_file: avoid_hard_coded_colors
import 'package:flutter/material.dart';

import '../../app.dart';

class AppColors {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryGradient,
    required this.borderTable,
    required this.baseColors1,
    required this.baseColors2,
    required this.baseColors3,
    required this.baseColors4,
    required this.neutral1,
    required this.neutral2,
    required this.bgTable
  });

  static late AppColors current;

  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;

  final Color baseColors1;
  final Color baseColors2;
  final Color baseColors3;
  final Color baseColors4;

  final Color neutral1;
  final Color neutral2;

  final Color borderTable;
  final Color bgTable;

  /// gradient
  final LinearGradient primaryGradient;

  // Primary
  static const Color genericBlack = Color.fromRGBO(0, 0, 0, 1);
  static const Color primaryBG = Color(0xFFF6F2ED);

  static const defaultAppColor = AppColors(
    primaryColor: Color.fromARGB(255, 166, 168, 254),
    secondaryColor: Color.fromARGB(255, 62, 62, 70),
    primaryTextColor: Color.fromARGB(255, 62, 62, 70),
    secondaryTextColor: Color.fromARGB(255, 166, 168, 254),
    
    baseColors1: Color(0xFF4B2C20),
    baseColors2: Color(0xFFD5BBA2),
    baseColors3: Color(0xFFA67C52),
    baseColors4: Color(0xFF4B2C20),

    neutral1: Color(0xFF272727),
    neutral2: Color(0xFFF6F2ED),

    borderTable: Color.fromARGB(255, 112, 163, 215),
    bgTable: Color(0xFFebf5ff),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
  );

  static const darkThemeColor = AppColors(
    primaryColor: Color.fromARGB(255, 62, 62, 70),
    secondaryColor: Color.fromARGB(255, 166, 168, 254),
    primaryTextColor: Color.fromARGB(255, 166, 168, 254),
    secondaryTextColor: Color.fromARGB(255, 62, 62, 70),

    baseColors1: Color(0xFF332920),
    baseColors2: Color(0xFF1E1410),
    baseColors3: Color(0xFF8C6A4F),
    baseColors4: Color(0xFF3C7266),

    neutral1: Color(0xFF2E2A27),
    neutral2: Color(0xFF989898),

    borderTable: Color.fromARGB(255, 112, 163, 215),
    bgTable: Color(0xFFebf5ff),
    primaryGradient: LinearGradient(colors: [Color(0xFFFFFFFF), Color(0xFFFE6C30)]),
  );

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }
}
