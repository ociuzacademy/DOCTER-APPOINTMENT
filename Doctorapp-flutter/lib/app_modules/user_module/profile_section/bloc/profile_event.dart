// app_modules/user_module/profile_section/bloc/profile_event.dart
part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = _Started;
    const factory ProfileEvent.profile() = _Login;
}
