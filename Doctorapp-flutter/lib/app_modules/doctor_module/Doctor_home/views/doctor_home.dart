// app_modules/doctor_module/Doctor_home/views/doctor_home.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/user_module/doctor_details.dart/views/Doctor_details.dart';
import 'package:doctor_booking_/app_modules/user_module/doctors_section/widgets/AppointmentCard.dart';
import 'package:doctor_booking_/app_modules/user_module/home_page/widgets.dart/doctors_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider_x/carousel_slider_x.dart';

import '../bloc/dr_list_bloc.dart';

class DoctorHomePage extends StatefulWidget {
  final ScrollController scrollController;
  const DoctorHomePage({
    super.key,
    required this.scrollController,
  });

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  void initState() {
    super.initState();
    _fetchDoctorList();

    // Adding a listener to the ScrollController to detect scroll direction
    widget.scrollController.addListener(_scrollListener);
  }

  // Scroll listener to detect the scroll direction
  void _scrollListener() {
    if (widget.scrollController.position.pixels == 0) {}
    if (widget.scrollController.position.pixels ==
        widget.scrollController.position.maxScrollExtent) {}
  }

  @override
  void dispose() {
    // Don't forget to remove the listener when disposing the widget
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        title: Text(
          _getFormattedDate(),
          style: TextStyle(
            color: AppColors.appGray,
            fontWeight: FontWeight.bold,
            fontSize: textScale * 15,
          ),
        ),
        actions: [
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.appGreen, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications, color: AppColors.appGreen),
            ),
          ),
        ],
        elevation: 0,
      ),
      backgroundColor: AppColors.appBackgroundColour,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.appWhite,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(38),
                bottomRight: Radius.circular(38),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/doctorTwo.jpg"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: AppColors.appGray, width: 2.0),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Bocchi!",
                        style: TextStyle(
                          fontSize: textScale * 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primarySwatch,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color.fromRGBO(10, 243, 80, 1),
                                width: 1.0,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.star,
                                      color: AppColors.appWhite, size: 16),
                                  SizedBox(width: 5),
                                  Text(
                                    "85% Score",
                                    style: TextStyle(
                                      color: AppColors.appWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.appYellow,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color.fromRGBO(243, 177, 10, 1),
                                width: 1.0,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.star,
                                      color: AppColors.appWhite, size: 16),
                                  SizedBox(width: 5),
                                  Text(
                                    "Pro Member",
                                    style: TextStyle(
                                      color: AppColors.appWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Top Doctors",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<DrListBloc, DrListState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox(),
                loding: () => const Center(child: CircularProgressIndicator()),
                error: (error) => Center(child: Text("Error: $error")),
                success: (response) {
                  if (response.doctors == null || response.doctors!.isEmpty) {
                    return const Center(child: Text("No doctors available."));
                  }

                  return CarouselSlider.builder(
                    itemCount: response.doctors!.length,
                    itemBuilder: (context, itemIndex, _) {
                      final doctor = response.doctors![itemIndex];
                      return DesignCard(
                        title: doctor.name ?? "Unknown",
                        category: doctor.specialization ?? "General",
                        imageUrl: doctor.image
                                ?.replaceFirst('http://localhost:8001/', '') ??
                            '',
                        isFeatured: true,
                      );
                    },
                    options: const CarouselOptions(
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds: 3),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Doctors",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<DrListBloc, DrListState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loding: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error) => Center(child: Text("Error: $error")),
                  success: (response) {
                    if (response.doctors == null || response.doctors!.isEmpty) {
                      return const Center(
                          child: Text("No appointments available."));
                    }
                    return ListView.builder(
                      controller: widget.scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: response.doctors!.length,
                      itemBuilder: (context, index) {
                        final doctor = response.doctors![index];
                        return AppointmentCard(
                          name: doctor.name ?? "Unknown",
                          specialization: doctor.specialization ?? "General",
                          time: "Time unavailable",
                          image: doctor.image?.replaceFirst(
                                  'http://localhost:8001/', '') ??
                              '',
                          onTapCall: () {},
                          onTapMessage: () {},
                          onTapProfile: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const DoctorDetailsPage(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 65),
        ],
      ),
    );
  }

  void _fetchDoctorList() {
    final drListBloc = BlocProvider.of<DrListBloc>(context);
    drListBloc.add(const DrListEvent.drList());
  }

  String _getFormattedDate() {
    final now = DateTime.now();
    return "${now.weekday}, ${now.day} ${now.month} ${now.year}";
  }
}
