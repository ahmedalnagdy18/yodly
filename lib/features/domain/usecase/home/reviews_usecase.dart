import 'package:yodly/features/domain/entites/home/reviews_entity.dart';
import 'package:yodly/features/domain/repositories/home/home_repository.dart';

class ReviewsUsecase {
  final ReviewsRepository repository;

  ReviewsUsecase({required this.repository});

  Future<void> call(ReviewsEntity reviewsEntity) async {
    return await repository.reviews(reviewsEntity);
  }
}
