// app_modules/user_module/profile_section/bloc/profile_state.dart
part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loding() = _Loding;
  const factory ProfileState.error({required String error}) = _Error;
  const factory ProfileState.success({required ProfileModel response}) =
      _Success;
}
