import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/add_review/add_review_graph_ql.dart';
import 'package:yodly/features/data/models/add_review/api_add_review.dart';
import 'package:yodly/features/data/models/add_review/api_add_service.dart';
import 'package:yodly/features/domain/entites/add_review/add_service_entity.dart';
import 'package:yodly/features/domain/models/add_review_model.dart';
import 'package:yodly/features/domain/repositories/add_review/add_review_repository.dart';

class AddServiceRepositoryImp implements AddServiceRepository {
  final GraphQLClient graphQLClient;

  AddServiceRepositoryImp({required this.graphQLClient});

  @override
  Future<void> addService(AddServiceEntity addServiceEntity) async {
    print('111111111111111111111');
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(createReview),
        variables: {"input": addServiceEntity.toJson()}));
    print('2222222222');
    if (result.data == null) {
      print('33333333333333');
      throw Exception();
    }
    final response = ApiAddService.fromJson(result.data!);
    print('4444444444444444444444${response.createReview?.message}');
    if (response.createReview != null && response.createReview?.code == 200) {
      print('55555555555555555555');
      return;
    } else {
      print('666666666666666666666');
      throw FormatException(response.createReview?.message ?? "");
    }
  }

  @override
  Future<List<AddReviewModel>> addCategory() async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(categories),
      ),
    );
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiAddReviewItems.fromJson(result.data!);
    if (response.categories != null && response.categories?.code == 200) {
      final data = response.categories?.data ?? [];
      return data.map((e) => e.reviewMap()).toList();
    } else {
      throw FormatException(response.categories?.message ?? "");
    }
  }
}
