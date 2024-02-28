// To parse this JSON data, do
//
//     final apiDeleteReview = apiDeleteReviewFromJson(jsonString);

import 'dart:convert';

ApiDeleteReview apiDeleteReviewFromJson(String str) =>
    ApiDeleteReview.fromJson(json.decode(str));

String apiDeleteReviewToJson(ApiDeleteReview data) =>
    json.encode(data.toJson());

class ApiDeleteReview {
  final DeleteReview? deleteReview;

  ApiDeleteReview({
    this.deleteReview,
  });

  factory ApiDeleteReview.fromJson(Map<String, dynamic> json) =>
      ApiDeleteReview(
        deleteReview: json["deleteReview"] == null
            ? null
            : DeleteReview.fromJson(json["deleteReview"]),
      );

  Map<String, dynamic> toJson() => {
        "deleteReview": deleteReview?.toJson(),
      };
}

class DeleteReview {
  final int? code;
  final bool? success;
  final String? message;

  DeleteReview({
    this.code,
    this.success,
    this.message,
  });

  factory DeleteReview.fromJson(Map<String, dynamic> json) => DeleteReview(
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
      };
}
