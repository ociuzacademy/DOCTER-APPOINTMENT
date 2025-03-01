// app_modules/user_module/profile_section/service/profile_service.dart
import 'dart:convert';
import 'dart:io';

import 'package:doctor_booking_/app_constants/app_urls.dart';
import 'package:doctor_booking_/app_localdata/isar_functions/isar_functions.dart';
import 'package:doctor_booking_/app_modules/user_module/profile_section/model/model.dart';
import 'package:http/http.dart' as http;

Future<ProfileModel> profile() async {
  try {
    final userid = await IsarServices().getUserDocNo();
    //  final utype = await IsarServices().();
    // Prepare the URL with query parameters
    final url = Uri.parse(Urls.viewUserProfile).replace(
      queryParameters: {
        'id': userid,
      },
    );

    // Send the GET request
    final resp = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = ProfileModel.fromJson(decoded);
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
