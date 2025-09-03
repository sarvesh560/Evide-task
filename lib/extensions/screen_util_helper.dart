import 'package:flutter/material.dart';
import 'dart:math';

class ScreenUtilHelper {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  static const double baseWidth = 375.0;
  static const double baseHeight = 812.0;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;
  }

  static double scaleWidth(double width) {
    return (width / baseWidth) * screenWidth;
  }

  static double scaleHeight(double height) {
    return (height / baseHeight) * screenHeight;
  }

  static double scaleText(double fontSize) {
    return scaleWidth(fontSize);
  }

  static double scaleRadius(double radius) {
    return scaleWidth(radius);
  }

  static double width(double value) => scaleWidth(value);
  static double height(double value) => scaleHeight(value);
  static double fontSize(double value) => scaleText(value);
  static double radius(double value) => scaleRadius(value);

  static double scaleAll(double value) {
    return min(scaleWidth(value), scaleHeight(value));
  }
}
