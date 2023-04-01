import 'package:credit_score/data/models/credit_score_model.dart';
import 'package:credit_score/data/models/feature_flags_model.dart';

abstract class CreditScoreDataSource {
  Future<FeatureFlagsModel> getFeatureFlagsFromApi();
  Future<CreditScoreModel> getCreditScoreFromApi();
}
