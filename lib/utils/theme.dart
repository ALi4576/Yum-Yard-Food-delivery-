import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yum_yard/utils/utils.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary100,
    secondary: AppColors.secondary100,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 48,
      color: AppColors.ambient,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 42,
      color: AppColors.ambient,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 36,
      color: AppColors.ambient,
    ),
    headlineLarge: GoogleFonts.inter(
      fontSize: 32,
      color: AppColors.ambient,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 28,
      color: AppColors.ambient,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 24,
      color: AppColors.ambient,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 28,
      color: AppColors.ambient,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 24,
      color: AppColors.ambient,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 20,
      color: AppColors.ambient,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 20,
      color: AppColors.ambient,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 16,
      color: AppColors.ambient,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 14,
      color: AppColors.ambient,
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.white,
    titleTextStyle: GoogleFonts.inter(
      fontSize: 20,
      color: AppColors.ambient,
    ),
    contentTextStyle: GoogleFonts.inter(
      fontSize: 16,
      color: AppColors.ambient,
    ),
    actionsPadding: const EdgeInsets.symmetric(horizontal: 5),
  ),
  dialogBackgroundColor: AppColors.white,
);
