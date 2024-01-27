import 'dart:convert';

ApiVerifyUserByEmail apiVerifyUserByEmailFromJson(String str) =>
    ApiVerifyUserByEmail.fromJson(json.decode(str));

String apiVerifyUserByEmailToJson(ApiVerifyUserByEmail data) =>
    json.encode(data.toJson());

class ApiVerifyUserByEmail {
  final ApiVerifyUserByEmailData? data;

  ApiVerifyUserByEmail({
    this.data,
  });

  factory ApiVerifyUserByEmail.fromJson(Map<String, dynamic> json) =>
      ApiVerifyUserByEmail(
        data: json["data"] == null
            ? null
            : ApiVerifyUserByEmailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class ApiVerifyUserByEmailData {
  final VerifyUserByEmail? verifyUserByEmail;

  ApiVerifyUserByEmailData({
    this.verifyUserByEmail,
  });

  factory ApiVerifyUserByEmailData.fromJson(Map<String, dynamic> json) =>
      ApiVerifyUserByEmailData(
        verifyUserByEmail: json["verifyUserByEmail"] == null
            ? null
            : VerifyUserByEmail.fromJson(json["verifyUserByEmail"]),
      );

  Map<String, dynamic> toJson() => {
        "verifyUserByEmail": verifyUserByEmail?.toJson(),
      };
}

class VerifyUserByEmail {
  final VerifyUserByEmailData? data;
  final int? code;
  final bool? success;
  final String? message;

  VerifyUserByEmail({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory VerifyUserByEmail.fromJson(Map<String, dynamic> json) =>
      VerifyUserByEmail(
        data: json["data"] == null
            ? null
            : VerifyUserByEmailData.fromJson(json["data"]),
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "code": code,
        "success": success,
        "message": message,
      };
}

class VerifyUserByEmailData {
  final String? id;

  VerifyUserByEmailData({
    this.id,
  });

  factory VerifyUserByEmailData.fromJson(Map<String, dynamic> json) =>
      VerifyUserByEmailData(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
