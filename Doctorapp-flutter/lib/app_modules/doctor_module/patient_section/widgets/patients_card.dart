// app_modules/doctor_module/patient_section/widgets/patients_card.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class PatientCardWidgets extends StatelessWidget {
  final String name;
  final String specialization;
  final String time;
  final String age;
  final String image;
  final VoidCallback onTapProfile;
  final VoidCallback onTapCall;
  final VoidCallback onTapMessage;

  const PatientCardWidgets({
    super.key,
    required this.name,
    required this.specialization,
    required this.time,
    required this.age,
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
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: AppColors.appGreen,
                        width: 2.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          age,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          specialization,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const Divider(),
                        Text(time),
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
                bottom: 45,
                left: 270,
                child: Column(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 45,
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
                          onPressed: onTapMessage, // Attach onTap for message
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
