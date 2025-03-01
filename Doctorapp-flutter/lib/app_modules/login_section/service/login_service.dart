// app_modules/login_section/service/login_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:doctor_booking_/app_constants/app_urls.dart';
import 'package:doctor_booking_/app_modules/login_section/model/logi_model.dart';
import 'package:http/http.dart' as http;

Future<LoginModel> login({
  required String gmail,
  required String paswd,
}) async {
  try {
    final url = Uri.parse(Urls.login);

    // Prepare the data as a JSON payload
    final Map<String, dynamic> body = {
      'email': gmail,
      'password': paswd,
    };

    final resp = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = LoginModel.fromJson(decoded);
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
