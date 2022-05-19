import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData mainTheme() => ThemeData(
      textTheme: GoogleFonts.aldrichTextTheme(),
      colorScheme: ColorScheme(
        primary: const Color(0xFFFFA827),
        // primary: const Color(0xFFCEFF1A),
        secondary: const Color(0xFF00ABF5),
        // tertiary: const Color(0xFF548C2F),
        tertiary: const Color(0xFFB0E000),
        surface: const Color(0xFFC9EDDC).withOpacity(0.009),
        background: const Color(0xFF13161f),
        // background: const Color(0xFF414066).withOpacity(0.08),
        error: const Color(0xFFC33C54),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white, //.withOpacity(0.8),
        onBackground: Colors.white, //.withOpacity(0.8),
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
    );

ThemeData derivedTheme(ThemeData theme) {
  return theme.copyWith(
    scaffoldBackgroundColor: theme.colorScheme.background,
    //Colors.blue[50], //_background,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: theme.colorScheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          // width: 1,
          color: theme.colorScheme.secondary.withAlpha(26),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          // width: 1,
          color: theme.colorScheme.secondary.withAlpha(26),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          // width: 1,
          color: Color(0xFFff9500),
        ),
      ),
      errorStyle: TextStyle(color: theme.colorScheme.error),
      filled: true,
      fillColor: theme.colorScheme.surface,
      focusColor: theme.colorScheme.onBackground,
      labelStyle: TextStyle(color: theme.colorScheme.onBackground),
      hintStyle: TextStyle(color: theme.colorScheme.primary.withOpacity(0.7)),
    ),
  );
}

Widget buttonToLoaderTransition({
  required Widget child,
  required Animation<double> animation,
}) =>
    FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
