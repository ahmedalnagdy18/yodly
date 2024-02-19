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
  final List<ApiReviewItems>? items;

  Data({
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: json["items"] == null
            ? []
            : List<ApiReviewItems>.from(
                json["items"]!.map((x) => ApiReviewItems.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ApiReviewItems {
  final String? id;
  final String? name;
  final String? description;
  final String? title;
  final String country;
  final String city;

  ApiReviewItems({
    required this.id,
    required this.name,
    required this.description,
    required this.title,
    required this.country,
    required this.city,
  });

  factory ApiReviewItems.fromJson(Map<String, dynamic> json) => ApiReviewItems(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        title: json["title"],
        country: json["country"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "title": title,
        "country": country,
        "city": city,
      };
}
