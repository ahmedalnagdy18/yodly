import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/home/home_graph_ql.dart';
import 'package:yodly/features/data/models/home/api_reviews.dart';
import 'package:yodly/features/domain/entites/home/reviews_entity.dart';
import 'package:yodly/features/domain/models/reviews_model.dart';
import 'package:yodly/features/domain/repositories/home/home_repository.dart';

class ReviewsRepositryImp implements ReviewsRepository {
  final GraphQLClient graphQLClient;

  ReviewsRepositryImp({required this.graphQLClient});

  @override
  Future<List<ReviewsModels>> reviews() async {
    final result = await graphQLClient
        .query(QueryOptions(document: gql(reviewsQuery), variables: {
      "paginate": ReviewsEntity(limit: 10, page: 1),
    }));
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiReviews.fromJson(result.data!);
    if (response.reviews?.data != null && response.reviews?.code == 200) {
      final data = response.reviews?.data?.items ?? [];
      return data.map((e) => e.reviewMap()).toList();
    } else {
      throw FormatException(response.reviews?.message ?? "");
    }
  }
}
