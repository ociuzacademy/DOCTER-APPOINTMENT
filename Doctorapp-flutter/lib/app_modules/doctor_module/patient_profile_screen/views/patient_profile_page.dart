// app_modules/doctor_module/patient_profile_screen/views/patient_profile_page.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/user_module/booking_appointment/views/booking_appointment.dart';
import 'package:doctor_booking_/main_widgets/app_buttons.dart';
import 'package:flutter/material.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColour,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColour,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'patient Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 320,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/grf.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'shyam',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '68',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.appMainColour.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Medical Records',
                              style: TextStyle(
                                  color: AppColors.appMainColour, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Most cardiovascular diseases can be prevented by \naddressing behavioural and environmental risk factors\n such as tobacco use, unhealthy diet and obesity, physical\n inactivity, harmful use of alcohol and air pollution.',
                              style: TextStyle(
                                color: AppColors.appMainColour,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.fade,
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'It Services Companies - Quick And Easily found at Ask!ly! Services Companies - Quick And Easily...',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ButtonWidget(
                text: const Text(
                  'Book Appointment',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                buttoncolor: AppColors.appMainColour,
                textColor: AppColors.appWhite,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BookAppointmentScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
