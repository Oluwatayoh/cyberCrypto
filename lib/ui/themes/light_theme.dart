import 'package:cyberCrypto/ui/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'app_color.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColor.bodyColor,
    scaffoldBackgroundColor: AppColor.bodyColor,
    hintColor: AppColor.textColor,
    primaryColorLight: AppColor.buttonBackgroundColor,
    cardTheme: CardTheme(color: HexColor(dModeGrey2)),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.black));
