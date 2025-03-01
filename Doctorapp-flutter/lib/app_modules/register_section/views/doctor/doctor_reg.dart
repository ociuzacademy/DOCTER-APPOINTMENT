// app_modules/register_section/views/doctor/doctor_reg.dart
import 'dart:io';

import 'package:doctor_booking_/app_config/colors/app_colors.dart';
import 'package:doctor_booking_/app_modules/login_section/views/login_page.dart';
import 'package:doctor_booking_/app_modules/register_section/bloc/register_bloc.dart';
import 'package:doctor_booking_/main_widgets/app_buttons.dart';
import 'package:doctor_booking_/main_widgets/custome_textField.dart';
import 'package:doctor_booking_/main_widgets/image_picker.dart';
import 'package:doctor_booking_/main_widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class DoctorRegistrationPage extends StatefulWidget {
  const DoctorRegistrationPage({super.key});

  @override
  _DoctorRegistrationPageState createState() => _DoctorRegistrationPageState();
}

class _DoctorRegistrationPageState extends State<DoctorRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _consultancyfeeController =
      TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  File? _selectedImage;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _qualificationController.dispose();
    _specializationController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: AppColors.appWhite,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                controller: _nameController,
                labelText: 'Name',
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person),
                fillColor: true,
                readOnly: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your name'
                    : null,
              ),
              SizedBox(height: screenHeight * 0.02),
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
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                controller: _qualificationController,
                labelText: 'Qualification',
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.school),
                fillColor: true,
                readOnly: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your qualification'
                    : null,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                controller: _specializationController,
                labelText: 'Specialization',
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.work),
                fillColor: true,
                readOnly: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your specialization'
                    : null,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                controller: _experienceController,
                labelText: 'Experience',
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.calendar_today),
                fillColor: true,
                readOnly: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your experience'
                    : null,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                controller: _consultancyfeeController,
                labelText: 'Consultancy Fee',
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.calendar_today),
                fillColor: true,
                readOnly: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your consultancy fee'
                    : null,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                controller: _gmailController,
                labelText: 'Gmail',
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.calendar_today),
                fillColor: true,
                readOnly: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your Gmail'
                    : null,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                controller: _ageController,
                labelText: 'Age',
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.calendar_today),
                fillColor: true,
                readOnly: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your age'
                    : null,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.calendar_today),
                fillColor: true,
                readOnly: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter your password'
                    : null,
              ),
              SizedBox(height: screenHeight * 0.02),
              AddPhotoWidget(onImagePicked: _onImagePicked),
              SizedBox(height: screenHeight * 0.03),
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
                        // showCustomSnackBar(
                        //   context: context,
                        //   message: error,
                        //   icon: Icons.error,
                        //   iconColor: Colors.white,
                        //   textColor: Colors.white,
                        //   backgroundColor: Colors.red,
                        // );
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
                            durationInSeconds: 3,
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
                            message: 'User Already Registered With This Email',
                            icon: Icons.error,
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            backgroundColor: Colors.red,
                            durationInSeconds: 3,
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
                        : Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: textScale * 20,
                              color: Colors.white,
                            ),
                          ),
                    onPressed: _isLoading
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final registerBloc =
                                  BlocProvider.of<RegisterBloc>(context);
                              registerBloc.add(
                                RegisterEvent.doctorRegister(
                                  name: _nameController.text.trim(),
                                  phoneno: '',
                                  qualification:
                                      _qualificationController.text.trim(),
                                  specialization:
                                      _specializationController.text.trim(),
                                  experience: _experienceController.text.trim(),
                                  email: _gmailController.text.trim(),
                                  age: _ageController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  phonenumber: _phoneController.text.trim(),
                                  doctorfee:
                                      _consultancyfeeController.text.trim(),
                                  image: _selectedImage!,
                                  status: '',
                                ),
                              );
                            }
                          },
                    buttoncolor: AppColors.appMainColour,
                    textColor: AppColors.appWhite,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.072),
            ],
          ),
        ),
      ),
    );
  }

  void _onImagePicked(XFile? image) {
    setState(() {
      _selectedImage = File(image!.path);
    });
  }
}
