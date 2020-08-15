import 'package:flutter/material.dart';

final ThemeData defaultTheme = ThemeData(

// Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.lightGreen[200],
    accentColor: Colors.lightGreen[600],

// Define the default font family.
    fontFamily: 'Georgia',

// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

      bodyText1: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
      bodyText2: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
    ),

);

const TextStyle foodText = TextStyle(fontSize: 1024.0, fontWeight: FontWeight.w600);

final Color foodInfoViewBackgroundColor = Colors.lightGreen[50];

final ListTileTheme defaultListTileTheme = ListTileTheme(
  selectedColor: Colors.lightGreen[700],
);