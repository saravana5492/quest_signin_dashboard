import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';

final class AppTheme {
  // Light theme setup
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    fontFamily: GoogleFonts.manrope().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundColor,
      surfaceTintColor: Colors.transparent,
    ),
    brightness: Brightness.light,
    inputDecorationTheme: inputDecorationTheme,
  );

  // Text field input decoration theme
  static final inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    filled: true,
    fillColor: AppColor.whiteColor,
    labelStyle: AppTextStyle.mediumRegularBodyStyle,
    hintStyle: AppTextStyle.mediumRegularBodyStyle,
    errorStyle:
        AppTextStyle.smallRegularBodyStyle.copyWith(color: AppColor.errorColor),
    border: _border(),
    enabledBorder: _border(),
    focusedBorder: _border(),
    errorBorder: _border(AppColor.errorColor),
  );

  // Comman border
  static _border([Color color = AppColor.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
      );
}
