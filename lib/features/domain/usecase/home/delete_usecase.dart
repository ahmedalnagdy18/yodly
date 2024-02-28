import 'package:yodly/features/domain/repositories/home/home_repository.dart';

class DeleteReviewUsecase {
  final ReviewsRepository repository;

  DeleteReviewUsecase({required this.repository});

  Future<void> call(String id) async {
    return await repository.deleteReview(id);
  }
}
