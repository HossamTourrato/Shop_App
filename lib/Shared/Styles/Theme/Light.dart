import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColorLight: defColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defColor
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.white,
    actionsIconTheme: IconThemeData(
        color: defColor
    ),
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defColor,
    elevation: 1,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      // fontSize: 19,
      // fontWeight: FontWeight.bold,
    ),
  ),
) ;
