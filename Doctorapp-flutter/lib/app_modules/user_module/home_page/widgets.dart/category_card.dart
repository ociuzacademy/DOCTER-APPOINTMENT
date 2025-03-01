// app_modules/home_page/widgets.dart/category_card.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconimage;
  final String labelText;
  final double iconimgHeight;
  final double iconimgWidth;
  final double fontsize;

  const CategoryCard({
    super.key,
    required this.iconimage,
    required this.labelText,
    required this.iconimgHeight,
    required this.iconimgWidth,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.appBlack, width: 1.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconimage,
              width: iconimgWidth,
              height: iconimgHeight,
              // color: AppColors.appGreen,
            ),
            const SizedBox(height: 4),
            Text(
              labelText,
              style: TextStyle(
                fontSize: fontsize,
                color: AppColors.appBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
