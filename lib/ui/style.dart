import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData mainTheme() => ThemeData(
      textTheme: GoogleFonts.aldrichTextTheme(),
      colorScheme: ColorScheme(
        primary: Colors.orange[400]!,
        // primaryVariant: const Color(0xFF0745ff),
        secondary: const Color(0xFF87888a),
        //  const Color(0xFF13161f),
        // secondaryVariant: const Color(0xFF87888a),
        surface: Colors.blue.withOpacity(0.05),
        background: const Color(0xFF13161f),
        error: const Color(0xFFff0000),
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
