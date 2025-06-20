import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  static const KnormalTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const KdescreptionTextStyle = TextStyle(
    color: Color(0xff677294),
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static TextStyle Kregular(double size) {
    return TextStyle(
      fontSize: size,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: " DM Sans",
    );
  }
  static TextStyle KregularWhite(double size) {
    return TextStyle(
      fontSize: size,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: " DM Sans",
    );
  }
}
