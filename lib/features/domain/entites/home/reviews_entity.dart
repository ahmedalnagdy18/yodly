class ReviewsEntity {
  final int page;
  final int limit;

  ReviewsEntity({required this.page, required this.limit});

  toJson() {
    return {
      "page": page,
      "limit": limit,
    };
  }
}
