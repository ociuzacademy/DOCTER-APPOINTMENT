// app_modules/register_section/service/userRegister_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:doctor_booking_/app_constants/app_urls.dart';
import 'package:doctor_booking_/app_modules/register_section/model/userRegister_Model.dart';
import 'package:http/http.dart' as http;

Future<UserRegisterModel> userRegister({
  required String name,
  required String phoneNo,
  required String age,
  required String gmail,
  required String paswd,
  required String utype,
}) async {
  try {
    final url = Uri.parse(Urls.userRegister);

    // Prepare the data as a JSON payload
    final Map<String, dynamic> body = {
      'name': name,
      'phone_number': phoneNo,
      'age': age,
      'email': gmail,
      'password': paswd,
      'utype': utype,
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
      final response = UserRegisterModel.fromJson(decoded);
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
