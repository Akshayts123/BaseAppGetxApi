import 'package:flutter/material.dart';
import 'dimentions.dart';

class TStyle {
  static const String _fontFamily = 'Poppins';

  static TextStyle get h1 => TextStyle(
        fontSize: Dimensions.fontSizeOverLargeExtra,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontFamily: _fontFamily,
      );
  static TextStyle get h2 => TextStyle(
        fontSize: Dimensions.fontSizeOverLarge,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontFamily: _fontFamily,
      );
  static TextStyle get h3 => TextStyle(
        fontSize: Dimensions.fontSizeLarge,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: _fontFamily,
      );

  static TextStyle get h4 => TextStyle(
        fontSize: Dimensions.fontSizeLarge,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: _fontFamily,
      );
  static TextStyle get h5 => TextStyle(
        fontSize: Dimensions.fontSizeDefault,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: _fontFamily,
      );

  static TextStyle get h6 => TextStyle(
        fontSize: Dimensions.fontSizeSmall,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: _fontFamily,
      );
  static TextStyle get h7 => TextStyle(
        fontSize: Dimensions.fontSizeSmall,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: _fontFamily,
      );
  static TextStyle get heading => TextStyle(
        fontSize: Dimensions.fontSizeExtraSmall,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: _fontFamily,
      );

  static TextStyle get subtitle => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: _fontFamily,
      );
}
