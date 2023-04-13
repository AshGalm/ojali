import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.thumbnail,
    required this.categoryAr,
    required this.categoryEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.price,
  });

  int id;
  String titleAr;
  String titleEn;
  String thumbnail;
  String categoryAr;
  String categoryEn;
  String descriptionAr;
  String descriptionEn;
  String price;

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        thumbnail: json["thumbnail"],
        categoryAr: json["category_ar"],
        categoryEn: json["category_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_ar": titleAr,
        "title_en": titleEn,
        "thumbnail": thumbnail,
        "category_ar": categoryAr,
        "category_en": categoryEn,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "price": price,
      };
}
