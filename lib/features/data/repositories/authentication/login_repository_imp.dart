import 'package:yodly/core/shared_prefrances/shared_prefrance.dart';
import 'package:yodly/features/data/data_sources/authentication/graph_ql.dart';
import 'package:yodly/features/data/models/authentication/api_login.dart';
import 'package:yodly/features/domain/entites/authentication/login_entity.dart';
import 'package:yodly/features/domain/repositories/authentication/authentication_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginRepositryImp implements LoginRepository {
  final GraphQLClient graphQLClient;

  LoginRepositryImp({required this.graphQLClient});

  @override
  Future<void> loginWithEmailAndPassword(LoginEntity loginEntity) async {
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(loginMutation),
        variables: {"input": loginEntity.toJson()}));

    final response = ApiLogin.fromJson(result.data!);

    if (response.emailAndPasswordLogin != null &&
        response.emailAndPasswordLogin!.code == 200) {
      final token = response.emailAndPasswordLogin?.data?.token;

      SharedPrefrance.instanc.setToken(key: 'token', token: token ?? '');
      return;
    } else {
      throw FormatException(response.emailAndPasswordLogin?.message ?? "");
    }
  }
}
