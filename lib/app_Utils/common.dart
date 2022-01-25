import 'package:flutter/material.dart';

Widget CommonText(
    {String text,
      double fontSize = 14.00,
      Color textColor = Colors.black,
      FontWeight fontStyle = FontWeight.normal}) {
  return Text(
    text,
    style:
    TextStyle(fontSize: fontSize, color: textColor, fontWeight: fontStyle),
  );
}