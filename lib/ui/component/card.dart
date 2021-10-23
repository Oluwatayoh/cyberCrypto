import 'package:flutter/material.dart';

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
