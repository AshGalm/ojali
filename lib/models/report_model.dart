// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

class ReportModel {
  ReportModel({
    required this.title,
    required this.des,
  });

  String title;
  String des;

  factory ReportModel.fromRawJson(String str) =>
      ReportModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        title: json["title"],
        des: json["des"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "des": des,
      };
}
