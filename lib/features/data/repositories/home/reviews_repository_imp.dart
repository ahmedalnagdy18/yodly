import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/home/home_graph_ql.dart';
import 'package:yodly/features/data/models/home/api_delete.dart';
import 'package:yodly/features/data/models/home/api_reviews.dart';
import 'package:yodly/features/domain/entites/home/reviews_entity.dart';
import 'package:yodly/features/domain/models/reviews_model.dart';
import 'package:yodly/features/domain/repositories/home/home_repository.dart';

class ReviewsRepositryImp implements ReviewsRepository {
  final GraphQLClient graphQLClient;

  ReviewsRepositryImp({required this.graphQLClient});

  @override
  Future<PaginatedData<ReviewsModels>> reviews(
      ReviewsEntity reviewsEntity) async {
    print('cccccccccccccccccccccccccc');

    final result = await graphQLClient
        .query(QueryOptions(document: gql(reviewsQuery), variables: {
      "paginate":
          ReviewsEntity(limit: reviewsEntity.limit, page: reviewsEntity.page),
    }));
    if (result.data == null) {
      print('ccccccccccccbbbbbbbcccccccccccccc');

      throw Exception();
    }
    print('ccvcvcvcvcvcvcvcvcv');

    final response = ApiReviewItems.fromJson(result.data!);
    if (response.reviews?.data != null && response.reviews?.code == 200) {
      final data = response.reviews?.data?.items ?? [];
      final reviewsList = data.map((e) => e.reviewMap()).toList();
      final pageInfo = response.reviews?.data?.pageInfo?.pageInfoMap() ??
          PageInfo(currentPage: 1, totalPages: 1, totalCount: 15, limit: 15);
      print('..........');
      return PaginatedData(data: reviewsList, pageInfo: pageInfo);
    } else {
      throw FormatException(response.reviews?.message ?? "");
    }
  }

  @override
  Future<void> deleteReview(String id) async {
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(deleteReviewId), variables: {"reviewId": id}));

    final response = ApiDeleteReview.fromJson(result.data!);
    if (response.deleteReview != null && response.deleteReview!.code == 200) {
      return;
    } else {
      throw FormatException(response.deleteReview?.message ?? "");
    }
  }
}
