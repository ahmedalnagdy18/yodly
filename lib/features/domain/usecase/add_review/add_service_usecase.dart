import 'package:yodly/features/domain/entites/add_review/add_service_entity.dart';
import 'package:yodly/features/domain/repositories/add_review/add_review_repository.dart';

class AddServiceUsecase {
  final AddServiceRepository repository;

  AddServiceUsecase({required this.repository});
  Future<void> call(AddServiceEntity addServiceEntity) async {
    return await repository.addService(addServiceEntity);
  }
}
