import 'package:flutter/material.dart';

import 'theme.dart';

mixin AppTheme {
  static const Color _lightFillColor = Color(0xFF303030);
  static const Color _darkFillColor = Color(0xFFFCFCFC);

  static final Color _lightFocusColor = _lightFillColor.withOpacity(0.12);
  static final Color _darkFocusColor = _darkFillColor.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) => ThemeData(
        canvasColor: colorScheme.background,
        disabledColor: colorScheme.onBackground.withAlpha(40),
        dividerColor: colorScheme.onBackground.withAlpha(40),
        elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
        focusColor: focusColor,
        fontFamily: 'Poppins',
        highlightColor: Colors.transparent,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        inputDecorationTheme: inputDecorationTheme(colorScheme),
        primaryColor: colorScheme.primary,
        primaryColorLight: colorScheme.primaryContainer,
        scaffoldBackgroundColor: colorScheme.background,
        textTheme: AppTextTheme.poppinsTextTheme,
        colorScheme: colorScheme.copyWith(error: colorScheme.error),
      );

  static const ColorScheme lightColorScheme = ColorScheme(
    background: Color(0xFFFCFCFC),
    brightness: Brightness.light,
    error: Color(0xFFD83838),
    onBackground: Color(0xFF303030),
    onError: Color(0xFFFCFCFC),
    onPrimary: Color(0xFFFCFCFC),
    onSecondary: Color(0xFFFCFCFC),
    onSurface: Color(0xFF303030),
    primary: Color(0xFF303030),
    secondary: Color(0xFF31844A),
    surface: Color(0xFFFFFFFF),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    background: Color(0xFF303030),
    brightness: Brightness.dark,
    error: Color(0xFFD83838),
    onBackground: Color(0xFFFCFCFC),
    onError: Color(0xFF303030),
    onPrimary: Color(0xFF303030),
    onSecondary: Color(0xFF303030),
    onSurface: Color(0xFFFCFCFC),
    primary: Color(0xFF303030),
    secondary: Color(0xFF31844A),
    surface: Color(0xFF383838),
  );

  static ElevatedButtonThemeData elevatedButtonThemeData(ColorScheme colorScheme) => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          elevation: 0,
          disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
          disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTextTheme.poppinsTextTheme.titleMedium?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w400,
          ),
        ),
      );

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) => InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.onBackground.withAlpha(80),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.onBackground.withAlpha(200),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.onBackground.withAlpha(40),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        labelStyle: AppTextTheme.poppinsTextTheme.bodyLarge,
        hintStyle: AppTextTheme.poppinsTextTheme.titleMedium?.copyWith(
          color: colorScheme.onBackground.withAlpha(40),
        ),
      );
}
