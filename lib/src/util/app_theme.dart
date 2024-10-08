import 'package:flutter/material.dart';

ThemeData get light => ThemeData(
    scaffoldBackgroundColor: const Color(0xffE8EEF2),
    colorScheme: const ColorScheme.light(
        primary: Color(0xffFF4920),
        onPrimaryContainer: Color(0xffffffff),
        onSecondaryContainer: Color(0xffd7d7d7)));

ThemeData get dark => ThemeData(
    colorScheme: const ColorScheme.dark(
        primary: Color(0xffFF4920),
        onPrimaryContainer: Color(0xff323232),
        onSecondaryContainer: Color(0xff686868)));
