// app_modules/user_module/profile_section/bloc/profile_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:doctor_booking_/app_modules/user_module/profile_section/model/model.dart';
import 'package:doctor_booking_/app_modules/user_module/profile_section/service/profile_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const _Initial()) {
    on<ProfileEvent>((event, emit) async {
      try {
        emit(const ProfileState.loding());
        if (event is _Login) {
          // Call login service
          final response = await profile();
          emit(ProfileState.success(response: response));
        }
      } catch (e) {
        emit(ProfileState.error(error: e.toString()));
      }
    });
  }
}
