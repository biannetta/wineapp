import 'package:flutter/material.dart';

final primaryColour = new Color.fromRGBO(153, 61, 96, 1.0);
final secondaryColour = new Color.fromRGBO(153, 61, 96, 0.3);

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light
);

final ThemeData kAndroidTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400]
);

