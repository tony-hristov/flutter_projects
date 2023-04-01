import 'package:equatable/equatable.dart';
import 'package:pretty_string/pretty_string.dart';

/// Details of a user's credit score
class CreditScoreEntity extends Equatable {
  /// The user's credit score
  final int score;

  /// Credit rating for the user. One of the following: VeryPoor, Poor, Fair, Good, Excellent
  final String rating;

  /// Date of the the current score
  final DateTime asOfDate;

  /// Change in score since last refresh
  final int scoreChange;

  /// Url to the external provider
  final String providerUrl;

  const CreditScoreEntity({
    required this.score,
    required this.rating,
    required this.asOfDate,
    required this.scoreChange,
    required this.providerUrl,
  });

  CreditRatingType

  @override
  List<Object?> get props => [score, rating, asOfDate, scoreChange, providerUrl];

  @override
  String toString() => toPrettier();
}
