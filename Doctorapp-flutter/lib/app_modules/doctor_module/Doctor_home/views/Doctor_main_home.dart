// app_modules/doctor_module/Doctor_home/views/Doctor_main_home.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/doctor_module/Doctor_home/views/doctor_home.dart';
import 'package:doctor_booking_/app_modules/doctor_module/patient_profile_screen/views/patient_profile_page.dart';
import 'package:doctor_booking_/app_modules/doctor_module/patient_section/views/patient_list.dart';
import 'package:doctor_booking_/app_modules/doctor_module/user_appointment/views/appointment_list_page.dart';
import 'package:doctor_booking_/app_modules/user_module/profile_section/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DoctorMainHomeScreen extends StatefulWidget {
  const DoctorMainHomeScreen({super.key});

  @override
  _DoctorMainHomeScreenState createState() => _DoctorMainHomeScreenState();
}

class _DoctorMainHomeScreenState extends State<DoctorMainHomeScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;
  final double _iconSize = 24;
  final double _cardWidth = 52;
  bool _isBottomBarVisible = true;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
      keepPage: true,
    );
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
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

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isBottomBarVisible) {
        setState(() {
          _isBottomBarVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isBottomBarVisible) {
        setState(() {
          _isBottomBarVisible = true;
        });
      }
    }
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.bar_chart,
    Icons.chat,
    Icons.receipt_long,
    Icons.person,
  ];

  List<Widget> get _widgetOptions => [
        DoctorHomePage(scrollController: _scrollController),
        PatientListPage(),
        const PatientProfilePage(),
        AppointmentsPage(),
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
    final size = MediaQuery.of(context).size;
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
            child: AnimatedOpacity(
              opacity: _isBottomBarVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
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
                      left: _selectedIndex * (_cardWidth + 18) + 12,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          width: size.width * 0.12,
                          height: size.height * 0.06,
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
          ),
        ],
      ),
    );
  }
}
