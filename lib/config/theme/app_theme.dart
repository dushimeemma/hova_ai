import 'package:flutter/material.dart';
import 'package:hova_ai/core/constants/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: scaffoldBgColor,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: scaffoldBgColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    ),
  );
}
