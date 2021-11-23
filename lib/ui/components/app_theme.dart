import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin AppTheme {
  static const _lightFillColor = Color(0xFF303030);
  static const _darkFillColor = Color(0xFFFCFCFC);

  static final Color _lightFocusColor = _lightFillColor.withOpacity(0.12);
  static final Color _darkFocusColor = _darkFillColor.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
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
      textTheme: _textTheme,
    );
  }

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

  static ElevatedButtonThemeData elevatedButtonThemeData(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        onPrimary: colorScheme.onPrimary,
        onSurface: colorScheme.onSurface,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
        primary: colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: _textTheme.subtitle1?.copyWith(color: colorScheme.onPrimary),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: colorScheme.onBackground.withAlpha(80),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: colorScheme.error,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: colorScheme.onBackground.withAlpha(200),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: colorScheme.onBackground.withAlpha(40),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: colorScheme.error,
        ),
      ),
      labelStyle: _textTheme.bodyText1,
      hintStyle: _textTheme.subtitle1?.copyWith(
        color: colorScheme.onBackground.withAlpha(40),
      ),
    );
  }

  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 93,
      fontWeight: _light,
      letterSpacing: -1.5,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 58,
      fontWeight: _light,
      letterSpacing: -0.5,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 46,
      fontWeight: _regular,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 33,
      fontWeight: _regular,
      letterSpacing: 0.25,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 23,
      fontWeight: _regular,
    ),
    headline6: GoogleFonts.poppins(
      fontSize: 19,
      fontWeight: _medium,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: _regular,
      letterSpacing: 0.15,
    ),
    subtitle2: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: _medium,
      letterSpacing: 0.1,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: _regular,
      letterSpacing: 0.5,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: _regular,
      letterSpacing: 0.25,
    ),
    button: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: _medium,
      letterSpacing: 1.25,
    ),
    caption: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: _regular,
      letterSpacing: 0.4,
    ),
    overline: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: _regular,
      letterSpacing: 1.5,
    ),
  );
}
