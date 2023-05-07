// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.addres,
    required this.phone,
  });

  String name;
  String email;
  String addres;
  String phone;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        addres: json["addres"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "addres": addres,
        "phone": phone,
      };
}
