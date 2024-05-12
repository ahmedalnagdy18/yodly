import 'package:yodly/features/domain/models/add_review_model.dart';
import 'package:yodly/features/domain/repositories/add_review/add_review_repository.dart';

class AddReviewUsecase {
  final AddServiceRepository repository;

  AddReviewUsecase({required this.repository});
  Future<List<AddReviewModel>> call() async {
    return await repository.addCategory();
  }
}
