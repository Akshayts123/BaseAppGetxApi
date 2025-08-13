import 'package:flutter/material.dart';
import 'colors.dart';

const customAppbarShadow = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color(0xffEBF1F4),
      Colors.white,
    ],
  ),
);



List<BoxShadow> commonShadow = const [
  BoxShadow(
    offset: Offset(0, 14),
    blurRadius: 24,
    spreadRadius: 0,
    color: Color(0xFFF5F5F5),
  ),
];

List<BoxShadow> commonCardShadow = const [
  BoxShadow(
    color: Color(0xFFEEEEEE),
    offset: Offset(0, 0),
    blurRadius: 27,
    spreadRadius: 0,
  ),
];

LinearGradient customGradient(Color color1, Color color2) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      color1,
      color2,
    ],
  );
}

var cardShadowStrong = [
  BoxShadow(
    color: AppColors.grey.withOpacity(0.4),
    offset: const Offset(0, 15),
    blurRadius: 40,
    spreadRadius: -10,
  ),
];

BoxShadow greenShadow = BoxShadow(
  color: AppColors.lightTeal.withOpacity(0.41),
  offset: const Offset(0, 32),
  blurRadius: 32,
  spreadRadius: 0,
);
