// To parse this JSON data, do
//
//     final apiAddService = apiAddServiceFromJson(jsonString);

import 'dart:convert';

ApiAddService apiAddServiceFromJson(String str) =>
    ApiAddService.fromJson(json.decode(str));

String apiAddServiceToJson(ApiAddService data) => json.encode(data.toJson());

class ApiAddService {
  final CreateReview? createReview;

  ApiAddService({
    this.createReview,
  });

  factory ApiAddService.fromJson(Map<String, dynamic> json) => ApiAddService(
        createReview: json["createReview"] == null
            ? null
            : CreateReview.fromJson(json["createReview"]),
      );

  Map<String, dynamic> toJson() => {
        "createReview": createReview?.toJson(),
      };
}

class CreateReview {
  final Data? data;
  final int? code;
  final bool? success;
  final String? message;

  CreateReview({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory CreateReview.fromJson(Map<String, dynamic> json) => CreateReview(
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
  final String? title;
  final String? description;
  final String? name;
  final String? overallRating;
  final List<Attachment>? attachments;

  Data({
    this.id,
    this.title,
    this.description,
    this.name,
    this.overallRating,
    this.attachments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        name: json["name"],
        overallRating: json["overallRating"],
        attachments: json["attachments"] == null
            ? []
            : List<Attachment>.from(
                json["attachments"]!.map((x) => Attachment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "name": name,
        "overallRating": overallRating,
        "attachments": attachments == null
            ? []
            : List<dynamic>.from(attachments!.map((x) => x.toJson())),
      };
}

class Attachment {
  final String? attachmentType;
  final String? link;

  Attachment({
    this.attachmentType,
    this.link,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        attachmentType: json["attachmentType"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "attachmentType": attachmentType,
        "link": link,
      };
}
