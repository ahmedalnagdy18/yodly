import 'package:yodly/features/data/models/home/api_reviews.dart';

class AddServiceEntity {
  final String categoryId;
  final String subcategoryId;
  final String title;
  final String name;
  final String description;
  final String type;
  final String overallRating;
  final Attachment attachments;

  AddServiceEntity(
      {required this.categoryId,
      required this.subcategoryId,
      required this.title,
      required this.name,
      required this.description,
      required this.type,
      required this.overallRating,
      required this.attachments});

  toJson() {
    return {
      "categoryId": categoryId,
      "subcategoryId": subcategoryId,
      "title": title,
      "name": name,
      "description": description,
      "type": type,
      "overallRating": overallRating,
      "attachments": attachments,
    };
  }
}
