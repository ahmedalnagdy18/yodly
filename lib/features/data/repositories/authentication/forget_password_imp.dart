import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/authentication/graph_ql.dart';
import 'package:yodly/features/data/models/authentication/api_forget_password.dart';
import 'package:yodly/features/domain/entites/authentication/forget_password_entity.dart';
import 'package:yodly/features/domain/repositories/authentication/authentication_repository.dart';

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

    if (result.data == null) {
      throw Exception();
    }

    final response = ApiForgetPassword.fromJson(result.data!);
    if (response.resetPasswordByEmail != null &&
        response.resetPasswordByEmail!.code == 200) {
      return;
    } else {
      throw FormatException(response.resetPasswordByEmail?.message ?? "");
    }
  }
}
