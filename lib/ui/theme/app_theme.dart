import 'package:flutter/material.dart';

import 'theme.dart';

mixin AppTheme {
  static const Color _lightFillColor = Color(0xFF303030);
  static const Color _darkFillColor = Color(0xFFFCFCFC);

  static final Color _lightFocusColor = _lightFillColor.withOpacity(0.12);
  static final Color _darkFocusColor = _darkFillColor.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(final ColorScheme colorScheme, final Color focusColor) => ThemeData(
        canvasColor: colorScheme.background,
        colorScheme: colorScheme,
        disabledColor: colorScheme.onBackground.withAlpha(40),
        dividerColor: colorScheme.onBackground.withAlpha(40),
        elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
        errorColor: colorScheme.error,
        focusColor: focusColor,
        fontFamily: 'Poppins',
        highlightColor: Colors.transparent,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        inputDecorationTheme: inputDecorationTheme(colorScheme),
        primaryColor: colorScheme.primary,
        primaryColorLight: colorScheme.primaryVariant,
        scaffoldBackgroundColor: colorScheme.background,
        textTheme: AppTextTheme.poppinsTextTheme,
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
    primaryVariant: Color(0xFF595959),
    secondary: Color(0xFF31844A),
    secondaryVariant: Color(0xFF63B476),
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
    primaryVariant: Color(0xFF595959),
    secondary: Color(0xFF31844A),
    secondaryVariant: Color(0xFF63B476),
    surface: Color(0xFF383838),
  );

  static ElevatedButtonThemeData elevatedButtonThemeData(final ColorScheme colorScheme) => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          onPrimary: colorScheme.onPrimary,
          onSurface: colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          primary: colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTextTheme.poppinsTextTheme.subtitle1?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w400,
          ),
        ),
      );

  static InputDecorationTheme inputDecorationTheme(final ColorScheme colorScheme) => InputDecorationTheme(
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
        labelStyle: AppTextTheme.poppinsTextTheme.bodyText1,
        hintStyle: AppTextTheme.poppinsTextTheme.subtitle1?.copyWith(
          color: colorScheme.onBackground.withAlpha(40),
        ),
      );
}
