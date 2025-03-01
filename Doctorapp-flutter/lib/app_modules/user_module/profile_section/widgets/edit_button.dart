// app_modules/profile_section/widgets/edit_button.dart
import 'package:flutter/material.dart';

class EditButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttoncolor;
  final Color textColor;

  const EditButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttoncolor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 8,
        //  padding: const EdgeInsets.symmetric(vertical: 1),
        backgroundColor: buttoncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
