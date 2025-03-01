// app_modules/doctor_module/patient_section/views/patient_list.dart
import 'package:doctor_booking_/app_modules/doctor_module/patient_section/widgets/patients_card.dart';
import 'package:doctor_booking_/app_modules/user_module/doctor_details.dart/views/Doctor_details.dart';
import 'package:flutter/material.dart';

class PatientListPage extends StatelessWidget {
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
      'name': 'Devika ',
      'age': '24',
      'specialization': 'fever',
      'time': 'blood check to know which fever',
      'image': "assets/images/pereson1.jpeg",
    },
    {
      'name': 'sree',
      'age': '24',
      'specialization': 'fever',
      'time': 'one weak medicine consume ',
      'image': "assets/images/pereson1.jpeg",
    },
    {
      'name': 'geno',
      'age': '24',
      'specialization': 'leg broken',
      'time': '6 months treatment',
      'image': "assets/images/pereson1.jpeg",
    },
  ];

  PatientListPage({
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
                return PatientCardWidgets(
                  name: appointment['name']!,
                  specialization: appointment['specialization']!,
                  time: appointment['time']!,
                  image: appointment['image']!,
                  age: appointment['age']!,
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
