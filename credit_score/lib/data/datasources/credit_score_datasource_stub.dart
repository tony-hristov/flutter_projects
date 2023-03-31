import 'package:credit_score/data/models/feature_flags_model.dart';

import 'package:credit_score/data/models/credit_score_model.dart';

import 'credit_score_datasource.dart';

class CreditScoreDataSourceStub implements CreditScoreDataSource {
  @override
  Future<CreditScoreModel> getCreditScoreFromApi() {
    return Future.value(CreditScoreModel.fromJson(const {
      "score": 780,
      "rating": "Excellent",
      "asOfDate": "2023-03-22",
      "scoreChange": 5,
      "providerUrl": "http://company.com/savvymoney",
    }));
  }

  @override
  Future<FeatureFlagsModel> getFeatureFlagsFromApi() {
    return Future.value(FeatureFlagsModel.fromJson(const {
      "creditScoreEnabled": true,
      "preApprovedOffersEnabled": false,
    }));
  }
}
