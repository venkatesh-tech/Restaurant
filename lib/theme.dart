import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/values/values.dart';

const MaterialColor white = const MaterialColor(0xFFFFFFFF, const <int, Color>{
  50: const Color(0xFFFFFAAA),
  100: const Color(0xFFFFFBBB),
  200: const Color(0xFFFFFBBB),
  300: const Color(0xFFFFFCCC),
  400: const Color(0xFFFFFDDD),
  500: const Color(0xFFFFFEEE),
  600: const Color(0xFFFAFAFA),
  700: const Color(0xFFFBFBFB),
  800: const Color(0xFFFCFCFC),
  900: const Color(0xFFFDFDFD),
});

ThemeData _lightTheme(BuildContext context) {
  const Color primaryColor = AppColorsConst.primaryColor;
  const Color secondaryColor = AppColorsConst.secondaryColor;

  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );

  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    // accentColorBrightness: Brightness.light,
    colorScheme: colorScheme,
    // buttonColor: Colors.blueAccent,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        }),
    iconTheme: IconThemeData(color: AppColorsConst.iconColor),
    buttonTheme: ButtonThemeData(
        height: Sizes.HEIGHT_40, // 48.0
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
        buttonColor: AppColorsConst.secondaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.RADIUS_8))),
    bottomAppBarTheme: BottomAppBarTheme(elevation: Sizes.ELEVATION_4),
  );
  return base;
}

ThemeData _darkTheme(BuildContext context) {
  const Color primaryColor = Colors.black;
  const Color secondaryColor = Colors.grey;

  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );

  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
    // accentColorBrightness: Brightness.dark,
    colorScheme: colorScheme,
    // buttonColor: Colors.blueAccent,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        }),
    iconTheme: IconThemeData(color: AppColorsConst.iconColor),
    buttonTheme: ButtonThemeData(
        height: Sizes.HEIGHT_40, // 48.0
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
        buttonColor: AppColorsConst.secondaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.RADIUS_8))),
    bottomAppBarTheme: BottomAppBarTheme(elevation: Sizes.ELEVATION_4),
  );
  return base;
}

TextTheme _textTheme(BuildContext context) {
  var textTheme = Theme.of(context).textTheme;

  return GoogleFonts.josefinSansTextTheme(textTheme).copyWith(
    headline1: GoogleFonts.josefinSans(
        fontSize: Sizes.SIZE_36,
        color: AppColorsConst.primaryText,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal),
    headline2: GoogleFonts.josefinSans(
        fontSize: Sizes.SIZE_24,
        color: AppColorsConst.primaryText,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal),
    headline3: GoogleFonts.josefinSans(
        fontSize: Sizes.SIZE_20,
        color: AppColorsConst.primaryText,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal),
  );
}
