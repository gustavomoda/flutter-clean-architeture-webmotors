import 'package:flutter/material.dart';

mixin AppColors {
  static Color primary = const Color(0xFFec0928);
  static Color primaryDark = const Color.fromARGB(255, 87, 4, 15);
  static Color surfaceDark = const Color.fromARGB(255, 255, 60, 86);
}

mixin AppTheme {
  static ThemeData get light => ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: Colors.white,
        ),
      );

  static ThemeData get dark => ThemeData.from(
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          onPrimary: Colors.white.withOpacity(0.9),
          onSurface: AppColors.surfaceDark,
        ),
      );
}
