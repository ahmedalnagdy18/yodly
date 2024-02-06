import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/graph_ql.dart';
import 'package:yodly/features/data/models/api_register.dart';
import 'package:yodly/features/domain/entites/register_entity.dart';
import 'package:yodly/features/domain/repositories/register_repository.dart';

class RegisterRepositryImp implements RegisterRepository {
  final GraphQLClient graphQLClient;

  RegisterRepositryImp({required this.graphQLClient});

  @override
  Future<RegisterEntity> registerInput(RegisterEntity registerEntity) async {
    final registerApiResult = await graphQLClient.mutate(MutationOptions(
        document: gql(registerMutation),
        variables: {"input": registerEntity.toJson()}));

    if (registerApiResult.hasException || registerApiResult == null) {
      throw Exception();
    }
    final response = ApiRegisterData.fromJson(registerApiResult.data!).register;
    if (response!.data != null && response.code == 200) {
      return RegisterEntity(
        userName: registerEntity.userName,
        country: registerEntity.country,
        email: registerEntity.email,
        password: registerEntity.password,
        deviceName: registerEntity.deviceName,
      );
    } else {
      throw Exception();
    }
  }
}
