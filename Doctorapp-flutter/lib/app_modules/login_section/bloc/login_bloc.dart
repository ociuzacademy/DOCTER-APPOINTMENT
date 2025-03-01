// app_modules/login_section/bloc/login_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:doctor_booking_/app_localdata/isar_functions/isar_functions.dart';
import 'package:doctor_booking_/app_modules/login_section/model/logi_model.dart';
import 'package:doctor_booking_/app_modules/login_section/service/login_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(const LoginState.loding());
        if (event is _Login) {
          // Call login service
          final response = await login(
            gmail: event.email,
            paswd: event.password,
          );
          if (response.data!.first.status == 'success') {
            IsarServices().saveUserData(
              uid: response.data!.first.id.toString(),
              utype: response.data!.first.utype,
              alreadyLoginStatus: true,
            );
            emit(LoginState.success(response: response));
          } else {
            emit(const LoginState.error(error: "Please try again"));
          }
        }
      } catch (e) {
        emit(LoginState.error(error: e.toString()));
      }
    });
  }
}
