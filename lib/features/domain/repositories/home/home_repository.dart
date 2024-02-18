import 'package:yodly/features/domain/entites/home/reviews_entity.dart';

abstract class ReviewsRepository {
  Future<void> reviews(ReviewsEntity reviewsEntity);
}
