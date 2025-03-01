// app_modules/doctor_module/Doctor_home/service/drlist_ser.dart
import 'dart:convert';
import 'dart:io';

import 'package:doctor_booking_/app_constants/app_urls.dart';
import 'package:doctor_booking_/app_modules/doctor_module/Doctor_home/model/dr_list_model.dart';
import 'package:http/http.dart' as http;

Future<DrListModel> drlist() async {
  try {
    // Construct the URL with query parameters
    final url = Uri.parse(Urls.userViewDoctor).replace(
      queryParameters: {},
    );

    final resp = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = DrListModel.fromJson(decoded);
      return response;
    } else {
      throw Exception('Failed to load response');
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception(e.toString());
  }
}
