import 'package:flutter/material.dart';

class ColorManager {
  static const backgroundWhite = Color.fromARGB(255, 255, 201, 254);
  static const Color lightBackgroundColor = Color.fromARGB(255, 237, 173, 232);
  static const Color transparentColor = Colors.transparent;
  static const Color darkBackgroundColor = Color.fromARGB(255, 0, 0, 0);
  static const Color darksacffold = Color.fromARGB(255, 19, 14, 19);
}

class AppTheme {
  ThemeData lightTheme = ThemeData(
      primaryColor: ColorManager.lightBackgroundColor,
      textTheme: const TextTheme(
        labelSmall: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            color: Color.fromRGBO(7, 7, 7, 1),
            fontSize: 25,
            fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            color: Color.fromARGB(255, 51, 51, 51),
            fontSize: 19,
            fontWeight: FontWeight.w200),
        displayMedium: TextStyle(
            color: Color.fromARGB(255, 22, 22, 22),
            fontSize: 30,
            fontWeight: FontWeight.bold),
        displayLarge: TextStyle(
            wordSpacing: -15,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 100,
            fontWeight: FontWeight.bold),
      ),
      scaffoldBackgroundColor: ColorManager.backgroundWhite,
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
      appBarTheme: const AppBarTheme(
          backgroundColor: ColorManager.backgroundWhite,
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      useMaterial3: true,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorManager.backgroundWhite,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ));
  ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorManager.darksacffold,
      primaryColor: ColorManager.darkBackgroundColor,
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        labelSmall: TextStyle(
            color: Color.fromARGB(255, 236, 236, 236),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            color: Color.fromRGBO(224, 224, 224, 1),
            fontSize: 25,
            fontWeight: FontWeight.bold),
        bodySmall: TextStyle(
            color: Color.fromARGB(255, 224, 224, 224),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 19,
            fontWeight: FontWeight.w200),
        displayMedium: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 30,
            fontWeight: FontWeight.bold),
        displayLarge: TextStyle(
            wordSpacing: -15,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 100,
            fontWeight: FontWeight.bold),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: ColorManager.backgroundWhite)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 19, 16, 20),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color.fromARGB(255, 247, 201, 255)));
}
