// app_modules/user_module/profile_section/model/model.dart
// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    String? name;
    String? email;
    String? age;
    String? phoneNumber;
    dynamic image;

    ProfileModel({
        this.name,
        this.email,
        this.age,
        this.phoneNumber,
        this.image,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        email: json["email"],
        age: json["age"],
        phoneNumber: json["phone_number"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "age": age,
        "phone_number": phoneNumber,
        "image": image,
    };
}
