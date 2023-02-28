import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:surveyami/src/util/string.util.dart';

/// * Dialog with option yes and no (add option for third button)
showConfirmDialog({
  required BuildContext context,
  bool canDismissable = true,
  String? title,
  required String description,
  required String confirmBtnTxt,
  required String cancelBtnTxt,
  required Function onConfirmClicked,
  String? thirdBtnTxt,
  Function? thirdConfirmClicked,
}) {
  /// * Cancel Button Like Cancel or No
  Widget cancelButton = TextButton(
    child: Text(cancelBtnTxt.toTitleCase(), style: const TextStyle(color: Colors.red)),
    onPressed: () => Navigator.of(context).pop(),
  );

  /// * Confirm Button Like Yes or Confirm
  Widget confirmButton = ElevatedButton(
    style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColorDark)),
    child: Text(confirmBtnTxt.toTitleCase()),
    onPressed: () {
      onConfirmClicked.call();
      Navigator.of(context).pop();
    },
  );

  /// * Third Option Button
  Widget thirdButton = ElevatedButton(
    child: Text((thirdBtnTxt ?? AppLocalizations.of(context)!.error).toTitleCase()),
    onPressed: () {
      if (thirdConfirmClicked != null) thirdConfirmClicked.call();
      Navigator.of(context).pop();
    },
  );

  /// * Setup Dialog
  AlertDialog alert = AlertDialog(
    title: title == null ? null : Text(title.toTitleCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
    content: Text(description.toCapitalize(), style: const TextStyle(height: 1.5)),
    actions: [
      cancelButton,
      if (thirdBtnTxt != null) thirdButton,
      confirmButton,
    ],
  );

  /// * Show Dialog
  _showDialog(context: context, barrierDismissible: canDismissable, builder: (context) => alert);
}

/// * Dialog with only ok button
showInfoDialog({
  required BuildContext context,
  String? title,
  required String description,
  required String confirmBtnTxt,
  Function? onConfirmClicked,
  bool canDismissable = true,
}) {
  /// * Confirm Button Like Yes or Confirm
  Widget confirmButton = ElevatedButton(
    child: Text(confirmBtnTxt.toTitleCase()),
    onPressed: () {
      if (onConfirmClicked != null) onConfirmClicked.call();
      Navigator.of(context).pop();
    },
  );

  /// * Setup Dialog
  AlertDialog alert = AlertDialog(
    title: title == null ? null : Text(title.toTitleCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
    content: Text(description.toCapitalize(), style: const TextStyle(height: 1.5)),
    actions: [confirmButton],
  );

  /// *  Show the dialog
  _showDialog(context: context, barrierDismissible: canDismissable, builder: (context) => alert);
}

_showDialog({
  required BuildContext context,
  required WidgetBuilder builder,
  required bool barrierDismissible,
}) {
  return showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: builder,
  );
}
