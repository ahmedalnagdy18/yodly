// To parse this JSON data, do
//
//     final apiLogin = apiLoginFromJson(jsonString);

import 'dart:convert';

ApiLogin apiLoginFromJson(String str) => ApiLogin.fromJson(json.decode(str));

String apiLoginToJson(ApiLogin data) => json.encode(data.toJson());

class ApiLogin {
  final EmailAndPasswordLogin? emailAndPasswordLogin;

  ApiLogin({
    this.emailAndPasswordLogin,
  });

  factory ApiLogin.fromJson(Map<String, dynamic> json) => ApiLogin(
        emailAndPasswordLogin: json["emailAndPasswordLogin"] == null
            ? null
            : EmailAndPasswordLogin.fromJson(json["emailAndPasswordLogin"]),
      );

  Map<String, dynamic> toJson() => {
        "emailAndPasswordLogin": emailAndPasswordLogin?.toJson(),
      };
}

class EmailAndPasswordLogin {
  final bool? success;
  final int? code;
  final String? message;
  final Data? data;

  EmailAndPasswordLogin({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory EmailAndPasswordLogin.fromJson(Map<String, dynamic> json) =>
      EmailAndPasswordLogin(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final String? token;
  final String? userName;

  Data({
    this.token,
    this.userName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "userName": userName,
      };
}
