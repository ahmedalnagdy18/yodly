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

class PaginatedData<ReviewsModels> {
  final List<ReviewsModels> data;
  final PageInfo pageInfo;

  PaginatedData({required this.data, required this.pageInfo});
}

class PageInfo {
  final int currentPage;
  final int totalPages;

  PageInfo({required this.currentPage, required this.totalPages});
}
