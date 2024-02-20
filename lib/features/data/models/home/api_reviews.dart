// To parse this JSON data, do
//
//     final apiReviews = apiReviewsFromJson(jsonString);

import 'dart:convert';

ApiReviewItems apiReviewsFromJson(String str) =>
    ApiReviewItems.fromJson(json.decode(str));

String apiReviewsToJson(ApiReviewItems data) => json.encode(data.toJson());

class ApiReviewItems {
  final Reviews? reviews;

  ApiReviewItems({
    this.reviews,
  });

  factory ApiReviewItems.fromJson(Map<String, dynamic> json) => ApiReviewItems(
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
  final User? user;
  final String? id;
  final String? name;
  final String? description;
  final String? title;
  final String? country;
  final String? city;

  Item({
    required this.user,
    required this.id,
    required this.name,
    required this.description,
    required this.title,
    required this.country,
    required this.city,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        id: json["id"],
        name: json["name"],
        description: json["description"],
        title: json["title"],
        country: json["country"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "id": id,
        "name": name,
        "description": description,
        "title": title,
        "country": country,
        "city": city,
      };
}

class User {
  final String? userName;

  User({
    this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
      };
}
