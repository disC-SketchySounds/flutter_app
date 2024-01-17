import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSAlert {
  static final IOSAlert instance = IOSAlert._();

  IOSAlert._();

  void showCustomAlert({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onOkPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("OK"),
              onPressed: () {
                // Execute the callback action if provided
                onOkPressed?.call();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
