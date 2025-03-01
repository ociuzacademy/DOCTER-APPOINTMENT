// app_modules/doctors_section/widgets/tab_slider.dart

// import 'package:doctor_booking_app/app_config/colors/app_colors.dart';
// import 'package:doctor_booking_app/app_modules/doctors_section/views/doctors_list_page.dart';
// import 'package:flutter/material.dart';

// class RequestMainPage extends StatefulWidget {
//   const RequestMainPage({super.key});

//   @override
//   State<RequestMainPage> createState() => _RequestMainPageState();
// }

// class _RequestMainPageState extends State<RequestMainPage>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;

//   @override
//   void initState() {
//     super.initState();
//     // Update TabController length to 2 for two tabs
//     tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.appBackgroundColour,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: AppColors.appWhite,
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 20,
//                 top: 10,
//               ),
//               child: Container(
//                 height: MediaQuery.sizeOf(context).height * 0.05,
//                 width: MediaQuery.sizeOf(context).width * 0.9,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: TabBar(
//                   labelColor: AppColors.appWhite,
//                   indicator: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: AppColors.appGreen),
//                   controller: tabController,
//                   labelPadding: const EdgeInsets.symmetric(horizontal: 0),
//                   tabs: const [
//                     Tab(
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 65),
//                         child: Row(
//                           children: [
//                             Text('Today'),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 0),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(left: 70),
//                             child: Tab(
//                               child: Text('All'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//                 child: TabBarView(
//               controller: tabController,
//               children: [
//                 DoctorsListPage(
//                   isToday: true,
//                 ),
//                 DoctorsListPage(
//                   isToday: false,
//                 ),
//               ],
//             )),
//           ],
//         ));
//   }

//   @override
//   void dispose() {
//     // Dispose of the TabController when the widget is disposed
//     tabController.dispose();
//     super.dispose();
//   }
// }
