import 'package:flutter/material.dart';

ThemeData get light => ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xffE8EEF2),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard"),
        titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard"),
        titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "Pretendard"),
        displayLarge: TextStyle(
            color: Color(0xff67401C),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard"),
        displayMedium: TextStyle(
            color: Color(0xff67401C),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard")),
    colorScheme: const ColorScheme.light(
        primary: Color(0xff67401C),
        secondary: Color(0xff000000),
        onPrimaryContainer: Color(0xffffffff),
        onSecondaryContainer: Color(0xff67401C)));

ThemeData get dark => ThemeData(
    scaffoldBackgroundColor: const Color(0xFF000000),
    useMaterial3: false,
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard"),
        titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard"),
        titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "Pretendard"),
        displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard")),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xff67401C),
        secondary: Color(0xffFFFFFF),
        onPrimaryContainer: Color(0xff3a3a3a),
        onSecondaryContainer: Color(0xff686868)));
