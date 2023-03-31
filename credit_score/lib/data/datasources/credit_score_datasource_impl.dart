import 'package:credit_score/data/models/feature_flags_model.dart';

import 'package:credit_score/data/models/credit_score_model.dart';

import 'credit_score_datasource.dart';

class CreditScoreDataSourceImpl implements CreditScoreDataSource {
  @override
  Future<CreditScoreModel> getCreditScoreFromApi() {
    // TODO: implement getCreditScoreFromApi
    throw UnimplementedError();
  }

  @override
  Future<FeatureFlagsModel> getFeatureFlagsFromApi() {
    // TODO: implement getFeatureFlagsFromApi
    throw UnimplementedError();
  }
}
