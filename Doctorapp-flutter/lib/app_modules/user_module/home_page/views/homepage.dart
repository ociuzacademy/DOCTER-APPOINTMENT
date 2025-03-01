// app_modules/user_module/home_page/views/homepage.dart
import 'package:carousel_slider_x/carousel_slider_x.dart';
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/user_module/home_page/widgets.dart/category_card.dart';
import 'package:doctor_booking_/app_modules/user_module/home_page/widgets.dart/doctors_card.dart';
import 'package:doctor_booking_/app_modules/user_module/search_section/views/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        title: const Text(
          "SAT, 25 JUN 2026",
          style: TextStyle(
            color: AppColors.appGray,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        actions: [
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.appGreen, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                bottom: 8,
                left: 8,
                right: 8,
                top: 8,
              ),
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
          // Top Container Beneath the AppBar
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/doctorTwo.jpg"),
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: AppColors.appGray,
                            width: 2.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hello, Bocchi!",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.primarySwatch,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: Color.fromRGBO(10, 243, 80, 1),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: AppColors.appWhite,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "85% Score",
                                        style: TextStyle(
                                          color: AppColors.appWhite,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.appYellow,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: Color.fromRGBO(243, 177, 10, 1),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: AppColors.appWhite,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Pro Member",
                                        style: TextStyle(
                                          color: AppColors.appWhite,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.black),
                          SizedBox(width: 10),
                          Expanded(child: Text("Search anything...")),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Find a Doctor For Your Health Problem",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                      iconimage: 'assets/icons/general.png',
                      labelText: '  General\nPhysician',
                      iconimgHeight: 55,
                      iconimgWidth: 55,
                      fontsize: 13,
                    ),
                    SizedBox(width: 10),
                    CategoryCard(
                      iconimage: 'assets/icons/skin&hair.png',
                      labelText: 'Skin & Hair\n',
                      iconimgHeight: 55,
                      iconimgWidth: 55,
                      fontsize: 13,
                    ),
                    SizedBox(width: 10), // Add spacing between cards
                    CategoryCard(
                      iconimage: 'assets/icons/ff.png',
                      labelText: '  Women\n   Health    ',
                      iconimgHeight: 55,
                      iconimgWidth: 55,
                      fontsize: 13,
                    ),
                    SizedBox(width: 10), // Add spacing between cards
                    CategoryCard(
                      iconimage: 'assets/icons/gg.png',
                      labelText: ' Dental \n  Care',
                      iconimgHeight: 55,
                      iconimgWidth: 55,
                      fontsize: 13,
                    ),
                    SizedBox(width: 10),
                    CategoryCard(
                      iconimage: 'assets/icons/kk.png',
                      labelText: '    Child\nSpecialist',
                      iconimgHeight: 55,
                      iconimgWidth: 55,
                      fontsize: 13,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Top Doctors Carousel
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Top Doctors",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CarouselSlider.builder(
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int realIndex) =>
                      const DesignCard(
                title: "Discover the latest nordic style trends",
                category: "DECORATION",
                imageUrl: "assets/images/doctor_image.jpg",
                isFeatured: true,
              ),
              options: const CarouselOptions(
                autoPlay: true,
                height: 200,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 3),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
