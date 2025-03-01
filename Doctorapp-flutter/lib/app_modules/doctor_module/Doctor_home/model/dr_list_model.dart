// app_modules/doctor_module/Doctor_home/model/dr_list_model.dart
// To parse this JSON data, do
//
//     final drListModel = drListModelFromJson(jsonString);

import 'dart:convert';

DrListModel drListModelFromJson(String str) => DrListModel.fromJson(json.decode(str));

String drListModelToJson(DrListModel data) => json.encode(data.toJson());

class DrListModel {
    int? total;
    List<Doctor>? doctors;

    DrListModel({
        this.total,
        this.doctors,
    });

    factory DrListModel.fromJson(Map<String, dynamic> json) => DrListModel(
        total: json["total"],
        doctors: json["doctors"] == null ? [] : List<Doctor>.from(json["doctors"]!.map((x) => Doctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "doctors": doctors == null ? [] : List<dynamic>.from(doctors!.map((x) => x.toJson())),
    };
}

class Doctor {
    String? name;
    String? email;
    String? phoneNumber;
    String? experience;
    String? image;
    String? specialization;
    String? qualification;

    Doctor({
        this.name,
        this.email,
        this.phoneNumber,
        this.experience,
        this.image,
        this.specialization,
        this.qualification,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        experience: json["experience"],
        image: json["image"],
        specialization: json["specialization"],
        qualification: json["qualification"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "experience": experience,
        "image": image,
        "specialization": specialization,
        "qualification": qualification,
    };
}
