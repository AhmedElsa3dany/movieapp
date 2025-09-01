import 'package:cleanarch/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle headline_text() {
    return GoogleFonts.oswald(
      textStyle: TextStyle(
        fontSize: 20,
        color: AppColors.kTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle title_text() {
    return GoogleFonts.oswald(
      textStyle: TextStyle(
        fontSize: 25,
        color: AppColors.kTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle subtitle_text({required double size}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: size,
        color: AppColors.kText2Color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle overview_text({required double size}) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: size,
        color: AppColors.kText3Color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle card_text() {
    return GoogleFonts.robotoSerif(
      textStyle: TextStyle(
        fontSize: 15,
        color: AppColors.kText2Color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle number_text() {
    return GoogleFonts.robotoSerif(
      textStyle: TextStyle(
        fontSize: 20,
        color: AppColors.kText3Color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
