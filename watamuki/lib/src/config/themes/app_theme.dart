import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.green.withGreen(230),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
