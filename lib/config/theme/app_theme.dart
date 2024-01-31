import 'package:flutter/material.dart';
import 'package:hova_ai/core/constants/constants.dart';
import 'package:hova_ai/core/helpers/helpers.dart';

ThemeData theme({
  required double width,
}) {
  return ThemeData(
    scaffoldBackgroundColor:
        !HelperMethods.isDeskTop(width: width) ? scaffoldBgColor : deskTopBg,
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
