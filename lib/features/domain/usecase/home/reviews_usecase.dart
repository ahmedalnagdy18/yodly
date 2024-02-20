import 'package:yodly/features/domain/models/reviews_model.dart';
import 'package:yodly/features/domain/repositories/home/home_repository.dart';

class ReviewsUsecase {
  final ReviewsRepository repository;

  ReviewsUsecase({required this.repository});

  Future<List<ReviewsModels>> call() async {
    return await repository.reviews();
  }
}
