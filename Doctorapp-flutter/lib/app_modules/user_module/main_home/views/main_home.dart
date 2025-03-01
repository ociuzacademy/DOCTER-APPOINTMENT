// app_modules/main_home/views/main_home.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/user_module/booked_page/views/booked_page.dart';
import 'package:doctor_booking_/app_modules/user_module/doctor_details.dart/views/Doctor_details.dart';
import 'package:doctor_booking_/app_modules/user_module/doctors_section/views/doctors_list_page.dart';
import 'package:doctor_booking_/app_modules/user_module/home_page/views/homepage.dart';
import 'package:doctor_booking_/app_modules/user_module/profile_section/views/profile_page.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;
  final double _iconSize = 24;
  final double _cardWidth = 50;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.bar_chart,
    Icons.chat,
    Icons.receipt_long,
    Icons.person,
  ];

  List<Widget> get _widgetOptions => [
        const HomePage(),
        DoctorsListPage(),
        const DoctorDetailsPage(),
        BookedPage(),
        const ProfilePage(),
      ];

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: _iconSize),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: const BouncingScrollPhysics(),
            children: _widgetOptions,
          ),
          // Positioning the BottomNavigationBar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(47, 60, 51, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Stack(
                children: [
                  // Transparent card that slides over the icons
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    left: _selectedIndex * (_cardWidth + 18) + 9,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Container(
                        width: _cardWidth,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: AppColors.appGreen,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Bottom navigation bar with icons
                  Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      selectedItemColor: AppColors.appWhite,
                      unselectedItemColor: AppColors.appGray,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      currentIndex: _selectedIndex,
                      onTap: _onItemTapped,
                      items: List.generate(iconList.length, (index) {
                        return _buildBottomNavigationBarItem(
                            iconList[index], index);
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
