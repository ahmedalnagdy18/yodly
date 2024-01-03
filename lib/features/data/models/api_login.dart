import 'dart:convert';

ApiLogin apiLoginFromJson(String str) => ApiLogin.fromJson(json.decode(str));

String apiLoginToJson(ApiLogin data) => json.encode(data.toJson());

class ApiLogin {
  EmailAndPasswordLogin? emailAndPasswordLogin;

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
  bool? success;
  int? code;
  String? message;

  EmailAndPasswordLogin({
    this.success,
    this.code,
    this.message,
  });

  factory EmailAndPasswordLogin.fromJson(Map<String, dynamic> json) =>
      EmailAndPasswordLogin(
        success: json["success"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
      };
}
