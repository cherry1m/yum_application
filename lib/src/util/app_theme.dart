import 'package:flutter/material.dart';

ThemeData get light => ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xffE8EEF2),
    textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard"),
        titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "Pretendard"),
        displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard")),
    colorScheme: const ColorScheme.light(
        primary: Color(0xffFF4920),
        secondary: Color(0xff000000),
        onPrimaryContainer: Color(0xffffffff),
        onSecondaryContainer: Color(0xffd7d7d7)));

ThemeData get dark => ThemeData(
    useMaterial3: false,
    textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard"),
        titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "Pretendard"),
        displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard")),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xffFF4920),
        secondary: Color(0xffFFFFFF),
        onPrimaryContainer: Color(0xff323232),
        onSecondaryContainer: Color(0xff686868)));
