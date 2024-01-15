import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/graph_ql.dart';
import 'package:yodly/features/data/models/api_forget_password.dart';
import 'package:yodly/features/domain/entites/forget_password_entity.dart';
import 'package:yodly/features/domain/repositories/forget_password._repository.dart';

class ForgetPasswordRepositryImp implements ForgetPasswordRepository {
  final GraphQLClient graphQLClient;

  ForgetPasswordRepositryImp({required this.graphQLClient});

  @override
  Future<void> resetPasswordByEmail(
      ForgetPasswordEntity forgetPasswordEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(forgetPasswordMutation),
        variables: {
          "input": forgetPasswordEntity.toJson(),
        },
      ),
    );

    print(result.data);
    if (result.data == null) {
      throw Exception();
    }

    final response = ApiForgetPassword.fromJson(result.data!);
    log('zzzzzzzzzz');
    if (response.resetPasswordByEmail != null &&
        response.resetPasswordByEmail!.code == 200) {
      return;
    } else {
      throw Exception();
    }
  }
}
