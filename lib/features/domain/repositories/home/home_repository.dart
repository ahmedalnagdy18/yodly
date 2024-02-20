import 'package:yodly/features/domain/models/reviews_model.dart';

abstract class ReviewsRepository {
  Future<List<ReviewsModels>> reviews();
}
