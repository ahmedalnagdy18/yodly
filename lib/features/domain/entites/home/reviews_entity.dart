class ReviewsEntity {
  final String page;
  final String limit;

  ReviewsEntity({required this.page, required this.limit});

  toJson() {
    return {
      "page": page,
      "limit": limit,
    };
  }
}
