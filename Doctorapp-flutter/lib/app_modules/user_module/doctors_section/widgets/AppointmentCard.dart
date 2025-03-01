// app_modules/user_module/doctors_section/widgets/AppointmentCard.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_constants/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppointmentCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String time;
  final String image;
  final VoidCallback onTapProfile;
  final VoidCallback onTapCall;
  final VoidCallback onTapMessage;

  const AppointmentCard({
    super.key,
    required this.name,
    required this.specialization,
    required this.time,
    required this.image,
    required this.onTapProfile,
    required this.onTapCall,
    required this.onTapMessage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapProfile,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: Border.all(
                        color: AppColors.appGreen,
                        width: 2.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: CachedNetworkImage(
                        imageUrl: imagurls + image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.appGreen,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: AppColors.appGreen,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.aod_outlined),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 4),
                        Text(
                          specialization,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.lock_clock),
                            Text(time),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
              const Positioned(
                bottom: 12,
                right: 250,
                child: Text(
                  'View Profile',
                  style: TextStyle(
                    color: AppColors.appGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Positioned(
                bottom: -3,
                left: 230,
                child: Row(
                  children: [
                    SizedBox(
                      height: 39,
                      width: 39,
                      child: Card(
                        color: AppColors.appGreen,
                        child: IconButton(
                          padding: const EdgeInsets.only(
                            right: 2,
                            left: 2,
                            top: 2,
                          ),
                          iconSize: 18,
                          icon: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                          onPressed: onTapCall,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 39,
                      width: 39,
                      child: Card(
                        color: AppColors.appYellow,
                        child: IconButton(
                          padding: const EdgeInsets.only(
                            right: 2,
                            left: 2,
                            top: 2,
                          ),
                          iconSize: 18,
                          icon: const Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                          onPressed: onTapMessage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
