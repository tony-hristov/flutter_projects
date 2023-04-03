import 'credit_rating_type.dart';

class CreditScoreDisplayViewModel {
  final int score;
  final CreditRatingType rating;
  final DateTime? lastUpdated;
  final int scoreChange;

  CreditScoreDisplayViewModel({
    required this.score,
    required this.rating,
    required this.lastUpdated,
    required this.scoreChange,
  });
}
