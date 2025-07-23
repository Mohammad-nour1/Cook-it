import 'package:flutter/material.dart';

ThemeData lightMood = ThemeData(
  colorScheme: ColorScheme.light( 
    background: Colors.grey.shade300,
    primary: const Color(0xff9DE7C0),
    secondary: const Color(0xffFFB039),
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade900,
    onPrimary: Colors.black, 
    onBackground: Colors.black, 
    onSecondary: Colors.black, 
  ),
);

ThemeData darkMood = ThemeData(
  colorScheme: ColorScheme.dark( 
    background: Colors.grey.shade900,
    primary: Colors.black,
    secondary: const Color(0xffFFB039),
    tertiary: Colors.grey.shade200,
    inversePrimary: Colors.grey.shade300,
    onPrimary: Colors.white, 
    onBackground: Colors.white,
    onSecondary: Colors.white,
  ),
);
