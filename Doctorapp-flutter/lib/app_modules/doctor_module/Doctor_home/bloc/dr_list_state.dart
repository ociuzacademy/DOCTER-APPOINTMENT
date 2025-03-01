// app_modules/doctor_module/Doctor_home/bloc/dr_list_state.dart
part of 'dr_list_bloc.dart';

@freezed
class DrListState with _$DrListState {
  const factory DrListState.initial() = _Initial;
  const factory DrListState.loding() = _Loding;
  const factory DrListState.error({required String error}) = _Error;
  const factory DrListState.success({required DrListModel response}) = _Success;
}
