import 'package:cyberCrypto/ui/component/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'app_color.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: AppColor.bodyColorDark,
    scaffoldBackgroundColor: AppColor.bodyColorDark,
    hintColor: AppColor.textColor,
    primaryColorLight: AppColor.buttonBackgroundColorDark,
    cardTheme: CardTheme(color: HexColor(dModeLightDark)),
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(), // This is required
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.white));
