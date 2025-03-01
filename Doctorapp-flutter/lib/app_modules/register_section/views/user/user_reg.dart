// app_modules/register_section/views/user/user_reg.dart
import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/login_section/views/login_page.dart';
import 'package:doctor_booking_/app_modules/register_section/bloc/register_bloc.dart';
import 'package:doctor_booking_/main_widgets/app_buttons.dart';
import 'package:doctor_booking_/main_widgets/custome_textField.dart';
import 'package:doctor_booking_/main_widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({super.key});

  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for TextFields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.appWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: screenHeight * 0.02),
                  // Name TextField
                  CustomTextField(
                    controller: _nameController,
                    labelText: 'Name',
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(Icons.person),
                    fillColor: true,
                    readOnly: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Email TextField
                  CustomTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                    fillColor: true,
                    readOnly: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Age TextField
                  CustomTextField(
                    controller: _ageController,
                    labelText: 'Age',
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.calendar_month),
                    fillColor: true,
                    readOnly: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      if (int.tryParse(value) == null ||
                          int.parse(value) <= 0) {
                        return 'Please enter a valid age';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Mobile TextField
                  CustomTextField(
                    controller: _phoneController,
                    labelText: 'Mobile',
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone),
                    fillColor: true,
                    readOnly: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Password TextField
                  CustomTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock_outline),
                    fillColor: true,
                    readOnly: false,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Sign-up Button
                  Center(
                    child: BlocListener<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        state.when(
                          initial: () {},
                          loding: () {
                            setState(() {
                              _isLoading = true;
                            });
                          },
                          error: (error) {
                            setState(() {
                              _isLoading = false;
                            });
                            showCustomSnackBar(
                              context: context,
                              message: error,
                              icon: Icons.error,
                              iconColor: Colors.white,
                              textColor: Colors.white,
                              backgroundColor: Colors.red,
                            );
                          },
                          success: (response) {
                            setState(() {
                              _isLoading = false;
                            });
                            if (response.status == 'success') {
                              showCustomSnackBar(
                                context: context,
                                message: 'Registration successful!',
                                icon: Icons.check_circle,
                                iconColor: Colors.white,
                                textColor: Colors.white,
                                backgroundColor: Colors.green,
                              ).then((_) {
                                // Navigate to BookAppointmentScreen after successful registration
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                  (route) => false,
                                );
                              });
                            } else if (response.status == 'failed' &&
                                response.message == 'Email already exists') {
                              showCustomSnackBar(
                                context: context,
                                message:
                                    'User Already Registered With This Email',
                                icon: Icons.error,
                                iconColor: Colors.white,
                                textColor: Colors.white,
                                backgroundColor: Colors.red,
                              );
                            }
                          },
                        );
                      },
                      child: ButtonWidget(
                        text: _isLoading
                            ? SizedBox(
                                height: screenHeight * 0.03,
                                width: screenWidth * 0.07,
                                child: const CircularProgressIndicator(
                                  color: AppColors.appWhite,
                                  backgroundColor: AppColors.appMainColour,
                                ),
                              )
                            : const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                        onPressed: _isLoading
                            ? null
                            : () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  final registerBloc =
                                      BlocProvider.of<RegisterBloc>(context);
                                  registerBloc.add(
                                    RegisterEvent.userRegister(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      age: _ageController.text,
                                      phoneno: _phoneController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                                }
                              },
                        buttoncolor: AppColors.appMainColour,
                        textColor: AppColors.appWhite,
                      ),
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

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
