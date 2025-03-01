// app_modules/doctor_module/user_appointment/views/appointment_list_page.dart
import 'package:doctor_booking_/app_modules/doctor_module/user_appointment/widgets/appointment_card.dart';
import 'package:doctor_booking_/app_modules/user_module/doctor_details.dart/views/Doctor_details.dart';
import 'package:flutter/material.dart';

class AppointmentsPage extends StatelessWidget {
  final List<Map<String, String>> appointmentsToday = [
    {
      'name': 'Shyam',
      'specialization': '25',
      'time': '3:30 - 4:30 PM',
      'image': "assets/images/pereson1.jpeg",
    },
  ];

  final List<Map<String, String>> appointmentsAll = [
    {
      'name': 'Shyam',
      'specialization': '25',
      'time': '3:30 - 4:30 PM',
      'image': "assets/images/pereson1.jpeg",
    },
    {
      'name': 'jackson',
      'specialization': '31',
      'time': '3:30 - 4:30 PM',
      'image': "assets/images/pereson1.jpeg",
    },
    {
      'name': 'varun',
      'specialization': '18',
      'time': '4:30 - 6:30 PM',
      'image': "assets/images/pereson1.jpeg",
    },
  ];

  AppointmentsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Appoointment Booked',
          style: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appointmentsAll.length,
              itemBuilder: (context, index) {
                final appointment = appointmentsAll[index];
                return AppointmentBookedCard(
                  name: appointment['name']!,
                  specialization: appointment['specialization']!,
                  time: appointment['time']!,
                  image: appointment['image']!,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DoctorDetailsPage(),
                      ),
                    );
                  },
                  onAccept: () {},
                  onReject: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
