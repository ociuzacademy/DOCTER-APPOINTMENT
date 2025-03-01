// app_modules/register_section/bloc/register_bloc.dart
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:doctor_booking_/app_modules/register_section/model/userRegister_Model.dart';
import 'package:doctor_booking_/app_modules/register_section/service/doctorReg_service.dart.dart';
import 'package:doctor_booking_/app_modules/register_section/service/userRegister_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<RegisterEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(const RegisterState.loding());

        // Handling user registration
        if (event is _UserRegister) {
          const String utype = 'user';
          final response = await userRegister(
            name: event.name,
            age: event.age,
            gmail: event.email,
            phoneNo: event.phoneno,
            paswd: event.password,
            utype: utype,
          );
          emit(RegisterState.success(response: response));
        } else if (event is _DoctorRegister) {
          const String utype = 'doctor';
          const String status = 'pending';
          // If doctorRegister expects a File, pass the File object
          final response = await drRegister(
            name: event.name,
            phonenumber: event.phonenumber,
            specialization: event.specialization,
            email: event.email,
            qualification: event.qualification,
            age: event.age,
            experience: event.experience,
            image: event.image,
            doctorfee: event.doctorfee,
            password: event.password,
            utype: utype,
            status: status,
          );
          emit(RegisterState.success(response: response));
        }
      } catch (e) {
        emit(RegisterState.error(error: e.toString()));
      }
    });
  }
}
