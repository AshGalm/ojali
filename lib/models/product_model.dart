import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.nameAr,
    required this.nameEn,
    required this.imageUrl,
    required this.categoryUid,
    required this.desAr,
    required this.desEn,
    required this.price,
  });

  String nameAr;
  String nameEn;
  String imageUrl;
  String categoryUid;
  String desAr;
  String desEn;
  String price;

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        imageUrl: json["image_url"],
        categoryUid: json["category_uid"],
        desAr: json["des_ar"],
        desEn: json["des_en"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name_ar": nameAr,
        "name_en": nameEn,
        "image_url": imageUrl,
        "category_uid": categoryUid,
        "des_ar": desAr,
        "des_en": desEn,
        "price": price,
      };
}
