// app_modules/login_section/views/login_page.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/doctor_module/Doctor_home/views/Doctor_main_home.dart';
import 'package:doctor_booking_/app_modules/login_section/bloc/login_bloc.dart';
import 'package:doctor_booking_/app_modules/register_section/views/registration_page.dart';
import 'package:doctor_booking_/app_modules/user_module/home_page/views/user_main_home.dart';
import 'package:doctor_booking_/main_widgets/app_buttons.dart';
import 'package:doctor_booking_/main_widgets/custome_textField.dart';
import 'package:doctor_booking_/main_widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
              height: size.height * 0.65,
              child: Image.asset(
                'assets/images/login_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Welcome Text
          Positioned(
            top: size.height * 0.05,
            left: size.width * 0.05,
            child: Text(
              "Welcome Back,\nLogIn!",
              style: TextStyle(
                color: Colors.black,
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Login Form Container
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    // Email TextField
                    CustomTextField(
                      labelText: 'Email or mobile',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      fillColor: true,
                      readOnly: false,
                    ),
                    SizedBox(height: size.height * 0.02),
                    // Password TextField
                    CustomTextField(
                      labelText: 'Password',
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: const Icon(Icons.visibility_off),
                      fillColor: true,
                      readOnly: false,
                    ),
                    SizedBox(height: size.height * 0.01),
                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: AppColors.appGray,
                            fontSize: size.width * 0.035,
                          ),
                        ),
                      ),
                    ),
                    // Login Button with BlocListener
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        state.when(
                          initial: () => const SizedBox(),
                          loding: () => setState(() => isLoading = true),
                          error: (error) {
                            setState(() => isLoading = false);
                          },
                          success: (response) {
                            setState(() => isLoading = false);
                            if (response.data!.first.status == 'success') {
                              if (response.data!.first.utype == 'doctor') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const DoctorMainHomeScreen(),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const UserMainHomeScreen(),
                                  ),
                                );
                              }
                            } else {
                              showCustomSnackBar(
                                context: context,
                                message: 'Unknown user type!',
                                icon: Icons.warning,
                                iconColor: Colors.white,
                                textColor: Colors.white,
                                backgroundColor: Colors.red,
                              );
                            }
                          },
                        );
                      },
                      child: ButtonWidget(
                        text: isLoading
                            ? SizedBox(
                                height: size.height * 0.03,
                                width: size.width * 0.07,
                                child: const CircularProgressIndicator(
                                  color: AppColors.appWhite,
                                  backgroundColor: AppColors.appMainColour,
                                ),
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: Colors.white,
                                ),
                              ),
                        onPressed: () {
                          _handleLogin();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => const DoctorMainHomeScreen(),
                          //   ),
                          // );
                        },
                        buttoncolor: AppColors.appMainColour,
                        textColor: AppColors.appWhite,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      'or',
                      style: TextStyle(
                        color: AppColors.appGray,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: AppColors.appGray,
                            fontSize: size.width * 0.035,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const RegistrationPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: AppColors.appRed,
                              fontSize: size.width * 0.04,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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

  void _handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // if (email.isEmpty ||
    //     !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
    //         .hasMatch(email)) {
    //   showCustomSnackBar(
    //     context: context,
    //     message: 'Please enter a valid email address',
    //     icon: Icons.error,
    //     backgroundColor: Colors.red,
    //     iconColor: Colors.white,
    //     textColor: Colors.white,
    //   );
    //   return;
    // }

    // if (password.isEmpty || password.length < 6) {
    //   showCustomSnackBar(
    //     context: context,
    //     message: 'Password must be at least 6 characters',
    //     icon: Icons.error,
    //     backgroundColor: Colors.red,
    //     iconColor: Colors.white,
    //     textColor: Colors.white,
    //   );
    //   return;
    // }

    BlocProvider.of<LoginBloc>(context).add(
      LoginEvent.login(email: email, password: password),
    );
  }
}
