import 'package:yodly/features/domain/entites/add_review/upload_file_entity.dart';
import 'package:yodly/features/domain/repositories/add_review/add_review_repository.dart';

class UploadFileUsecase {
  final UploadFileRepository repository;

  UploadFileUsecase({required this.repository});
  Future<void> call(UploadFiledEntity uploadFiledEntity) async {
    return await repository.uploadfile(uploadFiledEntity);
  }
}
