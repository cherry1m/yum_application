import 'package:flutter/material.dart';

ThemeData get light => ThemeData(
    scaffoldBackgroundColor: const Color(0xffE8EEF2),
    useMaterial3: false,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Color(0xffFCD5C5),
        fontFamily: "PartialSansKR",
        fontSize: 64,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
          fontSize: 32, fontWeight: FontWeight.w700, fontFamily: "Pretendard"),
      titleSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: "Pretendard",
          color: Color(0xffFFFFFF)),
      displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: "Pretendard",
          color: Color(0xff67401C)),
      displayMedium: TextStyle(
          color: Color(0xff67401C),
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: "Pretendard"),
      labelLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: "Pretendard",
          color: Color(0xff67401C)),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "Pretendard",
        color: Color(0xffB99C81),
      ),
    ),
    colorScheme: const ColorScheme.light(
        primary: Color(0xff67401C),
        secondary: Color(0xffB99C81),
        onPrimaryContainer: Color(0xffffffff),
        onSecondaryContainer: Color(0xffd7d7d7),
        tertiary: Color(0xffFDEFE3)));

ThemeData get dark => ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xff000000),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Color(0xfff272727),
          fontFamily: "PartialSansKR",
          fontSize: 64,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard"),
        titleSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        displayLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard"),
        displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        labelLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "Pretendard",
            color: Color(0xffFFFFFF)),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Pretendard",
          color: Color(0xffA2A2A2),
        )),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xffF89B4C),
        secondary: Color(0xffFDE1C9),
        onPrimaryContainer: Color(0xff3A3A3A),
        onSecondaryContainer: Color(0xff686868),
        tertiary: Color(0xff272727)));
