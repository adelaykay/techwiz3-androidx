// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:StreamMaster/components/flutter_flow/shared_preferences.dart';


const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class XTheme {
  var overlay;


  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static XTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  late Color primaryColor;
  late Color extendedPrimary;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color secondaryBackground;
  late Color primaryBtnText;
  late Color lineColor;
  Color primary = Color(0xFFD24848);
  Color primaryText = Color(0xFFFFFFF3);
  Color secondaryText = Color(0xFFFFECD1);
  Color primaryBackground = Color(0xFF221A1A);

  TextStyle get title1 => GoogleFonts.getFont(
    'Poppins',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  TextStyle get title2 => GoogleFonts.getFont(
    'Poppins',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );
  TextStyle get title3 => GoogleFonts.getFont(
    'Poppins',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  TextStyle get subtitle1 => GoogleFonts.getFont(
    'Poppins',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  TextStyle get subtitle2 => GoogleFonts.getFont(
    'Poppins',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  TextStyle get bodyText1 => GoogleFonts.getFont(
    'Poppins',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  TextStyle get bodyText2 => GoogleFonts.getFont(
    'Poppins',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  TextStyle get bodySmall => GoogleFonts.getFont(
    'Poppins',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  TextStyle get bodyMedium => GoogleFonts.getFont(
    'Poppins',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  TextStyle get titleSmall => GoogleFonts.getFont(
    'Poppins',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );
  TextStyle get headlineSmall => GoogleFonts.getFont(
    'Inter',
    color: secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 30,
    height: 1.2
  );

}



class LightModeTheme extends XTheme {
  late Color primaryColor = const Color(0xFFD24848);
  late Color extendedPrimary = const Color(0xFFFFECD1);
  late Color secondaryColor = const Color(0xFF0072BB);
  late Color tertiaryColor = const Color(0xFF8FC93A);
  late Color alternate = const Color(0xFFE4CC37);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF101213);
  late Color secondaryText = const Color(0xFF57636C);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
}

class DarkModeTheme extends XTheme {
  late Color primaryColor = const Color(0xFFD24848);
  late Color extendedPrimary = const Color(0xFFA26868);
  late Color secondaryColor = const Color(0xFF0072BB);
  late Color tertiaryColor = const Color(0xFF8FC93A);
  late Color alternate = const Color(0xFFE4CC37);
  late Color primaryBackground = const Color(0xFF221A1A);
  late Color secondaryBackground = const Color(0xFF101213);
  late Color primaryText = const Color(0xFFFFFFF3);
  late Color secondaryText = const Color(0xFF95A1AC);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color secondaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF22282F);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
        fontFamily!,
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
        decoration: decoration,
        height: lineHeight,
      )
          : copyWith(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
}