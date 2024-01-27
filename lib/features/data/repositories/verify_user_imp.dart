import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/graph_ql.dart';
import 'package:yodly/features/data/models/api_verify_user.dart';
import 'package:yodly/features/domain/entites/verify_user_entity.dart';
import 'package:yodly/features/domain/repositories/verify_user_repository.dart';

class VerifyUserRepositoryImp implements VerifyUserRepository {
  final GraphQLClient graphQLClient;

  VerifyUserRepositoryImp({required this.graphQLClient});

  @override
  Future<void> verifyUserByEmail(VerifyUserEntity verifyUserEntity) async {
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(verifyUserByEmailInput),
        variables: {"input": verifyUserEntity.toJson()}));

    if (result.data == null) {}

    final response = ApiVerifyUserByEmail.fromJson(result.data!);
    log('zzzzzzzzzz');
    if (response.data != null &&
        response.data?.verifyUserByEmail?.code == 200) {
      return;
    } else {
      throw Exception();
    }
  }
}
