import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

ThemeData appThemeData = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: ConstColor.white,
  dividerColor: ConstColor.white,
  appBarTheme: AppBarTheme(backgroundColor: ConstColor.white),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: ConstColor.white500)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: ConstColor.white500)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: ConstColor.white500)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: ConstColor.white500)),
    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: ConstColor.white500)),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: ConstColor.white,
    iconColor: ConstColor.white,
    shadowColor: ConstColor.white,
    surfaceTintColor: ConstColor.white,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(hoverColor: ConstColor.white, highlightColor: ConstColor.white),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(ConstColor.white), mouseCursor: WidgetStatePropertyAll(MouseCursor.defer))),
  textButtonTheme: TextButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(ConstColor.white), mouseCursor: WidgetStatePropertyAll(MouseCursor.defer))),
);
