import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/graph_ql.dart';
import 'package:yodly/features/data/models/api_register.dart';
import 'package:yodly/features/domain/entites/register_entity.dart';
import 'package:yodly/features/domain/repositories/register_repository.dart';

class RegisterRepositryImp implements RegisterRepository {
  final GraphQLClient graphQLClient;

  RegisterRepositryImp({required this.graphQLClient});

  @override
  Future<void> registerInput(RegisterEntity registerEntity) async {
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(regesturMutation),
        variables: {"input": registerEntity.toJson()}));

    if (result.data == null) {}

    final response = ApiRegister.fromJson(result.data!);
    if (response.register != null && response.register!.code == 200) {
      return;
    } else {
      throw Exception();
    }
  }
}
