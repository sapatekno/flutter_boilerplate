import 'package:flutter/material.dart';
import 'package:surveyami/src/util/string.util.dart';

showConfirmDialog({
  required BuildContext context,
  String? title,
  required String description,
  required String confirmBtnTxt,
  required String cancelBtnTxt,
  required Function onConfirmClicked,
}) {
  /// * Cancel Button Like Cancel or No
  Widget cancelButton = TextButton(
    child: Text(cancelBtnTxt.toTitleCase(), style: const TextStyle(color: Colors.red)),
    onPressed: () => Navigator.of(context).pop(),
  );

  /// ? Confirm Button Like Yes or Confirm
  Widget confirmButton = ElevatedButton(
    child: Text(confirmBtnTxt.toTitleCase()),
    onPressed: () {
      onConfirmClicked.call();
      Navigator.of(context).pop();
    },
  );

  /// * Setup Dialog
  AlertDialog alert = AlertDialog(
    title: title == null ? null : Text(title.toTitleCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
    content: Text(description.toCapitalize(), style: const TextStyle(height: 1.5)),
    actions: [cancelButton, confirmButton],
  );

  /// * Show Dialog
  _showDialog(context: context, builder: (context) => alert);
}

showInfoDialog({
  required BuildContext context,
  String? title,
  required String description,
  required String confirmBtnTxt,
  Function? onConfirmClicked,
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
  _showDialog(context: context, builder: (context) => alert);
}

_showDialog({required BuildContext context, required WidgetBuilder builder}) {
  return showDialog(
    context: context,
    builder: builder,
  );
}
