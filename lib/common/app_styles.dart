import 'package:Futer/common/app_colors.dart';
import 'package:Futer/utils/fontsize_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemesApp{
  static ThemeData defaultTheme = ThemeData(
    buttonColor: AppColors.blue_purple,
    fontFamily: 'Lato',
    colorScheme: _lightColorScheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColorScheme.primary,
      selectedItemColor: AppColors.blue,
    ),
    textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        subtitle1: TextStyle(
            fontSize: FontSizeApp.SIZE_20,
            fontWeight: FontWeight.w600
        ),
        subtitle2: TextStyle(
            fontSize: FontSizeApp.SIZE_18,
            fontWeight: FontWeight.w700
        ),
        button: TextStyle(
            fontSize: FontSizeApp.SIZE_16,
            fontWeight: FontWeight.w700
        ),
        caption: TextStyle(
            fontSize: FontSizeApp.SIZE_14,
            fontWeight: FontWeight.w400
        ),
        bodyText1: TextStyle(
          fontSize: FontSizeApp.SIZE_18,
          fontWeight: FontWeight.w500,
        ),
        bodyText2: TextStyle(
          fontSize: FontSizeApp.SIZE_16,
          fontWeight: FontWeight.w400,
        )
    ),
    ///Cursor color for androind+iOS
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: _lightColorScheme.secondary
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColors.sliver,
    ),
    hintColor: AppColors.sliver,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.primary,
      iconTheme: IconThemeData(color: _lightColorScheme.onPrimary),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: _lightColorScheme.primary,
    ),
    buttonTheme: ButtonThemeData(
      disabledColor: AppColors.cloud,
      buttonColor: _lightColorScheme.secondary,
      textTheme: ButtonTextTheme.primary,
    ),
    canvasColor: _lightColorScheme.background,
    toggleableActiveColor: _lightColorScheme.primary,
    highlightColor: AppColors.blue,
    indicatorColor: _lightColorScheme.onPrimary,
    primaryColor: _lightColorScheme.primary,
    accentColor: _lightColorScheme.primary,
    backgroundColor: _lightColorScheme.surface,
    scaffoldBackgroundColor: _lightColorScheme.onBackground,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: _darkColorScheme,
    highlightColor: AppColors.electron_blue,
    indicatorColor: _darkColorScheme.onPrimary,
    primaryColor: _darkColorScheme.primary,
    accentColor: _darkColorScheme.primary,
    backgroundColor: _darkColorScheme.surface,
    scaffoldBackgroundColor: _darkColorScheme.primary,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _darkColorScheme.primary,
      selectedItemColor: AppColors.electron_blue,
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: _darkColorScheme.secondary
    ),
    textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        subtitle1: TextStyle(
            fontSize: FontSizeApp.SIZE_20,
            fontWeight: FontWeight.w600
        ),
        subtitle2: TextStyle(
            fontSize: FontSizeApp.SIZE_18,
            fontWeight: FontWeight.w700
        ),
        button: TextStyle(
            fontSize: FontSizeApp.SIZE_16,
            fontWeight: FontWeight.w700
        ),
        caption: TextStyle(
            fontSize: FontSizeApp.SIZE_14,
            fontWeight: FontWeight.w400
        ),
        bodyText1: TextStyle(
          fontSize: FontSizeApp.SIZE_18,
          fontWeight: FontWeight.w500,
        ),
        bodyText2: TextStyle(
          fontSize: FontSizeApp.SIZE_16,
          fontWeight: FontWeight.w400,
        )
    ),
  );

  static final ColorScheme _lightColorScheme = ColorScheme(
    primary: Color(0xFFECF1F9),
    primaryVariant: Color(0xFFB6B2D6),
    secondary: Color(0xFF1A1A29),
    secondaryVariant: Color(0xFF383852),
    background: Color(0xFFB6B2D6),
    surface: Color(0xFFFFFFFF),
    onBackground: Color(0xFFECF1F9),
    onSurface: Color(0xFFECF1F9),
    error: AppColors.red,
    onError: AppColors.cloud,
    onPrimary: Color(0xFFECF1F9),
    onSecondary: AppColors.white,
    brightness: Brightness.light,
  );

  static final ColorScheme _darkColorScheme = ColorScheme(
    primary: Color(0xFF1A1A29),
    primaryVariant: Color(0xFF383852),
    secondary: Color(0xFFECF1F9),
    secondaryVariant: Color(0xFFB6B2D6),
    background: Color(0xFFB6B2D6),
    surface: Color(0xFF383852),
    onBackground: Color(0xFFECF1F9),
    onSurface: Color(0xFFFFFFFF),
    error: AppColors.red,
    onError: AppColors.cloud,
    onPrimary: AppColors.american_river,
    onSecondary: AppColors.black,
    brightness: Brightness.dark,
  );
}