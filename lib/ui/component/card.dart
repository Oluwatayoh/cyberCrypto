import 'package:cyberCrypto/ui/component/constants.dart';
import 'package:cyberCrypto/ui/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

Widget card(
    {double width = double.infinity,
    Color? color,
    double padding = 20,
    Widget? child}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Container(
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          // color: color,
          // Colors.grey.shade200,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: child,
    ),
  );
}
