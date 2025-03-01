// main.dart
import 'package:doctor_booking_/app_localdata/isar_functions/isar_functions.dart';
import 'package:doctor_booking_/app_modules/doctor_module/Doctor_home/bloc/dr_list_bloc.dart';
import 'package:doctor_booking_/app_modules/login_section/views/login_page.dart';
import 'package:doctor_booking_/app_modules/register_section/bloc/register_bloc.dart';
import 'package:doctor_booking_/app_modules/user_module/profile_section/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_modules/login_section/bloc/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await IsarServices().openDB();
  String? initialRoute =
      await IsarServices().isLoggedIn() ? "/mainhomepage" : "/splashHome";

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => DrListBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
