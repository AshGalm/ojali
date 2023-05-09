// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

class OrderModel {
  String uid;
  String name;
  String phone;
  String address;
  String status;
  String createdAt;
  List<Order> order;

  OrderModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.order,
  });

  factory OrderModel.fromRawJson(String str) =>
      OrderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        uid: json["uid"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        status: json["status"],
        createdAt: json["created_at"],
        order: List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "phone": phone,
        "address": address,
        "status": status,
        "created_at": createdAt,
        "order": List<dynamic>.from(order.map((x) => x.toJson())),
      };
}

class Order {
  String categoryUid;
  String desAr;
  String desEn;
  String imageUrl;
  String nameAr;
  String nameEn;
  String price;

  Order({
    required this.categoryUid,
    required this.desAr,
    required this.desEn,
    required this.imageUrl,
    required this.nameAr,
    required this.nameEn,
    required this.price,
  });

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        categoryUid: json["category_uid"],
        desAr: json["des_ar"],
        desEn: json["des_en"],
        imageUrl: json["image_url"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "category_uid": categoryUid,
        "des_ar": desAr,
        "des_en": desEn,
        "image_url": imageUrl,
        "name_ar": nameAr,
        "name_en": nameEn,
        "price": price,
      };
}
