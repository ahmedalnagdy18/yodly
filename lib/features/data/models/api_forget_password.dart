import 'dart:convert';

ApiForgetPassword apiForgetPasswordFromJson(String str) =>
    ApiForgetPassword.fromJson(json.decode(str));

String apiForgetPasswordToJson(ApiForgetPassword data) =>
    json.encode(data.toJson());

class ApiForgetPassword {
  final ResetPasswordByEmail? resetPasswordByEmail;

  ApiForgetPassword({
    this.resetPasswordByEmail,
  });

  factory ApiForgetPassword.fromJson(Map<String, dynamic> json) =>
      ApiForgetPassword(
        resetPasswordByEmail: json["resetPasswordByEmail"] == null
            ? null
            : ResetPasswordByEmail.fromJson(json["resetPasswordByEmail"]),
      );

  Map<String, dynamic> toJson() => {
        "resetPasswordByEmail": resetPasswordByEmail?.toJson(),
      };
}

class ResetPasswordByEmail {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  ResetPasswordByEmail({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory ResetPasswordByEmail.fromJson(Map<String, dynamic> json) =>
      ResetPasswordByEmail(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
  final String? id;

  Data({
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
