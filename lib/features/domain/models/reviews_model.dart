import 'package:yodly/features/data/models/home/api_reviews.dart';

class ReviewsModels {
  final String id;
  final String name;
  final String description;
  final String title;
  final String country;
  final String city;
  final String userName;
  final List<Attachment> attachments;
  final List<SpecificRating> specificRating;

  ReviewsModels(
      {required this.id,
      required this.city,
      required this.specificRating,
      required this.userName,
      required this.name,
      required this.description,
      required this.title,
      required this.attachments,
      required this.country});
}

extension PoostItems on Item {
  ReviewsModels reviewMap() {
    return ReviewsModels(
      id: id ?? "",
      city: city ?? "",
      name: name ?? "",
      description: description ?? "",
      title: title ?? "",
      country: country ?? "",
      userName: user?.userName ?? "",
      attachments: attachments ?? [],
      specificRating: specificRating ?? [],
    );
  }
}
