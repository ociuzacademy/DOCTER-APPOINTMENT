// app_modules/doctor_module/user_appointment/widgets/appointment_card.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/doctor_module/user_appointment/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class AppointmentBookedCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String time;
  final String image;
  final VoidCallback onTap;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const AppointmentBookedCard({
    super.key,
    required this.name,
    required this.specialization,
    required this.time,
    required this.image,
    required this.onTap,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.appGreen, width: 1.5),
        ),
        elevation: 4,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 100),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              specialization,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  time,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonSamllWidget(
                        buttoncolor: AppColors.appGreen,
                        onPressed: onAccept,
                        text: "Accept",
                        textColor: AppColors.appWhite,
                      ),
                      const SizedBox(width: 20),
                      ButtonSamllWidget(
                        buttoncolor: AppColors.appRed,
                        onPressed: onReject,
                        text: "Reject",
                        textColor: AppColors.appWhite,
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 14,
              top: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  width: 85,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
