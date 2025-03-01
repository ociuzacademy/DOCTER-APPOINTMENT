// app_modules/user_module/home_page/widgets.dart/doctors_card.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_constants/app_urls.dart';
import 'package:flutter/material.dart';

class DesignCard extends StatelessWidget {
  final String title;
  final String category;
  final String imageUrl;
  final bool isFeatured;

  const DesignCard({
    super.key,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.isFeatured,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imagurls + imageUrl,
                alignment: Alignment.topCenter,
                height: 200, // Ensure image height matches the container
                width: double.infinity,
                fit: BoxFit.cover, // Adjust the image to cover the container
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appGreen,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.broken_image,
                    color: AppColors.appGreen,
                    size: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.appGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  isFeatured ? 'FEATURED' : category.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.appWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.8),
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
