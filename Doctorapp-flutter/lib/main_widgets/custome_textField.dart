// main_widgets/custome_textField.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool fillColor;
  final double borderRadius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    required this.fillColor,
    this.borderRadius = 10.0,
    this.suffixIcon,
    this.prefixIcon,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    // final responsiveData = ResponsiveData.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          readOnly: readOnly,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            filled: true,
            fillColor: AppColors.appBackgroundColour,
            //  labelText: labelText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.white),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
