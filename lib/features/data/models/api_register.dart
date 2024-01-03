import 'dart:convert';

ApiRegister apiRegisterFromJson(String str) =>
    ApiRegister.fromJson(json.decode(str));

String apiRegisterToJson(ApiRegister data) => json.encode(data.toJson());

class ApiRegister {
  final Register? register;

  ApiRegister({
    this.register,
  });

  factory ApiRegister.fromJson(Map<String, dynamic> json) => ApiRegister(
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
  final Data? data;

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
  final String? id;
  final String? userName;

  Data({
    this.id,
    this.userName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
      };
}
