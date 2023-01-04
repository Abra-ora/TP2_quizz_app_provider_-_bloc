import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 38, 39, 39),
      ),
    ),
    textTheme: const TextTheme(
      button: TextStyle(color: Colors.white),
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.grey[800],
    iconTheme: const IconThemeData(color: Colors.white),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.white),
      trackColor: MaterialStateProperty.all(Colors.grey),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      color: Color.fromARGB(255, 38, 39, 39),
    ),

    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
      Colors.white.value,
      const <int, Color>{
        50: Colors.white10,
        100: Colors.white12,
        200: Colors.white24,
        300: Colors.white30,
        400: Colors.white54,
        500: Colors.white70,
        600: Colors.white70,
        700: Colors.white70,
        800: Colors.white70,
        900: Colors.white70,
      },
    )).copyWith(secondary: Colors.grey));


final lightTheme = ThemeData(
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 38, 39, 39),
      ),
    ),
    textTheme: const TextTheme(
      button: TextStyle(color: Colors.white),
      headline1: TextStyle(color: Colors.black),
      headline2: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 226, 224, 224),
    iconTheme: const IconThemeData(color: Colors.black),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.white),
      trackColor: MaterialStateProperty.all(Colors.grey),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      color: Color.fromARGB(255, 38, 39, 39),
    ),

    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
      Colors.black.value,
      const <int, Color>{
        50: Colors.black12,
        100: Colors.black26,
        200: Colors.black38,
        300: Colors.black45,
        400: Colors.black54,
        500: Colors.black87,
        600: Colors.black87,
        700: Colors.black87,
        800: Colors.black87,
        900: Colors.black87,
      },
    )).copyWith(secondary: Colors.grey));
