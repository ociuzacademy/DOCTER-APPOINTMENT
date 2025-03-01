// app_modules/user_module/doctors_section/views/doctors_list_page.dart
import 'package:doctor_booking_/app_modules/user_module/doctor_details.dart/views/Doctor_details.dart';
import 'package:doctor_booking_/app_modules/user_module/doctors_section/widgets/AppointmentCard.dart';
import 'package:flutter/material.dart';

class DoctorsListPage extends StatelessWidget {
  final List<Map<String, String>> appointmentsToday = [
    {
      'name': 'Dr. Phos Gray',
      'specialization': 'General Medical Checkup',
      'time': '3:30 - 4:30 PM',
      'image': "assets/images/pereson1.jpeg",
    },
  ];

  final List<Map<String, String>> appointmentsAll = [
    {
      'name': 'Dr. Phos Gray',
      'specialization': 'General Medical Checkup',
      'time': '3:30 - 4:30 PM',
      'image': "assets/images/pereson1.jpeg",
    },
    {
      'name': 'Dr. Walter White',
      'specialization': 'Prescription Drug Confirmation',
      'time': '4:30 - 6:30 PM',
      'image': "assets/images/pereson1.jpeg",
    },
  ];

  DoctorsListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appointmentsAll.length,
              itemBuilder: (context, index) {
                final appointment = appointmentsAll[index];
                return AppointmentCard(
                  name: appointment['name']!,
                  specialization: appointment['specialization']!,
                  time: appointment['time']!,
                  image: appointment['image']!,
                  onTapCall: () {
                    // pp
                  },
                  onTapMessage: () {
                    //pp
                  },
                  onTapProfile: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DoctorDetailsPage(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
