import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/core/shared_prefrances/shared_prefrance.dart';
import 'package:yodly/features/data/data_sources/authentication/graph_ql.dart';
import 'package:yodly/features/data/models/authentication/api_verify_user.dart';
import 'package:yodly/features/domain/entites/authentication/verify_user_entity.dart';
import 'package:yodly/features/domain/repositories/authentication/authentication_repository.dart';

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
    if (result.data == null) {}
    final response = ApiVerifyUserByEmail.fromJson(result.data!);
    if (response.verifyUserByEmail != null &&
        response.verifyUserByEmail?.code == 200) {
      final token = response.verifyUserByEmail?.data?.token;

      SharedPrefrance.instanc.setToken(key: 'token', token: token ?? '');
      return;
    } else {
      throw FormatException(response.verifyUserByEmail?.message ?? "");
    }
  }
}
