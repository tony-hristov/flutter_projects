import 'package:credit_score/domain/entities/credit_score_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credit_score_model.g.dart';

@JsonSerializable()
class CreditScoreModel extends CreditScoreEntity with EquatableMixin {
  CreditScoreModel({
    required super.score,
    required super.rating,
    required super.asOfDate,
    required super.scoreChange,
    required super.providerUrl,
  });

  factory CreditScoreModel.fromJson(Map<String, dynamic> json) => _$CreditScoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreditScoreModelToJson(this);
}
