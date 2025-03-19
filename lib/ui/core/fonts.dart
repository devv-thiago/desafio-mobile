import 'package:flutter/material.dart';
import 'package:movie_app/ui/core/colors.dart';

class AppFontStyle {
  static const String _fontFamily = 'Poppins';

  static final TextStyle darkSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );

  static final TextStyle darkMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.background,
  );

  static final TextStyle darkLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );

  // Fontes claras
  static final TextStyle lightSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.color1,
  );

  static final TextStyle lightMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.color1,
  );

  static final TextStyle lightLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.color1,
  );
  static final TextStyle lightTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.color1,
  );
}
