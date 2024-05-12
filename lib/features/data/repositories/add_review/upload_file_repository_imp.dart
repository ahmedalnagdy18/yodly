import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/data_sources/add_review/add_review_graph_ql.dart';
import 'package:yodly/features/data/models/add_review/api_upload_file.dart';
import 'package:yodly/features/domain/entites/add_review/upload_file_entity.dart';
import 'package:yodly/features/domain/repositories/add_review/add_review_repository.dart';

class UploadFileRepositoryImp implements UploadFileRepository {
  final GraphQLClient graphQLClient;

  UploadFileRepositoryImp({required this.graphQLClient});

  @override
  Future<void> uploadfile(UploadFiledEntity uploadFiledEntity) async {
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(uploadPhoto),
        variables: {"input": uploadFiledEntity.toJson()}));
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiUploadFile.fromJson(result.data!);
    if (response.uploadFile != null && response.uploadFile?.code == 200) {
      return;
    } else {
      throw FormatException(response.uploadFile?.message ?? "");
    }
  }
}
