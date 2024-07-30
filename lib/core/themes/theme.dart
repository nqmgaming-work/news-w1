import 'package:first_pj/core/themes/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ThemeApp {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 3,
      ),
      borderRadius: BorderRadius.circular(10));
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
      errorBorder: _border(AppPallete.errorColor),
      focusedErrorBorder: _border(AppPallete.errorColor),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppPallete.whiteColor),
    ),
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(AppPallete.backgroundColor),
      side: BorderSide.none,
      labelStyle: TextStyle(color: AppPallete.whiteColor),

    )
  );
}
