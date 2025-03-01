// app_modules/doctor_module/Doctor_home/bloc/dr_list_event.dart
part of 'dr_list_bloc.dart';

@freezed
class DrListEvent with _$DrListEvent {
  const factory DrListEvent.started() = _Started;
  const factory DrListEvent.drList() = _DrList;
}
