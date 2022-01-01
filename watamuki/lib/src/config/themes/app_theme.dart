import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: AppColors.green,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: GoogleFonts.sourceSansPro().fontFamily,
      textTheme: const TextTheme(
        // heading-1
        headline1: TextStyle(
          color: AppColors.black,
          height: 48.0 / 36.0,
          // line height calculated as is fontSize * height so, <expected-height>/<font-size>
          fontSize: 36.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        // heading-2-bold
        headline2: TextStyle(
          color: AppColors.black,
          height: 36.0 / 18.0,
          fontSize: 18.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        // heading-2-regular
        headline3: TextStyle(
          color: AppColors.black,
          height: 36.0 / 18.0,
          fontSize: 18.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        // button
        button: TextStyle(
          color: AppColors.black,
          height: 26.0 / 18.0,
          fontSize: 18.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        // caption-bold
        subtitle1: TextStyle(
          color: AppColors.black,
          height: 22.0 / 16.0,
          fontSize: 16.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        // caption-regular
        subtitle2: TextStyle(
          color: AppColors.black,
          height: 22.0 / 16.0,
          fontSize: 16.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        // text-bold
        bodyText1: TextStyle(
          color: AppColors.black,
          height: 20.0 / 14.0,
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        // text-regular
        bodyText2: TextStyle(
          color: AppColors.black,
          height: 20.0 / 14.0,
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        // sub-heading
        caption: TextStyle(
          color: AppColors.black,
          height: 20.0 / 12.0,
          fontSize: 12.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: AppColors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        titleTextStyle: TextStyle(color: AppColors.black),
      ),
    );
  }
}
