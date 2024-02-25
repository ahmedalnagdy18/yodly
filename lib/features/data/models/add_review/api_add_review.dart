// To parse this JSON data, do
//
//     final apiAddReviewItems = apiAddReviewItemsFromJson(jsonString);

import 'dart:convert';

ApiAddReviewItems apiAddReviewItemsFromJson(String str) =>
    ApiAddReviewItems.fromJson(json.decode(str));

String apiAddReviewItemsToJson(ApiAddReviewItems data) =>
    json.encode(data.toJson());

class ApiAddReviewItems {
  final Categories? categories;

  ApiAddReviewItems({
    this.categories,
  });

  factory ApiAddReviewItems.fromJson(Map<String, dynamic> json) =>
      ApiAddReviewItems(
        categories: json["categories"] == null
            ? null
            : Categories.fromJson(json["categories"]),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories?.toJson(),
      };
}

class Categories {
  final List<Datum>? data;
  final int? code;
  final bool? success;
  final String? message;

  Categories({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "code": code,
        "success": success,
        "message": message,
      };
}

class Datum {
  final String? id;
  final String? enName;
  final List<Subcategory>? subcategories;

  Datum({
    this.id,
    this.enName,
    this.subcategories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        enName: json["enName"],
        subcategories: json["subcategories"] == null
            ? []
            : List<Subcategory>.from(
                json["subcategories"]!.map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "enName": enName,
        "subcategories": subcategories == null
            ? []
            : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
      };
}

class Subcategory {
  final String? id;
  final String? enName;

  Subcategory({
    this.id,
    this.enName,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        enName: json["enName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "enName": enName,
      };
}
