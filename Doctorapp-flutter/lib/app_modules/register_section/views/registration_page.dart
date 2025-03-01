// app_modules/register_section/views/registration_page.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/register_section/views/user/user_reg.dart';
import 'package:flutter/material.dart';

import 'doctor/doctor_reg.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.appWhite,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            // Background Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 500,
                child: Image.asset(
                  'assets/images/login_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Background elements like the back button and welcome text
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Welcome Back,\nSign up!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: Text(
                //     "Choose Your ",
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 28,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ],
            ),
            // Container with login form, placed at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: const SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        dividerHeight: 0,
                        labelColor: AppColors.appGreen,
                        tabs: [
                          Tab(
                            child: Text('USER'),
                          ),
                          Tab(
                            child: Text('DOCTOR'),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 450,
                        child: TabBarView(
                          children: [
                            UserRegistrationPage(),
                            DoctorRegistrationPage(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
