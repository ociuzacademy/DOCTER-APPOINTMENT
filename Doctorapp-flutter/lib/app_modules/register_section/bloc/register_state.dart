// app_modules/register_section/bloc/register_state.dart
part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loding() = _Loding;
  const factory RegisterState.error({required String error}) = _Error;
  const factory RegisterState.success({required UserRegisterModel response}) =
      _Success;
      
}
