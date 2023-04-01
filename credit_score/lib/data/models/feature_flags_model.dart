import 'package:credit_score/domain/entities/feature_flags_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feature_flags_model.g.dart';

@JsonSerializable()
class FeatureFlagsModel extends FeatureFlagsEntity with EquatableMixin {
  FeatureFlagsModel({
    required super.creditScoreEnabled,
    required super.preApprovedOffersEnabled,
  });

  factory FeatureFlagsModel.fromJson(Map<String, dynamic> json) => _$FeatureFlagsModelFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureFlagsModelToJson(this);
}
