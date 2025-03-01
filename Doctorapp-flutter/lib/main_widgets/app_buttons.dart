// main_widgets/app_buttons.dart
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
   final Widget text; 
  final void Function()? onPressed;
  final Color buttoncolor;
  final Color textColor;

  const ButtonWidget({
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
        minimumSize: const Size(double.infinity, 12),
        padding: const EdgeInsets.symmetric(vertical: 8),
        backgroundColor: buttoncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: text,
    );
  }
}
