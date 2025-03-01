// app_modules/register_section/service/doctorReg_service.dart.dart
import 'dart:convert';
import 'dart:io';
import 'package:doctor_booking_/app_constants/app_urls.dart';
import 'package:doctor_booking_/app_modules/register_section/model/userRegister_Model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<UserRegisterModel> drRegister({
  required String name,
  required String phonenumber,
  required String specialization,
  required String email,
  required String qualification,
  required String age,
  required String experience,
  required String status,
  required File image,
  required String doctorfee,
  required String password,
  required String utype,
}) async {
  try {
    final url = Uri.parse(Urls.doctorRegister);

    var request = http.MultipartRequest('POST', url);

    // Add the text fields
    request.fields['name'] = name;
    request.fields['phone_number'] = phonenumber;
    request.fields['age'] = age;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['utype'] = utype;
    request.fields['doctor_fee'] = doctorfee;
    request.fields['experience'] = experience;
    request.fields['qualification'] = qualification;
    request.fields['specialization'] = specialization;
    request.fields['status'] = status;

    // Add the image file
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        image.path, // Use the path of the File object
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    // Send the request
    var response = await request.send();

    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      final Map<String, dynamic> decoded = jsonDecode(respStr);
      return UserRegisterModel.fromJson(decoded);
    } else {
      throw Exception('Failed to load response: ${response.statusCode}');
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
