import 'package:flutter/material.dart';

class Dimens {
  static double appWidth(context) =>  MediaQuery.of(context).size.width;
  static double appHeight(context) =>  MediaQuery.of(context).size.height;
  static double textScale(context) => MediaQuery.of(context).textScaleFactor;
  static const double defaultPadding = 20.0;
  static const double fontSize = 12.0;
  static const double mediumFontSize = 14.0;
  static const double largeFontSize = 18.0;
}