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
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(verifyUserByEmailInput),
        variables: {
          "input": verifyUserEntity.toJson(),
        },
      ),
    );
    print('11111111111111');
    if (result.data == null) {}
    print('222222222222222');
    final response = ApiVerifyUserByEmail.fromJson(result.data!);
    print('33333333333333333');
    if (response.verifyUserByEmail != null &&
        response.verifyUserByEmail?.code == 200) {
      print('44444444444444444');
      return;
    } else {
      throw FormatException(response.verifyUserByEmail?.message ?? "");
    }
  }
}
