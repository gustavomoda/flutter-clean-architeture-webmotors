import 'package:flutter/material.dart';

mixin AppColors {
  static Color primary = const Color(0xFFec0928);
}

mixin AppTheme {
  static ThemeData get light => ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
        ),
      );

  static ThemeData get dark => ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
        ),
      );
}
