// To parse this JSON data, do
//
//     final branchesModel = branchesModelFromJson(jsonString);

import 'dart:convert';

class BranchesModel {
  BranchesModel({
    required this.nameAr,
    required this.nameEn,
    required this.imageUrl,
    required this.desAr,
    required this.desEn,
    required this.openTime,
    required this.phone,
    required this.phone2,
  });

  String nameAr;
  String nameEn;
  String imageUrl;
  String desAr;
  String desEn;
  String openTime;
  String phone;
  String phone2;

  factory BranchesModel.fromRawJson(String str) =>
      BranchesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BranchesModel.fromJson(Map<String, dynamic> json) => BranchesModel(
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        imageUrl: json["image_url"],
        desAr: json["des_ar"],
        desEn: json["des_en"],
        openTime: json["open_time"],
        phone: json["phone"],
        phone2: json["phone2"],
      );

  Map<String, dynamic> toJson() => {
        "name_ar": nameAr,
        "name_en": nameEn,
        "image_url": imageUrl,
        "des_ar": desAr,
        "des_en": desEn,
        "open_time": openTime,
        "phone": phone,
        "phone2": phone2,
      };
}
