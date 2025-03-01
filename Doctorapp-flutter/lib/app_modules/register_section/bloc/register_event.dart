// app_modules/register_section/bloc/register_event.dart
part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.userRegister({
    required String name,
    required String email,
    required String age,
    required String phoneno,
    required String password,
  }) = _UserRegister;
  const factory RegisterEvent.doctorRegister({
    required String name,
    required String phonenumber,
    required String specialization,
    required String email,
    required String qualification,
    required String age,
    required String phoneno,
    required String experience,
    required String status,
    required File image,
    required String doctorfee,
    required String password,
  }) = _DoctorRegister;
}
