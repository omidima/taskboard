import 'package:flutter/material.dart';

const primaryColors = Color(0xFF000000);
const secoundColor = Color(0xFFD9D9D9);
const deactiveColor = Color.fromARGB(255, 243, 243, 243);

ThemeData app_style = ThemeData(
    timePickerTheme: const TimePickerThemeData(
        dayPeriodTextStyle: TextStyle(
          fontWeight: FontWeight.normal,
        ),
        helpTextStyle: TextStyle(fontWeight: FontWeight.normal),
        hourMinuteTextStyle: TextStyle(fontWeight: FontWeight.normal)),
    fontFamily: 'Iran',
    primaryColor: primaryColors,
    secondaryHeaderColor: secoundColor);
