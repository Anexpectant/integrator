import 'package:flutter/material.dart';
import 'package:integrator/core/styles/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        background: lightBackground,
      ),
      scaffoldBackgroundColor: lightBackground,
      brightness: Brightness.light,
      fontFamily: 'Satoshi',
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(30),
          hintStyle: const TextStyle(
            color: Color(0xff383838),
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 0.4)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black, width: 0.4))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      )));

  static final darkTheme = ThemeData(
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        background: darkBackground,
      ),
      scaffoldBackgroundColor: darkBackground,
      brightness: Brightness.dark,
      fontFamily: 'Satoshi',
      sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
          activeTrackColor: const Color(0xffB7B7B7),
          inactiveTrackColor: Colors.grey.withOpacity(0.3),
          thumbColor: const Color(0xffB7B7B7)),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          hintStyle: const TextStyle(
            color: Color(0xffA7A7A7),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: const EdgeInsets.all(30),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 0.4)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 0.4))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      )));
}
