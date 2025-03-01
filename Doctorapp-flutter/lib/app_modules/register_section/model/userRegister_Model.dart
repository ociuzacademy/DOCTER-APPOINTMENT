// app_modules/register_section/model/userRegister_Model.dart
// To parse this JSON data, do
//
//     final userRegisterModel = userRegisterModelFromJson(jsonString);

import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
    String? status;
    String? message;

    UserRegisterModel({
        this.status,
        this.message,
    });

    factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
