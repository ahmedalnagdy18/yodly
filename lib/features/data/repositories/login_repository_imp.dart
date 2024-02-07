import 'dart:developer';

import 'package:yodly/features/data/data_sources/graph_ql.dart';
import 'package:yodly/features/data/models/api_login.dart';
import 'package:yodly/features/domain/entites/login_entity.dart';
import 'package:yodly/features/domain/repositories/login_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginRepositryImp implements LoginRepository {
  final GraphQLClient graphQLClient;

  LoginRepositryImp({required this.graphQLClient});

  @override
  Future<void> loginWithEmailAndPassword(LoginEntity loginEntity) async {
    print("11111111111");
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(loginMutation),
        variables: {"input": loginEntity.toJson()}));
    print("22222222");

    if (result.data == null) {}

    final response = ApiLogin.fromJson(result.data!);
    print("3333333333");
    log('zzzzzzzzzz');
    if (response.emailAndPasswordLogin != null &&
        response.emailAndPasswordLogin!.code == 200) {
      return;
    } else {
      print("44444444444");
      throw Exception();
    }
  }
}
