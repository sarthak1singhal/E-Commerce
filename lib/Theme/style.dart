import 'package:flutter/material.dart';

import 'colors.dart';

final BorderRadius radius = BorderRadius.circular(6.0);

final ThemeData appTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: backgroundColor,
  primaryColor: mainColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,

  ///appBar theme
  appBarTheme: AppBarTheme(
    color: mainColor,
    elevation: 0.0,
  ),


);

