/// Credit rating for the user. One of the following: VeryPoor, Poor, Fair, Good, Excellent
enum CreditRatingType {
  undefined(null),
  veryPoor('VeryPoor'),
  poor('Poor'),
  fair('Fair'),
  good('Good'),
  excellent('Excellent'),
  ;

  const CreditRatingType(this.rating);
  final String? rating;
}
