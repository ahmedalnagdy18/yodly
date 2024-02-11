import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/graph_ql.dart';
import 'package:yodly/features/data/models/api_does_verification_exist.dart';
import 'package:yodly/features/domain/entites/does_verification_exist_entity.dart';
import 'package:yodly/features/domain/repositories/does_verification_exist_repository.dart';

class DoesVerificationExistRepositryImp
    implements DoesVerificationExistRepository {
  final GraphQLClient graphQLClient;

  DoesVerificationExistRepositryImp({required this.graphQLClient});

  @override
  Future<void> doesUserWithVerificationCodeExist(
      DoesVerificationExistEntity doesVerificationExistEntity) async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(verficationOtpQuery),
        variables: {
          "input": doesVerificationExistEntity.toJson(),
        },
      ),
    );
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiDoesVerificationExist.fromJson(result.data!);
    if (response.doesUserWithVerificationCodeExist != null &&
        response.doesUserWithVerificationCodeExist?.code == 200) {
      return;
    } else {
      throw FormatException(
          response.doesUserWithVerificationCodeExist?.message ?? "");
    }
  }
}
