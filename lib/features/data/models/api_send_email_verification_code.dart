// To parse this JSON data, do
//
//     final apiSendEmailVerificationCode = apiSendEmailVerificationCodeFromJson(jsonString);

import 'dart:convert';

ApiSendEmailVerificationCode apiSendEmailVerificationCodeFromJson(String str) =>
    ApiSendEmailVerificationCode.fromJson(json.decode(str));

String apiSendEmailVerificationCodeToJson(ApiSendEmailVerificationCode data) =>
    json.encode(data.toJson());

class ApiSendEmailVerificationCode {
  final Data? data;

  ApiSendEmailVerificationCode({
    this.data,
  });

  factory ApiSendEmailVerificationCode.fromJson(Map<String, dynamic> json) =>
      ApiSendEmailVerificationCode(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final SendEmailVerificationCode? sendEmailVerificationCode;

  Data({
    this.sendEmailVerificationCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sendEmailVerificationCode: json["sendEmailVerificationCode"] == null
            ? null
            : SendEmailVerificationCode.fromJson(
                json["sendEmailVerificationCode"]),
      );

  Map<String, dynamic> toJson() => {
        "sendEmailVerificationCode": sendEmailVerificationCode?.toJson(),
      };
}

class SendEmailVerificationCode {
  final bool? data;
  final int? code;
  final bool? success;
  final String? message;

  SendEmailVerificationCode({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory SendEmailVerificationCode.fromJson(Map<String, dynamic> json) =>
      SendEmailVerificationCode(
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
