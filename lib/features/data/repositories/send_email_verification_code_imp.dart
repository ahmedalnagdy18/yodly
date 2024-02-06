import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/graph_ql.dart';
import 'package:yodly/features/data/models/api_send_email_verification_code.dart';
import 'package:yodly/features/domain/entites/send_email_verification_code_entity.dart';
import 'package:yodly/features/domain/repositories/send_email_verification_code_repository.dart';

class SendEmailVerificationCodeRepositoryImp
    implements SendEmailVerificationCodeRepository {
  final GraphQLClient graphQLClient;

  SendEmailVerificationCodeRepositoryImp({required this.graphQLClient});

  @override
  Future<void> sendEmailVerificationCode(
      SendEmailVerificationCodeEntity emailVerificationCodeEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(sendEmailVerificationCodee),
        variables: {
          "input": emailVerificationCodeEntity.toJson(),
        },
      ),
    );
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiSendEmailVerificationCode.fromJson(result.data!);
    if (response.sendEmailVerificationCode != null &&
        response.sendEmailVerificationCode?.code == 200) {
      return;
    } else {
      throw Exception();
    }
  }
}
