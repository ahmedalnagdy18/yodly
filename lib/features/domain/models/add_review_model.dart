import 'package:yodly/features/data/models/add_review/api_add_review.dart';

class AddReviewModel {
  final String id;
  final String enName;
  final List<SubCategories> subcategories;

  AddReviewModel(
      {required this.id, required this.enName, required this.subcategories});
}

class SubCategories {
  final String id;
  final String enName;

  SubCategories({required this.id, required this.enName});
}

extension Addrevieww on Datum {
  AddReviewModel reviewMap() {
    return AddReviewModel(
      id: id ?? "",
      enName: enName ?? '',
      subcategories:
          (subcategories?.map((e) => e.addSubCategoryy()) ?? []).toList(),
    );
  }
}

extension AddSubCategory on Subcategory {
  SubCategories addSubCategoryy() {
    return SubCategories(
      enName: enName ?? "",
      id: id ?? "",
    );
  }
}
