// app_modules/login_section/model/logi_model.dart
// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    List<Datum>? data;

    LoginModel({
        this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? status;
    String? message;
    String? utype;
    int? id;
    String? name;

    Datum({
        this.status,
        this.message,
        this.utype,
        this.id,
        this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json["status"],
        message: json["message"],
        utype: json["utype"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "utype": utype,
        "id": id,
        "name": name,
    };
}
