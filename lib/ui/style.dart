import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const vantaBlack = Color(0xFF030303);
const brightCrayola = Color(0xFFFFA827);
const ghostWhite = Color(0xFFF7F7FF);
const blueJeans = Color(0xFF00ABF5);
const bitterLemon = Color(0xFFB0E000);
const arcticLime = Color(0xFFCEFF1A);
const goldenBridge = Color(0xFFBB4430);
const maximumGreen = Color(0xFF548C2F);
const frenchBistre = Color(0xFF726953);
const cultured = Color(0xFFFCF5E8);
const torPurple = Color(0xFF7D4698);
const frenchViolet = Color.fromARGB(255, 109, 40, 174);
const venetian = Color(0xFFBF211E);
const cinnabar = Color(0xFFD64933);
const flame = Color(0xFFE53D00);
const lightSeaGreen = Color(0xFF00A9A5);
const tealBlue = Color(0xFF4E8098);
const paradisePink = Color(0xFFEF476F);

const carolinaBlue = Color(0xFF009FFD);

ThemeData mainTheme() => ThemeData(
      textTheme: GoogleFonts.aldrichTextTheme(),
      colorScheme: ColorScheme(
        primary: bitterLemon,
        secondary: blueJeans,
        tertiary: brightCrayola,
        tertiaryContainer: frenchViolet,
        surface: ghostWhite.withOpacity(0.009),
        onPrimaryContainer: vantaBlack.withOpacity(0.6),
        background: vantaBlack,
        error: venetian,
        onPrimary: cultured,
        onSecondary: lightSeaGreen,
        onSurface: cultured,
        onBackground: cultured,
        onError: cultured,
        brightness: Brightness.dark,
      ),
    );
// ThemeData(
//   textTheme: GoogleFonts.aldrichTextTheme(),
//   colorScheme: ColorScheme(
//     primary: brightCrayola,
//     secondary: blueJeans,
//     tertiary: maximumGreen,
//     surface: richFogra.withOpacity(0.09),
//     background: cultured,
//     error: goldenBridge,
//     onPrimary: richFogra,
//     onSecondary: richFogra,
//     onSurface: richFogra,
//     onBackground: richFogra,
//     onError: richFogra,
//     brightness: Brightness.dark,
//   ),
// );
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
