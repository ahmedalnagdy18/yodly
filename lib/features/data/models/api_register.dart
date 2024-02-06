// To parse this JSON data, do
//
//     final apiRegister = apiRegisterFromJson(jsonString);

import 'dart:convert';

ApiRegister apiRegisterFromJson(String str) =>
    ApiRegister.fromJson(json.decode(str));

String apiRegisterToJson(ApiRegister data) => json.encode(data.toJson());

class ApiRegister {
  final ApiRegisterData? data;

  ApiRegister({
    this.data,
  });

  factory ApiRegister.fromJson(Map<String, dynamic> json) => ApiRegister(
        data: json["data"] == null
            ? null
            : ApiRegisterData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class ApiRegisterData {
  final Register? register;

  ApiRegisterData({
    this.register,
  });

  factory ApiRegisterData.fromJson(Map<String, dynamic> json) =>
      ApiRegisterData(
        register: json["register"] == null
            ? null
            : Register.fromJson(json["register"]),
      );

  Map<String, dynamic> toJson() => {
        "register": register?.toJson(),
      };
}

class Register {
  final bool? success;
  final int? code;
  final String? message;
  final RegisterData? data;

  Register({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : RegisterData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class RegisterData {
  final dynamic token;

  RegisterData({
    this.token,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
