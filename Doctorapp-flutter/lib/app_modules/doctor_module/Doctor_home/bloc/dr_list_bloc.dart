// app_modules/doctor_module/Doctor_home/bloc/dr_list_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:doctor_booking_/app_modules/doctor_module/Doctor_home/model/dr_list_model.dart';
import 'package:doctor_booking_/app_modules/doctor_module/Doctor_home/service/drlist_ser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dr_list_event.dart';
part 'dr_list_state.dart';
part 'dr_list_bloc.freezed.dart';

class DrListBloc extends Bloc<DrListEvent, DrListState> {
  DrListBloc() : super(const _Initial()) {
    on<DrListEvent>((event, emit) async {
      try {
        emit(const DrListState.loding());
        if (event is _DrList) {
          // Call login service
          final response = await drlist();

          emit(DrListState.success(response: response));
        }
      } catch (e) {
        emit(DrListState.error(error: e.toString()));
      }
    });
  }
}
