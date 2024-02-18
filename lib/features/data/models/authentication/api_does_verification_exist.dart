// To parse this JSON data, do
//
//     final apiDoesVerificationExist = apiDoesVerificationExistFromJson(jsonString);

import 'dart:convert';

ApiDoesVerificationExist apiDoesVerificationExistFromJson(String str) =>
    ApiDoesVerificationExist.fromJson(json.decode(str));

String apiDoesVerificationExistToJson(ApiDoesVerificationExist data) =>
    json.encode(data.toJson());

class ApiDoesVerificationExist {
  final DoesUserWithVerificationCodeExist? doesUserWithVerificationCodeExist;

  ApiDoesVerificationExist({
    this.doesUserWithVerificationCodeExist,
  });

  factory ApiDoesVerificationExist.fromJson(Map<String, dynamic> json) =>
      ApiDoesVerificationExist(
        doesUserWithVerificationCodeExist:
            json["doesUserWithVerificationCodeExist"] == null
                ? null
                : DoesUserWithVerificationCodeExist.fromJson(
                    json["doesUserWithVerificationCodeExist"]),
      );

  Map<String, dynamic> toJson() => {
        "doesUserWithVerificationCodeExist":
            doesUserWithVerificationCodeExist?.toJson(),
      };
}

class DoesUserWithVerificationCodeExist {
  final bool? data;
  final int? code;
  final bool? success;
  final String? message;

  DoesUserWithVerificationCodeExist({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory DoesUserWithVerificationCodeExist.fromJson(
          Map<String, dynamic> json) =>
      DoesUserWithVerificationCodeExist(
        data: json["data"],
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "code": code,
        "success": success,
        "message": message,
      };
}
