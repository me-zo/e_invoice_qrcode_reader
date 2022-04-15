import 'package:flutter/material.dart';

import '../localization/app_localization.dart';

/// returns a template for an Alert dialog
///
/// takes a list of widgets [content] which are displayed in a column at the center of the dialog
///
/// takes a list of widgets [actions] which are displayed as actions on the alert dialog
///
mixin AppAlertDialog {

  static Widget alertDialog({
    required List<Widget> actions,
    required List<Widget> content,
  }) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding:
              content.isNotEmpty ? const EdgeInsets.all(10) : const EdgeInsets.all(0),
          actionsPadding:
              actions.isNotEmpty ? const EdgeInsets.all(10) : const EdgeInsets.all(0),
          actionsAlignment: MainAxisAlignment.center,
          actions: actions,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: content,
          ),
        ),
      ),
    );
  }

  /// alerts the user to confirm an action `Are You Sure?` alertdialog
  ///
  /// takes an optional String [message]
  ///
  /// with two required Voids [onCancel] and [onNext]
  static void confirmationDialog(
    BuildContext context, {
    String message = "",
    required VoidCallback onCancel,
    required VoidCallback onNext,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext diaContext) {
        return AlertDialog(
          titlePadding: const EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
          contentPadding: const EdgeInsets.only(top: 5, bottom: 15, left: 15, right: 15),
          title: Text(AppLocalizations.of(context)!.translate("are_you_sure"),
              textAlign: TextAlign.start),
          content: Text(
              message.isNotEmpty
                  ? message
                  : AppLocalizations.of(context)!.translate("are_you_sure_body"),
              textAlign: TextAlign.start),
          actions: [
            OutlinedButton(
              child: Text(AppLocalizations.of(context)!.translate("cancel"),),
              onPressed: onCancel,
            ),
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.translate("next"),),
              onPressed: onNext,
            ),
          ],
        );
      },
    );
  }
}
