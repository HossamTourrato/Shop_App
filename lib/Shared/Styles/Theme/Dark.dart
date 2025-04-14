import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Colors.dart';

ThemeData darkTheme = ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defColor
  ),
  scaffoldBackgroundColor: Colors.black12,
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.white,
    actionsIconTheme: IconThemeData(
        color: defColor
    ),
    backgroundColor: Colors.black12,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defColor,
    unselectedItemColor: Colors.white,
    elevation: 1,
    backgroundColor: Colors.black12,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      // fontSize: 19,
      // fontWeight: FontWeight.bold,
    ),
  ),
) ;
