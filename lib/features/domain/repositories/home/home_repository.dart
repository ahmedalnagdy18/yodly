import 'package:yodly/features/domain/entites/home/reviews_entity.dart';
import 'package:yodly/features/domain/models/reviews_model.dart';

abstract class ReviewsRepository {
  Future<List<ReviewsModels>> reviews(ReviewsEntity reviewsEntity);
}
