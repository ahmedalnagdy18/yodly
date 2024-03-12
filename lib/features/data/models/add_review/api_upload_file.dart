// To parse this JSON data, do
//
//     final apiUploadFile = apiUploadFileFromJson(jsonString);

import 'dart:convert';

ApiUploadFile apiUploadFileFromJson(String str) =>
    ApiUploadFile.fromJson(json.decode(str));

String apiUploadFileToJson(ApiUploadFile data) => json.encode(data.toJson());

class ApiUploadFile {
  final UploadFile? uploadFile;

  ApiUploadFile({
    this.uploadFile,
  });

  factory ApiUploadFile.fromJson(Map<String, dynamic> json) => ApiUploadFile(
        uploadFile: json["uploadFile"] == null
            ? null
            : UploadFile.fromJson(json["uploadFile"]),
      );

  Map<String, dynamic> toJson() => {
        "uploadFile": uploadFile?.toJson(),
      };
}

class UploadFile {
  final String? data;
  final int? code;
  final bool? success;
  final String? message;

  UploadFile({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory UploadFile.fromJson(Map<String, dynamic> json) => UploadFile(
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
