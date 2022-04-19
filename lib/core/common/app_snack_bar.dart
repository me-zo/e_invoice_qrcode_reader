import 'dart:developer';

import 'package:flutter/material.dart';

import '../localization/app_localization.dart';

mixin AppSnackBar {

  void errorSnackBar(BuildContext context, {String message = ""}) {
    ScaffoldMessenger.of(context).showSnackBar(_snackBarWidget(
      context,
      message: message,
      backgroundColor: Colors.red.shade900.withOpacity(0.9),
    ));
  }

  void successSnackBar(BuildContext context, {String? resourceKey}) {
    ScaffoldMessenger.of(context).showSnackBar(_snackBarWidget(
      context,
      message: resourceKey ?? "success_message",
      backgroundColor: Colors.greenAccent.withOpacity(0.9),
    ));
  }

  void notificationSnackBar(BuildContext context, {String message = ""}) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(_snackBarWidget(
      context,
      message: message,
      backgroundColor: theme.colorScheme.primary,
    ));
  }

  SnackBar _snackBarWidget(BuildContext context, {
    required String message,
    required Color backgroundColor,
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return SnackBar(
        content: Text(
          AppLocalizations.of(context)!.translate(message),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      );
  }
}
