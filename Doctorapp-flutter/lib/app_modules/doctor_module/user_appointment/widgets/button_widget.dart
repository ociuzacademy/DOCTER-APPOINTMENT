// app_modules/doctor_module/user_appointment/widgets/button_widget.dart
import 'package:flutter/material.dart';

class ButtonSamllWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttoncolor;
  final Color textColor;

  const ButtonSamllWidget({
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
        minimumSize: const Size(65, 12),
        padding: const EdgeInsets.symmetric(vertical: 6),
        backgroundColor: buttoncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: textColor,
        ),
      ),
    );
  }
}
