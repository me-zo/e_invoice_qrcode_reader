import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle primary() => ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(8),
        ),
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  static ButtonStyle red({bool outlined = false}) => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          outlined ? Colors.grey[800]! : Colors.red,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          outlined ? Colors.red : Colors.white,
        ),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(
          color: outlined ? Colors.red : Colors.grey[800]!,
        )),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(8),
        ),
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
