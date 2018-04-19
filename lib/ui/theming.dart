import 'package:flutter/material.dart';

final primaryLightColour = new Color.fromRGBO(153, 61, 96, 1.0);
final primaryDarkColour = new Color.fromRGBO(133, 34, 77, 1.0);
final secondaryLightColour = new Color.fromRGBO(153, 61, 96, 0.3);

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light
);

final ThemeData kAndroidTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400]
);

