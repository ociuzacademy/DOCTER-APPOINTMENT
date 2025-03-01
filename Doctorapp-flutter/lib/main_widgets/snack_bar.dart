// main_widgets/snack_bar.dart
import 'dart:async';
import 'package:flutter/material.dart';

Future<void> showCustomSnackBar({
  required BuildContext context,
  required String message,
  required IconData icon,
  required Color iconColor,
  required Color textColor,
  required Color backgroundColor,
  int durationInSeconds = 3,
}) async {
  final completer = Completer<void>();

  final screenWidth = MediaQuery.of(context).size.width;

  final snackBar = SnackBar(
    // shape: const StadiumBorder(),
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgroundColor,
    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.035, vertical: 20),
    duration: Duration(seconds: durationInSeconds),
    content: SizedBox(
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Message Text
          Flexible(
            child: Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Icon
          Icon(
            icon,
            color: iconColor,
          ),
        ],
      ),
    ),
  );

  // Display the SnackBar using ScaffoldMessenger
  ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((reason) {
    if (!completer.isCompleted) {
      completer.complete();
    }
  });

  return completer.future;
}
