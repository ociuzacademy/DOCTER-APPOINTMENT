// app_modules/user_module/profile_section/views/profile_page.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/user_module/profile_section/bloc/profile_bloc.dart';
import 'package:doctor_booking_/app_modules/user_module/profile_section/widgets/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColour,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColour,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          ClipOval(
            child: SizedBox(
              width: screenWidth * 0.25,
              height: screenWidth * 0.25,
              child: Image.asset(
                'assets/images/doctorTwo.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          const Text(
            'Shamim Hossain',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            '@ShamimGraphics',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: screenHeight * 0.03),
          EditButtonWidget(
            text: 'Edit Profile',
            onPressed: () {},
            buttoncolor: AppColors.appGreen,
            textColor: AppColors.appWhite,
          ),
          SizedBox(height: screenHeight * 0.02),
          const Divider(
            indent: 20,
            endIndent: 25,
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: ListView(
              children: [
                _buildListItem(Icons.settings, 'Settings', screenHeight),
                _buildListItem(
                    Icons.credit_card, 'Billing Details', screenHeight),
                _buildListItem(Icons.people, 'User Management', screenHeight),
                const Divider(
                  indent: 20,
                  endIndent: 25,
                ),
                _buildListItem(Icons.info, 'Information', screenHeight),
                _buildListItem(Icons.logout, 'Log out', screenHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(IconData icon, String title, double screenHeight) {
    return ListTile(
      leading: Card(
          color: AppColors.appGreen,
          child: Padding(
            padding: EdgeInsets.all(screenHeight * 0.01), // Responsive padding
            child: Icon(
              icon,
              color: AppColors.appWhite,
            ),
          )),
      title: Text(title),
      trailing: Card(
        color: AppColors.appGreen,
        child: Padding(
          padding: EdgeInsets.all(screenHeight * 0.01), // Responsive padding
          child: const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.appWhite,
            size: 18,
          ),
        ),
      ),
      onTap: () {
        // Handle navigation
      },
    );
  }

  void apicall() {
    BlocProvider.of<ProfileBloc>(context).add(
      const ProfileEvent.profile(),
    );
  }
}
