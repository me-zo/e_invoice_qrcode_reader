import 'package:flutter/material.dart';

class AppTheme {
  //DARK THEME
  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 50,
    ),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    ),
  );

//primaryColor changes the background color of user card in drawer

//canvasColor changes the background color of all scaffolds

//cardColor changes the background color of cards

//to change the color and size of all icons across the whole app
// static IconThemeData iconThemeData = const IconThemeData().copyWith(
//   color: Colors.lightBlueAccent,
// );
}
