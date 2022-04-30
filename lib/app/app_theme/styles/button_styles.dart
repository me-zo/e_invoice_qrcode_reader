import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle primary(ColorScheme colorScheme) => ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(8),
        ),
        elevation: MaterialStateProperty.all(3),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(colorScheme.secondary),
        foregroundColor: MaterialStateProperty.all(colorScheme.tertiary),
      );

  static ButtonStyle red({bool outlined = false}) => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          outlined ? Colors.transparent : Colors.red,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          outlined ? Colors.red : Colors.white,
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(8),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
