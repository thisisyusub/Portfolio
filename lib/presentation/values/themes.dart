import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final _fontStyle = GoogleFonts.abel(
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

class AppThemes {
  AppThemes._();

  static final theme = ThemeData(
    primaryColor: AppColors.primaryColor,
    focusColor: AppColors.actionColor,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: _fontStyle.fontFamily,
    textTheme: TextTheme(
      headline2: _fontStyle.copyWith(
        fontSize: 56.0,
        fontWeight: FontWeight.w500,
      ),
      headline6: _fontStyle.copyWith(fontSize: 20),
      subtitle1: _fontStyle.copyWith(
        fontSize: 16,
        color: AppColors.primaryColor.withOpacity(0.8),
      ),
    ),
  );
}
