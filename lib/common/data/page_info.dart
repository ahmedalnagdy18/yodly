class ApiPageInfo {
  final int? page;
  final int? limit;
  final int? totalCount;
  final int? totalPages;

  ApiPageInfo({
    this.page,
    this.limit,
    this.totalCount,
    this.totalPages,
  });

  factory ApiPageInfo.fromJson(Map<String, dynamic> json) => ApiPageInfo(
        page: json["page"],
        limit: json["limit"],
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "totalCount": totalCount,
        "totalPages": totalPages,
      };
}
