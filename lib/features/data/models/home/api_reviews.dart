// To parse this JSON data, do
//
//     final apiReviews = apiReviewsFromJson(jsonString);

import 'dart:convert';

ApiReviews apiReviewsFromJson(String str) =>
    ApiReviews.fromJson(json.decode(str));

String apiReviewsToJson(ApiReviews data) => json.encode(data.toJson());

class ApiReviews {
  final Reviews? reviews;

  ApiReviews({
    this.reviews,
  });

  factory ApiReviews.fromJson(Map<String, dynamic> json) => ApiReviews(
        reviews:
            json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
      );

  Map<String, dynamic> toJson() => {
        "reviews": reviews?.toJson(),
      };
}

class Reviews {
  final Data? data;
  final int? code;
  final String? message;
  final bool? success;

  Reviews({
    this.data,
    this.code,
    this.message,
    this.success,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "code": code,
        "message": message,
        "success": success,
      };
}

class Data {
  final List<Item>? items;

  Data({
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final String? id;
  final String? name;
  final String? description;

  Item({
    this.id,
    this.name,
    this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
