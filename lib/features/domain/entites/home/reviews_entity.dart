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

class PaginatedData<T> {
  final List<T> data;
  final PageInfo pageInfo;

  PaginatedData({required this.data, required this.pageInfo});
}

class PageInfo {
  final int currentPage;
  final int totalPages;
  final int totalCount;
  final int limit;

  PageInfo({
    required this.currentPage,
    required this.totalPages,
    required this.totalCount,
    required this.limit,
  });
}
