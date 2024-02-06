// To parse this JSON data, do
//
//     final apiVerifyUserByEmail = apiVerifyUserByEmailFromJson(jsonString);

import 'dart:convert';

ApiVerifyUserByEmail apiVerifyUserByEmailFromJson(String str) =>
    ApiVerifyUserByEmail.fromJson(json.decode(str));

String apiVerifyUserByEmailToJson(ApiVerifyUserByEmail data) =>
    json.encode(data.toJson());

class ApiVerifyUserByEmail {
  final Data? data;

  ApiVerifyUserByEmail({
    this.data,
  });

  factory ApiVerifyUserByEmail.fromJson(Map<String, dynamic> json) =>
      ApiVerifyUserByEmail(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final DoesUserWithVerificationCodeExist? doesUserWithVerificationCodeExist;

  Data({
    this.doesUserWithVerificationCodeExist,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
