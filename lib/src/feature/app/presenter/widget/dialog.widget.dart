import 'package:flutter/material.dart';
import 'package:surveyami/src/util/string.util.dart';

showConfirmDialog(
  BuildContext context,
  String? title,
  String description,
  String confirmBtnTxt,
  String cancelBtnTxt,
  Function onConfirmClicked,
) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      cancelBtnTxt.toTitleCase(),
      style: const TextStyle(color: Colors.red),
    ),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );
  Widget confirmButton = ElevatedButton(
    child: Text(confirmBtnTxt.toTitleCase()),
    onPressed: () {
      onConfirmClicked.call();
      Navigator.of(context).pop(); // dismiss dialog
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: title == null ? null : Text(title.toTitleCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
    content: Text(description.toCapitalize()),
    actions: [
      cancelButton,
      confirmButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showInfoDialog(BuildContext context, String? title, String description, String confirmBtnTxt) {
  // set up the buttons

  Widget confirmButton = ElevatedButton(
    child: Text(confirmBtnTxt.toTitleCase()),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: title == null ? null : Text(title.toTitleCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
    content: Text(
      description.toCapitalize(),
      style: const TextStyle(height: 1.5),
    ),
    actions: [
      confirmButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
